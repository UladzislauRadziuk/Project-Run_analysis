|--run_analysis CodeBook Version 1.0
|--Summary --------------------------------------------------------------------------------------------------

run_analysis describes the transformation of the data (UCI HAR Dataset) using the run analysis.R function into a tidy_data_set. 

Raw data is from: 
UCI HAR Dataset, Human Activity Recognition Using Smartphones Dataset, Owner: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Universit‡ degli Studi di Genova.Via Opera Pia 11A, I-16145, Genoa, Italy.activityrecognition@smartlab.ws, www.smartlab.ws

|--Data Description ------------------------------------------------------------------------------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

|--Transformation----------------------------------------------------------------------------------------------

Description of the transformation performed with the data to clean up the data set and create the final tidy_data_set.txt

1 Merges the training and test sets to create one data set:

1.1 For the set up of the Master data set the following data was extracted out of the UCI HAR Dataset:

-YTest          (Test set, activity levels e.g. 1 Walking, 2 Walking_Upstairs) 
-XTest          (Test labels)
-SubjectTest    (Identifier for participants performing the test-activity)
-YTrain         (Training set, activity levels e.g. 1 Walking, 2 Walking_Upstairs)
-XTrain         (Training labels)
-SubjectTrain   (Identifier for the participants performing the training-activity)
-Features       (feature(e.g. tBodyAcc-XYZ...) list of variables (like "mean value" or "standard deviation" etc.) 
                that where applied on a set of filtered acceleration and gyroscope 3D signals, from 3D raw data signal database)

1.2 : the feature list was added as variables to the XTrain and XTest set.
1.3 : the identifier of the participants and activities was added to the XTrain and XTest sets.
1.4 : the XTrain and XTest set were combined into a Master set to create one data set.

2 Extracts only the measurements on the mean and standard deviation for each measurement:

2.1 Two feature data.frames were created from the Master set one with all STD featuers and one with all Mean features

3 Uses descriptive activity names to name the activities in the data set:

3.1 Add to the Master set the complete names of the activity level ("Sitting","Standing", "Walking" etc.) 

4 Appropriately labels the data set with descriptive variable names:

4.1 Change in the Master set the shortcuts like "Acc" into "Accelerator" and labels like "1" into "Participant 1"

5 Create an independent tidy data set with the average of each variable for each activity and each subject:

5.1 Create a new data table "TidyData" with the average of each activity and participant and write it into "tidy_data_set.txt". 
For further details of the variables please see below. 

|--Variables--------------------------------------------------------------------------------------------------

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

|--Varibles of the tidy_data_set.txt
|------------------------------------------------------------------------------------------|
|Column | Variable Name                     | Definition                                   |
|-------|-----------------------------------|----------------------------------------------|

1	participants                    	Participants and associated number (1-30)
2	activities                      	1 WALKING
                                                2 WALKING_UPSTAIRS
                                                3 WALKING_DOWNSTAIRS
                                                4 SITTING
                                                5 STANDING
                                                6 LAYING"
3	timeBodyAccelerator-mean()-X	        mean of the body acceleration on the x-axis
4	timeBodyAccelerator-mean()-Y	        mean of the body acceleration on the y-axis
5	timeBodyAccelerator-mean()-Z	        mean of the body acceleration on the z-axis
6	timeBodyAccelerator-std()-X             ...
7	timeBodyAccelerator-std()-Y             ..
8	timeBodyAccelerator-std()-Z             .
9	timeBodyAccelerator-mad()-X
10	timeBodyAccelerator-mad()-Y
11	timeBodyAccelerator-mad()-Z
12	timeBodyAccelerator-max()-X
13	timeBodyAccelerator-max()-Y
14	timeBodyAccelerator-max()-Z
15	timeBodyAccelerator-min()-X
16	timeBodyAccelerator-min()-Y
17	timeBodyAccelerator-min()-Z
18	timeBodyAccelerator-sma()
19	timeBodyAccelerator-energy()-X
20	timeBodyAccelerator-energy()-Y
21	timeBodyAccelerator-energy()-Z
22	timeBodyAccelerator-iqr()-X
23	timeBodyAccelerator-iqr()-Y
24	timeBodyAccelerator-iqr()-Z
25	timeBodyAccelerator-entropy()-X
26	timeBodyAccelerator-entropy()-Y
27	timeBodyAccelerator-entropy()-Z
28	timeBodyAccelerator-arCoeff()-X,1
29	timeBodyAccelerator-arCoeff()-X,2
30	timeBodyAccelerator-arCoeff()-X,3
31	timeBodyAccelerator-arCoeff()-X,4
32	timeBodyAccelerator-arCoeff()-Y,1
33	timeBodyAccelerator-arCoeff()-Y,2
34	timeBodyAccelerator-arCoeff()-Y,3
35	timeBodyAccelerator-arCoeff()-Y,4
36	timeBodyAccelerator-arCoeff()-Z,1
37	timeBodyAccelerator-arCoeff()-Z,2
38	timeBodyAccelerator-arCoeff()-Z,3
39	timeBodyAccelerator-arCoeff()-Z,4
40	timeBodyAccelerator-correlation()-X,Y
41	timeBodyAccelerator-correlation()-X,Z
42	timeBodyAccelerator-correlation()-Y,Z
43	timeGravityAccelerator-mean()-X
44	timeGravityAccelerator-mean()-Y
45	timeGravityAccelerator-mean()-Z
46	timeGravityAccelerator-std()-X
47	timeGravityAccelerator-std()-Y
48	timeGravityAccelerator-std()-Z
49	timeGravityAccelerator-mad()-X
50	timeGravityAccelerator-mad()-Y
51	timeGravityAccelerator-mad()-Z
52	timeGravityAccelerator-max()-X
53	timeGravityAccelerator-max()-Y
54	timeGravityAccelerator-max()-Z
55	timeGravityAccelerator-min()-X
56	timeGravityAccelerator-min()-Y
57	timeGravityAccelerator-min()-Z
58	timeGravityAccelerator-sma()
59	timeGravityAccelerator-energy()-X
60	timeGravityAccelerator-energy()-Y
61	timeGravityAccelerator-energy()-Z
62	timeGravityAccelerator-iqr()-X
63	timeGravityAccelerator-iqr()-Y
64	timeGravityAccelerator-iqr()-Z
65	timeGravityAccelerator-entropy()-X
66	timeGravityAccelerator-entropy()-Y
67	timeGravityAccelerator-entropy()-Z
68	timeGravityAccelerator-arCoeff()-X,1
69	timeGravityAccelerator-arCoeff()-X,2
70	timeGravityAccelerator-arCoeff()-X,3
71	timeGravityAccelerator-arCoeff()-X,4
72	timeGravityAccelerator-arCoeff()-Y,1
73	timeGravityAccelerator-arCoeff()-Y,2
74	timeGravityAccelerator-arCoeff()-Y,3
75	timeGravityAccelerator-arCoeff()-Y,4
76	timeGravityAccelerator-arCoeff()-Z,1
77	timeGravityAccelerator-arCoeff()-Z,2
78	timeGravityAccelerator-arCoeff()-Z,3
79	timeGravityAccelerator-arCoeff()-Z,4
80	timeGravityAccelerator-correlation()-X,Y
81	timeGravityAccelerator-correlation()-X,Z
82	timeGravityAccelerator-correlation()-Y,Z
83	timeBodyAcceleratorJerk-mean()-X
84	timeBodyAcceleratorJerk-mean()-Y
85	timeBodyAcceleratorJerk-mean()-Z
86	timeBodyAcceleratorJerk-std()-X
87	timeBodyAcceleratorJerk-std()-Y
88	timeBodyAcceleratorJerk-std()-Z
89	timeBodyAcceleratorJerk-mad()-X
90	timeBodyAcceleratorJerk-mad()-Y
91	timeBodyAcceleratorJerk-mad()-Z
92	timeBodyAcceleratorJerk-max()-X
93	timeBodyAcceleratorJerk-max()-Y
94	timeBodyAcceleratorJerk-max()-Z
95	timeBodyAcceleratorJerk-min()-X
96	timeBodyAcceleratorJerk-min()-Y
97	timeBodyAcceleratorJerk-min()-Z
98	timeBodyAcceleratorJerk-sma()
99	timeBodyAcceleratorJerk-energy()-X
100	timeBodyAcceleratorJerk-energy()-Y
101	timeBodyAcceleratorJerk-energy()-Z
102	timeBodyAcceleratorJerk-iqr()-X
103	timeBodyAcceleratorJerk-iqr()-Y
104	timeBodyAcceleratorJerk-iqr()-Z
105	timeBodyAcceleratorJerk-entropy()-X
106	timeBodyAcceleratorJerk-entropy()-Y
107	timeBodyAcceleratorJerk-entropy()-Z
108	timeBodyAcceleratorJerk-arCoeff()-X,1
109	timeBodyAcceleratorJerk-arCoeff()-X,2
110	timeBodyAcceleratorJerk-arCoeff()-X,3
111	timeBodyAcceleratorJerk-arCoeff()-X,4
112	timeBodyAcceleratorJerk-arCoeff()-Y,1
113	timeBodyAcceleratorJerk-arCoeff()-Y,2
114	timeBodyAcceleratorJerk-arCoeff()-Y,3
115	timeBodyAcceleratorJerk-arCoeff()-Y,4
116	timeBodyAcceleratorJerk-arCoeff()-Z,1
117	timeBodyAcceleratorJerk-arCoeff()-Z,2
118	timeBodyAcceleratorJerk-arCoeff()-Z,3
119	timeBodyAcceleratorJerk-arCoeff()-Z,4
120	timeBodyAcceleratorJerk-correlation()-X,Y
121	timeBodyAcceleratorJerk-correlation()-X,Z
122	timeBodyAcceleratorJerk-correlation()-Y,Z
123	timeBodyGyroscope-mean()-X
124	timeBodyGyroscope-mean()-Y
125	timeBodyGyroscope-mean()-Z
126	timeBodyGyroscope-std()-X
127	timeBodyGyroscope-std()-Y
128	timeBodyGyroscope-std()-Z
129	timeBodyGyroscope-mad()-X
130	timeBodyGyroscope-mad()-Y
131	timeBodyGyroscope-mad()-Z
132	timeBodyGyroscope-max()-X
133	timeBodyGyroscope-max()-Y
134	timeBodyGyroscope-max()-Z
135	timeBodyGyroscope-min()-X
136	timeBodyGyroscope-min()-Y
137	timeBodyGyroscope-min()-Z
138	timeBodyGyroscope-sma()
139	timeBodyGyroscope-energy()-X
140	timeBodyGyroscope-energy()-Y
141	timeBodyGyroscope-energy()-Z
142	timeBodyGyroscope-iqr()-X
143	timeBodyGyroscope-iqr()-Y
144	timeBodyGyroscope-iqr()-Z
145	timeBodyGyroscope-entropy()-X
146	timeBodyGyroscope-entropy()-Y
147	timeBodyGyroscope-entropy()-Z
148	timeBodyGyroscope-arCoeff()-X,1
149	timeBodyGyroscope-arCoeff()-X,2
150	timeBodyGyroscope-arCoeff()-X,3
151	timeBodyGyroscope-arCoeff()-X,4
152	timeBodyGyroscope-arCoeff()-Y,1
153	timeBodyGyroscope-arCoeff()-Y,2
154	timeBodyGyroscope-arCoeff()-Y,3
155	timeBodyGyroscope-arCoeff()-Y,4
156	timeBodyGyroscope-arCoeff()-Z,1
157	timeBodyGyroscope-arCoeff()-Z,2
158	timeBodyGyroscope-arCoeff()-Z,3
159	timeBodyGyroscope-arCoeff()-Z,4
160	timeBodyGyroscope-correlation()-X,Y
161	timeBodyGyroscope-correlation()-X,Z
162	timeBodyGyroscope-correlation()-Y,Z
163	timeBodyGyroscopeJerk-mean()-X
164	timeBodyGyroscopeJerk-mean()-Y
165	timeBodyGyroscopeJerk-mean()-Z
166	timeBodyGyroscopeJerk-std()-X
167	timeBodyGyroscopeJerk-std()-Y
168	timeBodyGyroscopeJerk-std()-Z
169	timeBodyGyroscopeJerk-mad()-X
170	timeBodyGyroscopeJerk-mad()-Y
171	timeBodyGyroscopeJerk-mad()-Z
172	timeBodyGyroscopeJerk-max()-X
173	timeBodyGyroscopeJerk-max()-Y
174	timeBodyGyroscopeJerk-max()-Z
175	timeBodyGyroscopeJerk-min()-X
176	timeBodyGyroscopeJerk-min()-Y
177	timeBodyGyroscopeJerk-min()-Z
178	timeBodyGyroscopeJerk-sma()
179	timeBodyGyroscopeJerk-energy()-X
180	timeBodyGyroscopeJerk-energy()-Y
181	timeBodyGyroscopeJerk-energy()-Z
182	timeBodyGyroscopeJerk-iqr()-X
183	timeBodyGyroscopeJerk-iqr()-Y
184	timeBodyGyroscopeJerk-iqr()-Z
185	timeBodyGyroscopeJerk-entropy()-X
186	timeBodyGyroscopeJerk-entropy()-Y
187	timeBodyGyroscopeJerk-entropy()-Z
188	timeBodyGyroscopeJerk-arCoeff()-X,1
189	timeBodyGyroscopeJerk-arCoeff()-X,2
190	timeBodyGyroscopeJerk-arCoeff()-X,3
191	timeBodyGyroscopeJerk-arCoeff()-X,4
192	timeBodyGyroscopeJerk-arCoeff()-Y,1
193	timeBodyGyroscopeJerk-arCoeff()-Y,2
194	timeBodyGyroscopeJerk-arCoeff()-Y,3
195	timeBodyGyroscopeJerk-arCoeff()-Y,4
196	timeBodyGyroscopeJerk-arCoeff()-Z,1
197	timeBodyGyroscopeJerk-arCoeff()-Z,2
198	timeBodyGyroscopeJerk-arCoeff()-Z,3
199	timeBodyGyroscopeJerk-arCoeff()-Z,4
200	timeBodyGyroscopeJerk-correlation()-X,Y
201	timeBodyGyroscopeJerk-correlation()-X,Z
202	timeBodyGyroscopeJerk-correlation()-Y,Z
203	timeBodyAcceleratorMagnitude-mean()
204	timeBodyAcceleratorMagnitude-std()
205	timeBodyAcceleratorMagnitude-mad()
206	timeBodyAcceleratorMagnitude-max()
207	timeBodyAcceleratorMagnitude-min()
208	timeBodyAcceleratorMagnitude-sma()
209	timeBodyAcceleratorMagnitude-energy()
210	timeBodyAcceleratorMagnitude-iqr()
211	timeBodyAcceleratorMagnitude-entropy()
212	timeBodyAcceleratorMagnitude-arCoeff()1
213	timeBodyAcceleratorMagnitude-arCoeff()2
214	timeBodyAcceleratorMagnitude-arCoeff()3
215	timeBodyAcceleratorMagnitude-arCoeff()4
216	timeGravityAcceleratorMagnitude-mean()
217	timeGravityAcceleratorMagnitude-std()
218	timeGravityAcceleratorMagnitude-mad()
219	timeGravityAcceleratorMagnitude-max()
220	timeGravityAcceleratorMagnitude-min()
221	timeGravityAcceleratorMagnitude-sma()
222	timeGravityAcceleratorMagnitude-energy()
223	timeGravityAcceleratorMagnitude-iqr()
224	timeGravityAcceleratorMagnitude-entropy()
225	timeGravityAcceleratorMagnitude-arCoeff()1
226	timeGravityAcceleratorMagnitude-arCoeff()2
227	timeGravityAcceleratorMagnitude-arCoeff()3
228	timeGravityAcceleratorMagnitude-arCoeff()4
229	timeBodyAcceleratorJerkMagnitude-mean()
230	timeBodyAcceleratorJerkMagnitude-std()
231	timeBodyAcceleratorJerkMagnitude-mad()
232	timeBodyAcceleratorJerkMagnitude-max()
233	timeBodyAcceleratorJerkMagnitude-min()
234	timeBodyAcceleratorJerkMagnitude-sma()
235	timeBodyAcceleratorJerkMagnitude-energy()
236	timeBodyAcceleratorJerkMagnitude-iqr()
237	timeBodyAcceleratorJerkMagnitude-entropy()
238	timeBodyAcceleratorJerkMagnitude-arCoeff()1
239	timeBodyAcceleratorJerkMagnitude-arCoeff()2
240	timeBodyAcceleratorJerkMagnitude-arCoeff()3
241	timeBodyAcceleratorJerkMagnitude-arCoeff()4
242	timeBodyGyroscopeMagnitude-mean()
243	timeBodyGyroscopeMagnitude-std()
244	timeBodyGyroscopeMagnitude-mad()
245	timeBodyGyroscopeMagnitude-max()
246	timeBodyGyroscopeMagnitude-min()
247	timeBodyGyroscopeMagnitude-sma()
248	timeBodyGyroscopeMagnitude-energy()
249	timeBodyGyroscopeMagnitude-iqr()
250	timeBodyGyroscopeMagnitude-entropy()
251	timeBodyGyroscopeMagnitude-arCoeff()1
252	timeBodyGyroscopeMagnitude-arCoeff()2
253	timeBodyGyroscopeMagnitude-arCoeff()3
254	timeBodyGyroscopeMagnitude-arCoeff()4
255	timeBodyGyroscopeJerkMagnitude-mean()
256	timeBodyGyroscopeJerkMagnitude-std()
257	timeBodyGyroscopeJerkMagnitude-mad()
258	timeBodyGyroscopeJerkMagnitude-max()
259	timeBodyGyroscopeJerkMagnitude-min()
260	timeBodyGyroscopeJerkMagnitude-sma()
261	timeBodyGyroscopeJerkMagnitude-energy()
262	timeBodyGyroscopeJerkMagnitude-iqr()
263	timeBodyGyroscopeJerkMagnitude-entropy()
264	timeBodyGyroscopeJerkMagnitude-arCoeff()1
265	timeBodyGyroscopeJerkMagnitude-arCoeff()2
266	timeBodyGyroscopeJerkMagnitude-arCoeff()3
267	timeBodyGyroscopeJerkMagnitude-arCoeff()4
268	frequencyBodyAccelerator-mean()-X
269	frequencyBodyAccelerator-mean()-Y
270	frequencyBodyAccelerator-mean()-Z
271	frequencyBodyAccelerator-std()-X
272	frequencyBodyAccelerator-std()-Y
273	frequencyBodyAccelerator-std()-Z
274	frequencyBodyAccelerator-mad()-X
275	frequencyBodyAccelerator-mad()-Y
276	frequencyBodyAccelerator-mad()-Z
277	frequencyBodyAccelerator-max()-X
278	frequencyBodyAccelerator-max()-Y
279	frequencyBodyAccelerator-max()-Z
280	frequencyBodyAccelerator-min()-X
281	frequencyBodyAccelerator-min()-Y
282	frequencyBodyAccelerator-min()-Z
283	frequencyBodyAccelerator-sma()
284	frequencyBodyAccelerator-energy()-X
285	frequencyBodyAccelerator-energy()-Y
286	frequencyBodyAccelerator-energy()-Z
287	frequencyBodyAccelerator-iqr()-X
288	frequencyBodyAccelerator-iqr()-Y
289	frequencyBodyAccelerator-iqr()-Z
290	frequencyBodyAccelerator-entropy()-X
291	frequencyBodyAccelerator-entropy()-Y
292	frequencyBodyAccelerator-entropy()-Z
293	frequencyBodyAccelerator-maxInds-X
294	frequencyBodyAccelerator-maxInds-Y
295	frequencyBodyAccelerator-maxInds-Z
296	frequencyBodyAccelerator-meanFreq()-X
297	frequencyBodyAccelerator-meanFreq()-Y
298	frequencyBodyAccelerator-meanFreq()-Z
299	frequencyBodyAccelerator-skewness()-X
300	frequencyBodyAccelerator-kurtosis()-X
301	frequencyBodyAccelerator-skewness()-Y
302	frequencyBodyAccelerator-kurtosis()-Y
303	frequencyBodyAccelerator-skewness()-Z
304	frequencyBodyAccelerator-kurtosis()-Z
305	frequencyBodyAccelerator-bandsEnergy()-1,8
306	frequencyBodyAccelerator-bandsEnergy()-9,16
307	frequencyBodyAccelerator-bandsEnergy()-17,24
308	frequencyBodyAccelerator-bandsEnergy()-25,32
309	frequencyBodyAccelerator-bandsEnergy()-33,40
310	frequencyBodyAccelerator-bandsEnergy()-41,48
311	frequencyBodyAccelerator-bandsEnergy()-49,56
312	frequencyBodyAccelerator-bandsEnergy()-57,64
313	frequencyBodyAccelerator-bandsEnergy()-1,16
314	frequencyBodyAccelerator-bandsEnergy()-17,32
315	frequencyBodyAccelerator-bandsEnergy()-33,48
316	frequencyBodyAccelerator-bandsEnergy()-49,64
317	frequencyBodyAccelerator-bandsEnergy()-1,24
318	frequencyBodyAccelerator-bandsEnergy()-25,48
319	frequencyBodyAcceleratorJerk-mean()-X
320	frequencyBodyAcceleratorJerk-mean()-Y
321	frequencyBodyAcceleratorJerk-mean()-Z
322	frequencyBodyAcceleratorJerk-std()-X
323	frequencyBodyAcceleratorJerk-std()-Y
324	frequencyBodyAcceleratorJerk-std()-Z
325	frequencyBodyAcceleratorJerk-mad()-X
326	frequencyBodyAcceleratorJerk-mad()-Y
327	frequencyBodyAcceleratorJerk-mad()-Z
328	frequencyBodyAcceleratorJerk-max()-X
329	frequencyBodyAcceleratorJerk-max()-Y
330	frequencyBodyAcceleratorJerk-max()-Z
331	frequencyBodyAcceleratorJerk-min()-X
332	frequencyBodyAcceleratorJerk-min()-Y
333	frequencyBodyAcceleratorJerk-min()-Z
334	frequencyBodyAcceleratorJerk-sma()
335	frequencyBodyAcceleratorJerk-energy()-X
336	frequencyBodyAcceleratorJerk-energy()-Y
337	frequencyBodyAcceleratorJerk-energy()-Z
338	frequencyBodyAcceleratorJerk-iqr()-X
339	frequencyBodyAcceleratorJerk-iqr()-Y
340	frequencyBodyAcceleratorJerk-iqr()-Z
341	frequencyBodyAcceleratorJerk-entropy()-X
342	frequencyBodyAcceleratorJerk-entropy()-Y
343	frequencyBodyAcceleratorJerk-entropy()-Z
344	frequencyBodyAcceleratorJerk-maxInds-X
345	frequencyBodyAcceleratorJerk-maxInds-Y
346	frequencyBodyAcceleratorJerk-maxInds-Z
347	frequencyBodyAcceleratorJerk-meanFreq()-X
348	frequencyBodyAcceleratorJerk-meanFreq()-Y
349	frequencyBodyAcceleratorJerk-meanFreq()-Z
350	frequencyBodyAcceleratorJerk-skewness()-X
351	frequencyBodyAcceleratorJerk-kurtosis()-X
352	frequencyBodyAcceleratorJerk-skewness()-Y
353	frequencyBodyAcceleratorJerk-kurtosis()-Y
354	frequencyBodyAcceleratorJerk-skewness()-Z
355	frequencyBodyAcceleratorJerk-kurtosis()-Z
356	frequencyBodyAcceleratorJerk-bandsEnergy()-1,8
357	frequencyBodyAcceleratorJerk-bandsEnergy()-9,16
358	frequencyBodyAcceleratorJerk-bandsEnergy()-17,24
359	frequencyBodyAcceleratorJerk-bandsEnergy()-25,32
360	frequencyBodyAcceleratorJerk-bandsEnergy()-33,40
361	frequencyBodyAcceleratorJerk-bandsEnergy()-41,48
362	frequencyBodyAcceleratorJerk-bandsEnergy()-49,56
363	frequencyBodyAcceleratorJerk-bandsEnergy()-57,64
364	frequencyBodyAcceleratorJerk-bandsEnergy()-1,16
365	frequencyBodyAcceleratorJerk-bandsEnergy()-17,32
366	frequencyBodyAcceleratorJerk-bandsEnergy()-33,48
367	frequencyBodyAcceleratorJerk-bandsEnergy()-49,64
368	frequencyBodyAcceleratorJerk-bandsEnergy()-1,24
369	frequencyBodyAcceleratorJerk-bandsEnergy()-25,48
370	frequencyBodyGyroscope-mean()-X
371	frequencyBodyGyroscope-mean()-Y
372	frequencyBodyGyroscope-mean()-Z
373	frequencyBodyGyroscope-std()-X
374	frequencyBodyGyroscope-std()-Y
375	frequencyBodyGyroscope-std()-Z
376	frequencyBodyGyroscope-mad()-X
377	frequencyBodyGyroscope-mad()-Y
378	frequencyBodyGyroscope-mad()-Z
379	frequencyBodyGyroscope-max()-X
380	frequencyBodyGyroscope-max()-Y
381	frequencyBodyGyroscope-max()-Z
382	frequencyBodyGyroscope-min()-X
383	frequencyBodyGyroscope-min()-Y
384	frequencyBodyGyroscope-min()-Z
385	frequencyBodyGyroscope-sma()
386	frequencyBodyGyroscope-energy()-X
387	frequencyBodyGyroscope-energy()-Y
388	frequencyBodyGyroscope-energy()-Z
389	frequencyBodyGyroscope-iqr()-X
390	frequencyBodyGyroscope-iqr()-Y
391	frequencyBodyGyroscope-iqr()-Z
392	frequencyBodyGyroscope-entropy()-X
393	frequencyBodyGyroscope-entropy()-Y
394	frequencyBodyGyroscope-entropy()-Z
395	frequencyBodyGyroscope-maxInds-X
396	frequencyBodyGyroscope-maxInds-Y
397	frequencyBodyGyroscope-maxInds-Z
398	frequencyBodyGyroscope-meanFreq()-X
399	frequencyBodyGyroscope-meanFreq()-Y
400	frequencyBodyGyroscope-meanFreq()-Z
401	frequencyBodyGyroscope-skewness()-X
402	frequencyBodyGyroscope-kurtosis()-X
403	frequencyBodyGyroscope-skewness()-Y
404	frequencyBodyGyroscope-kurtosis()-Y
405	frequencyBodyGyroscope-skewness()-Z
406	frequencyBodyGyroscope-kurtosis()-Z
407	frequencyBodyGyroscope-bandsEnergy()-1,8
408	frequencyBodyGyroscope-bandsEnergy()-9,16
409	frequencyBodyGyroscope-bandsEnergy()-17,24
410	frequencyBodyGyroscope-bandsEnergy()-25,32
411	frequencyBodyGyroscope-bandsEnergy()-33,40
412	frequencyBodyGyroscope-bandsEnergy()-41,48
413	frequencyBodyGyroscope-bandsEnergy()-49,56
414	frequencyBodyGyroscope-bandsEnergy()-57,64
415	frequencyBodyGyroscope-bandsEnergy()-1,16
416	frequencyBodyGyroscope-bandsEnergy()-17,32
417	frequencyBodyGyroscope-bandsEnergy()-33,48
418	frequencyBodyGyroscope-bandsEnergy()-49,64
419	frequencyBodyGyroscope-bandsEnergy()-1,24
420	frequencyBodyGyroscope-bandsEnergy()-25,48
421	frequencyBodyAcceleratorMagnitude-mean()
422	frequencyBodyAcceleratorMagnitude-std()
423	frequencyBodyAcceleratorMagnitude-mad()
424	frequencyBodyAcceleratorMagnitude-max()
425	frequencyBodyAcceleratorMagnitude-min()
426	frequencyBodyAcceleratorMagnitude-sma()
427	frequencyBodyAcceleratorMagnitude-energy()
428	frequencyBodyAcceleratorMagnitude-iqr()
429	frequencyBodyAcceleratorMagnitude-entropy()
430	frequencyBodyAcceleratorMagnitude-maxInds
431	frequencyBodyAcceleratorMagnitude-meanFreq()
432	frequencyBodyAcceleratorMagnitude-skewness()
433	frequencyBodyAcceleratorMagnitude-kurtosis()
434	frequencyBodyBodyAcceleratorJerkMagnitude-mean()
435	frequencyBodyBodyAcceleratorJerkMagnitude-std()
436	frequencyBodyBodyAcceleratorJerkMagnitude-mad()
437	frequencyBodyBodyAcceleratorJerkMagnitude-max()
438	frequencyBodyBodyAcceleratorJerkMagnitude-min()
439	frequencyBodyBodyAcceleratorJerkMagnitude-sma()
440	frequencyBodyBodyAcceleratorJerkMagnitude-energy()
441	frequencyBodyBodyAcceleratorJerkMagnitude-iqr()
442	frequencyBodyBodyAcceleratorJerkMagnitude-entropy()
443	frequencyBodyBodyAcceleratorJerkMagnitude-maxInds
444	frequencyBodyBodyAcceleratorJerkMagnitude-meanFreq()
445	frequencyBodyBodyAcceleratorJerkMagnitude-skewness()
446	frequencyBodyBodyAcceleratorJerkMagnitude-kurtosis()
447	frequencyBodyBodyGyroscopeMagnitude-mean()
448	frequencyBodyBodyGyroscopeMagnitude-std()
449	frequencyBodyBodyGyroscopeMagnitude-mad()
450	frequencyBodyBodyGyroscopeMagnitude-max()
451	frequencyBodyBodyGyroscopeMagnitude-min()
452	frequencyBodyBodyGyroscopeMagnitude-sma()
453	frequencyBodyBodyGyroscopeMagnitude-energy()
454	frequencyBodyBodyGyroscopeMagnitude-iqr()
455	frequencyBodyBodyGyroscopeMagnitude-entropy()
456	frequencyBodyBodyGyroscopeMagnitude-maxInds
457	frequencyBodyBodyGyroscopeMagnitude-meanFreq()
458	frequencyBodyBodyGyroscopeMagnitude-skewness()
459	frequencyBodyBodyGyroscopeMagnitude-kurtosis()
460	frequencyBodyBodyGyroscopeJerkMagnitude-mean()
461	frequencyBodyBodyGyroscopeJerkMagnitude-std()
462	frequencyBodyBodyGyroscopeJerkMagnitude-mad()
463	frequencyBodyBodyGyroscopeJerkMagnitude-max()
464	frequencyBodyBodyGyroscopeJerkMagnitude-min()
465	frequencyBodyBodyGyroscopeJerkMagnitude-sma()
466	frequencyBodyBodyGyroscopeJerkMagnitude-energy()
467	frequencyBodyBodyGyroscopeJerkMagnitude-iqr()
468	frequencyBodyBodyGyroscopeJerkMagnitude-entropy()
469	frequencyBodyBodyGyroscopeJerkMagnitude-maxInds
470	frequencyBodyBodyGyroscopeJerkMagnitude-meanFreq()
471	frequencyBodyBodyGyroscopeJerkMagnitude-skewness()
472	frequencyBodyBodyGyroscopeJerkMagnitude-kurtosis()
473	angle(tBodyAcceleratorMean,gravity)
474	angle(tBodyAcceleratorJerkMean),gravityMean)
475	angle(tBodyGyroscopeMean,gravityMean)
476	angle(tBodyGyroscopeJerkMean,gravityMean)
477	angle(X,gravityMean)
478	angle(Y,gravityMean)
479	angle(Z,gravityMean)












