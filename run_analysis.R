run_analysis <- function(URL){
        
        # First create the variable URL <- "..." in your working environement with the link to the data.
        
        if (!getwd() == "./sample_data") {
                dir.create("./sample_data")
        }
        
        setwd("./sample_data") 
        
        rm(list = ls(all = TRUE)) # Clears the global environement within working directory
        
        library(plyr) # Load plyr 
        library(data.table) # Load data.table (faster handling of data)
        library(dplyr) # Load dplyr, the new brother of plyr
        
        
        tmp <- tempfile() # Create temporay file for the download file
        download.file(URL,tmp,method = "curl") # Download file into tmp
        unzip(tmp, list = TRUE) # Unzip tmp to extract the list of content (to decide which data is applicable) but not the data yet
        YTest <- read.table(unzip(tmp, "UCI HAR Dataset/test/y_test.txt"))      # Test set
        XTest <- read.table(unzip(tmp, "UCI HAR Dataset/test/X_test.txt"))      # Test labels      
        SubjectTest <- read.table(unzip(tmp, "UCI HAR Dataset/test/subject_test.txt"))  # Identifier for the participants performing the test (-activity)
        YTrain <- read.table(unzip(tmp, "UCI HAR Dataset/train/y_train.txt"))   # Training set
        XTrain <- read.table(unzip(tmp, "UCI HAR Dataset/train/X_train.txt"))   # Training labels
        SubjectTrain <- read.table(unzip(tmp, "UCI HAR Dataset/train/subject_train.txt"))       # Identifier for the subjects performing the training (-activity)
        Features <- read.table(unzip(tmp, "UCI HAR Dataset/features.txt"))      # Selected and filtered features (e.g. tBodyAcc-XYZ...) from a 3D raw data signal database
        unlink(tmp)     # Remove link to the temporary file (tmp)
        
        # Insert column names (variables) into the data sets (XTrain, XTest)
        colnames(XTrain) <- t(Features[2])
        colnames(XTest) <- t(Features[2])
        
        # Add to the XTest and XTrain data set activity and participants variables
        XTrain$activities <- YTrain[, 1]
        XTrain$participants <- SubjectTrain[, 1]
        XTest$activities <- YTest[, 1]
        XTest$participants <- SubjectTest[, 1]
        
        # Merges X-Training and X-Test set and remove duplicates
        Master <- rbind(XTrain, XTest)
        duplicated(colnames(Master))
        Master <- Master[, !duplicated(colnames(Master))]
        
        # Extracts the measurements for mean and standard deviation (std) for each feature and creates two data.frames accordingly
        Mean <- grep("mean()", names(Master), value = FALSE, fixed = TRUE)
        #In addition, we need to include 555:559 as they have means and are associated with the gravity terms
        Mean <- append(Mean, 471:477)
        FeatureMeanMatrix <- Master[Mean]
        # Same for STD
        STD <- grep("std()", names(Master), value = FALSE)
        FeatureSTDMatrix <- Master[STD]
        
        # Use descriptive activity names (as described in activitylabels.txt) to rename the activities in "Master"
        Master$activities <- as.character(Master$activities)
        Master$activities[Master$activities == 1] <- "Walking"
        Master$activities[Master$activities == 2] <- "Walking Upstairs"
        Master$activities[Master$activities == 3] <- "Walking Downstairs"
        Master$activities[Master$activities == 4] <- "Sitting"
        Master$activities[Master$activities == 5] <- "Standing"
        Master$activities[Master$activities == 6] <- "Laying"
        Master$activities <- as.factor(Master$activities)
        
        # Label the data set with descriptive variable names (e.g. "Acc"="Accelerator")
        names(Master)  # Summary of all names
        names(Master) <- gsub("Acc", "Accelerator", names(Master))
        names(Master) <- gsub("Mag", "Magnitude", names(Master))
        names(Master) <- gsub("Gyro", "Gyroscope", names(Master))
        names(Master) <- gsub("^t", "time", names(Master))
        names(Master) <- gsub("^f", "frequency", names(Master))
        
        # Label the participants numbers appropriately (e.g. "1" = "Participant 1")
        Master$participants <- as.character(Master$participants)
        Master$participants[Master$participants == 1] <- "Participant 1"
        Master$participants[Master$participants == 2] <- "Participant 2"
        Master$participants[Master$participants == 3] <- "Participant 3"
        Master$participants[Master$participants == 4] <- "Participant 4"
        Master$participants[Master$participants == 5] <- "Participant 5"
        Master$participants[Master$participants == 6] <- "Participant 6"
        Master$participants[Master$participants == 7] <- "Participant 7"
        Master$participants[Master$participants == 8] <- "Participant 8"
        Master$participants[Master$participants == 9] <- "Participant 9"
        Master$participants[Master$participants == 10] <- "Participant 10"
        Master$participants[Master$participants == 11] <- "Participant 11"
        Master$participants[Master$participants == 12] <- "Participant 12"
        Master$participants[Master$participants == 13] <- "Participant 13"
        Master$participants[Master$participants == 14] <- "Participant 14"
        Master$participants[Master$participants == 15] <- "Participant 15"
        Master$participants[Master$participants == 16] <- "Participant 16"
        Master$participants[Master$participants == 17] <- "Participant 17"
        Master$participants[Master$participants == 18] <- "Participant 18"
        Master$participants[Master$participants == 19] <- "Participant 19"
        Master$participants[Master$participants == 20] <- "Participant 20"
        Master$participants[Master$participants == 21] <- "Participant 21"
        Master$participants[Master$participants == 22] <- "Participant 22"
        Master$participants[Master$participants == 23] <- "Participant 23"
        Master$participants[Master$participants == 24] <- "Participant 24"
        Master$participants[Master$participants == 25] <- "Participant 25"
        Master$participants[Master$participants == 26] <- "Participant 26"
        Master$participants[Master$participants == 27] <- "Participant 27"
        Master$participants[Master$participants == 28] <- "Participant 28"
        Master$participants[Master$participants == 29] <- "Participant 29"
        Master$participants[Master$participants == 30] <- "Participant 30"
        Master$participants <- as.factor(Master$participants)
        
        # Create the final tidy data set
        Master.dt <- data.table(Master)
        #This takes the mean of every column broken down by participants and activities
        TidyData <- Master.dt[, lapply(.SD, mean), by = 'participants,activities']
        write.table(TidyData, file = "tidy_data_set.txt", row.names = FALSE)
        
}

