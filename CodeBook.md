# Code book for summary of mean movements in UCI HAR Dataset

## Information about origin of UCI HAR Dataset
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Transformations
The following transformations were done:

- merge test dataset and training dataset subjects, inputs (X), outputs (y, that is activities)
- select only those columns showing a mean of a variable (selection through text-filter for words "mean" or "std"
- calculate mean of each variable (column) broken down by subject and activity
- store the resulting dataset as "summary.txt"

## Summary means dataset
The summary.txt dataset contains the following columns:
1	subject
2	activity
3	mean-tBodyAcc-mean-X
4	mean-tBodyAcc-mean-Y
5	mean-tBodyAcc-mean-Z
6	mean-tBodyAcc-std-X
7	mean-tBodyAcc-std-Y
8	mean-tBodyAcc-std-Z
9	mean-tGravityAcc-mean-X
10	mean-tGravityAcc-mean-Y
11	mean-tGravityAcc-mean-Z
12	mean-tGravityAcc-std-X
13	mean-tGravityAcc-std-Y
14	mean-tGravityAcc-std-Z
15	mean-tBodyAccJerk-mean-X
16	mean-tBodyAccJerk-mean-Y
17	mean-tBodyAccJerk-mean-Z
18	mean-tBodyAccJerk-std-X
19	mean-tBodyAccJerk-std-Y
20	mean-tBodyAccJerk-std-Z
21	mean-tBodyGyro-mean-X
22	mean-tBodyGyro-mean-Y
23	mean-tBodyGyro-mean-Z
24	mean-tBodyGyro-std-X
25	mean-tBodyGyro-std-Y
26	mean-tBodyGyro-std-Z
27	mean-tBodyGyroJerk-mean-X
28	mean-tBodyGyroJerk-mean-Y
29	mean-tBodyGyroJerk-mean-Z
30	mean-tBodyGyroJerk-std-X
31	mean-tBodyGyroJerk-std-Y
32	mean-tBodyGyroJerk-std-Z
33	mean-tBodyAccMag-mean
34	mean-tBodyAccMag-std
35	mean-tGravityAccMag-mean
36	mean-tGravityAccMag-std
37	mean-tBodyAccJerkMag-mean
38	mean-tBodyAccJerkMag-std
39	mean-tBodyGyroMag-mean
40	mean-tBodyGyroMag-std
41	mean-tBodyGyroJerkMag-mean
42	mean-tBodyGyroJerkMag-std
43	mean-fBodyAcc-mean-X
44	mean-fBodyAcc-mean-Y
45	mean-fBodyAcc-mean-Z
46	mean-fBodyAcc-std-X
47	mean-fBodyAcc-std-Y
48	mean-fBodyAcc-std-Z
49	mean-fBodyAcc-meanFreq-X
50	mean-fBodyAcc-meanFreq-Y
51	mean-fBodyAcc-meanFreq-Z
52	mean-fBodyAccJerk-mean-X
53	mean-fBodyAccJerk-mean-Y
54	mean-fBodyAccJerk-mean-Z
55	mean-fBodyAccJerk-std-X
56	mean-fBodyAccJerk-std-Y
57	mean-fBodyAccJerk-std-Z
58	mean-fBodyAccJerk-meanFreq-X
59	mean-fBodyAccJerk-meanFreq-Y
60	mean-fBodyAccJerk-meanFreq-Z
61	mean-fBodyGyro-mean-X
62	mean-fBodyGyro-mean-Y
63	mean-fBodyGyro-mean-Z
64	mean-fBodyGyro-std-X
65	mean-fBodyGyro-std-Y
66	mean-fBodyGyro-std-Z
67	mean-fBodyGyro-meanFreq-X
68	mean-fBodyGyro-meanFreq-Y
69	mean-fBodyGyro-meanFreq-Z
70	mean-fBodyAccMag-mean
71	mean-fBodyAccMag-std
72	mean-fBodyAccMag-meanFreq
73	mean-fBodyBodyAccJerkMag-mean
74	mean-fBodyBodyAccJerkMag-std
75	mean-fBodyBodyAccJerkMag-meanFreq
76	mean-fBodyBodyGyroMag-mean
77	mean-fBodyBodyGyroMag-std
78	mean-fBodyBodyGyroMag-meanFreq
79	mean-fBodyBodyGyroJerkMag-mean
80	mean-fBodyBodyGyroJerkMag-std
81	mean-fBodyBodyGyroJerkMag-meanFreq