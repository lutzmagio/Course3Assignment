# Course3Assignment

The script run_analysis.R is used to analyze data obtained in a machine learning application for activity categorization.

## Prerequisites
run_analysis.R must be executed in a foler where the "UCI HAR Dataset" is stored in.

## Loading data
The following files are used:\
./train/subject_train.txt\
./train/X_train.txt\
./train/y_train.txt\
./test/subject_test.txt\
./test/X_test.txt\
./test/y_test.txt\
./features.txt\
./activity_label.txt

## Merging data
The data from files is merged to one combined dataset containing information on\
- which subject is considered\
- which activity was observed\
- the data of measured movements and accelerations

## Extract measurements of mean and standard deviation
For each measurement, only the existing data of the mean and standard deviation is extracted. Seperation is done by column names (columns containing "mean" or "std" are considered).

## Description of activities
The activities column in the dataset prepared is a factor with the following levels:\
1 - WALKING\
2 - WALKING_UPSTAIRS\
3 - WALKING_DOWNSTAIRS\
4 - SITTING\
5 - STANDING\
6 - LAYING

## Variable names in dataset
The variable names in the dataset are slightly modified by:
- removing braces ( and )
- replacing , by -

to obtain names of the following style:\
1 - ID\
2 - tBodyAcc-mean-X\
3 - tBodyAcc-mean-Y\
4 - tBodyAcc-mean-Z\
5 - tBodyAcc-std-X\
6 - tBodyAcc-std-Y\
7 - tBodyAcc-std-Z\
...\
81 - activity\
82 - subject

## Preparation of summary
The summary is an independent tidy dataset with the average of each variable for each activity and for each subject. The script stores it under "summary.txt".
