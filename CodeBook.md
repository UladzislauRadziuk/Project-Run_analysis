|-**run_analysis CodeBook Version 1.0**

|-**Summary** --------------------------------------------------------------------------------------------------

run_analysis describes the transformation of the data (UCI HAR Dataset) using the run analysis.R function into a tidy_data_set. 

Raw data is from: 
UCI HAR Dataset, Human Activity Recognition Using Smartphones Dataset, Owner: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Universit‡ degli Studi di Genova.Via Opera Pia 11A, I-16145, Genoa, Italy.activityrecognition@smartlab.ws, www.smartlab.ws

|-**Data Description** ------------------------------------------------------------------------------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

|--**Transformation**----------------------------------------------------------------------------------------------

Description of the transformation performed with the data to clean up the data set and create the final tidy_data_set.txt

1. Merges the training and test sets to create one data set:

1.1. For the set up of the Master data set the following data was extracted out of the UCI HAR Dataset:

-YTest          (Test set, activity levels e.g. 1 Walking, 2 Walking_Upstairs) 
-XTest          (Test labels)
-SubjectTest    (Identifier for participants performing the test-activity)
-YTrain         (Training set, activity levels e.g. 1 Walking, 2 Walking_Upstairs)
-XTrain         (Training labels)
-SubjectTrain   (Identifier for the participants performing the training-activity)
-Features       (feature(e.g. tBodyAcc-XYZ...) list of variables (like "mean value" or "standard deviation" etc.) 
                that where applied on a set of filtered acceleration and gyroscope 3D signals, from 3D raw data signal database)

1.2.: the feature list was added as variables to the XTrain and XTest set.
1.3.: the identifier of the participants and activities was added to the XTrain and XTest sets.
1.4.: the XTrain and XTest set were combined into a Master set to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement:

2.1. Two feature data.frames were created from the Master set one with all STD featuers and one with all Mean features

3 Uses descriptive activity names to name the activities in the data set:

3.1 Add to the Master set the complete names of the activity level ("Sitting","Standing", "Walking" etc.) 

4 Appropriately labels the data set with descriptive variable names:

4.1 Change in the Master set the shortcuts like "Acc" into "Accelerator" and labels like "1" into "Participant 1"

5 Create an independent tidy data set with the average of each variable for each activity and each subject:

5.1 Create a new data table "TidyData" with the average of each activity and participant and write it into "tidy_data_set.txt". 
For further details of the variables please see below. 

|--**Variables**--------------------------------------------------------------------------------------------------

Summary of variables derived from signals: 

Each of the 479 variables in the tidy_data_set is in one column and numbered accordingly (column 1:479). The variable names are defined according to the body movement of the participants and are measuered with two sensors a accelerometer and a gyroscope. The data was recorded as a raw 3D signal (tAcc-XYZ and tGyro-XYZ) where t = time, Acc = Acceleration, XYZ = 3 Dimensions and Gyro = gyroscope. Out of this raw data the acceleration data was further splitted into a body- and a gravity acceleration signal-features:

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyGyro-XYZ  

The acceleration singal was further processed to obtain Jerk signals-features:

tBodyAccJerk-XYZ  
tBodyGyroJerk-XYZ  

Using the four feature signals above the magnitude was also calculated and derived into these new features:

tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  

Also the Fast Fourier Transform (FFT) was applied on these features, producing the following featueres indicated with a "f":

fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

Summery of signals: 

tBodyAcc-XYZ              
tGravityAcc-XYZ           
tBodyAccJerk-XYZ          
tBodyGyro-XYZ             
tBodyGyroJerk-XYZ         
tBodyAccMag               
tGravityAccMag            
tBodyAccJerkMag           
tBodyGyroMag              
tBodyGyroJerkMag          
fBodyAcc-XYZ              
fBodyAccJerk-XYZ          
fBodyGyro-XYZ             
fBodyAccMag               
fBodyAccJerkMag           
fBodyGyroMag              
fBodyGyroJerkMag          

Summary of variables estimated with the signals additionally to the 3Dimensions XYZ:

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

|--**Varibles of the tidy_data_set.txt**-----------------------------------------------------------

Column|Variable names|Definition
------|--------------|-----------
1|participants|Participants and associated number (1-30)
2|activities|1 WALKING
 |          |2 WALKING_UPSTAIRS
 |      |3 WALKING_DOWNSTAIRS
 |      |4 SITTING
 |      |5 STANDING
 |      |6 LAYING
 3|	timeBodyAccelerator-mean()-X|mean of the body acceleration on the x-axis
4|	timeBodyAccelerator-mean()-Y|mean of the body acceleration on the y-axis
5|	timeBodyAccelerator-mean()-Z|mean of the body acceleration on the z-axis
6|	timeBodyAccelerator-std()-X|...
7|	timeBodyAccelerator-std()-Y|..
8|	timeBodyAccelerator-std()-Z|.
....|      ....|...
479|angle(Z,gravityMean)|Angle between to vectors  
Please refer to the summary of singals and variables for further explanation of each feature variable





