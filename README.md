# Course3Assignment

The script run_analysis.R is used to analyze data obtained in a machine learning application for activity categorization.

## Prerequisites
run_analysis.R must be executed in a foler where the "UCI HAR Dataset" is stored in.

## Loading data
The following files are used:
./train/subject_train.txt\
./train/X_train.txt\
./train/y_train.txt\
./test/subject_test.txt\
./test/X_test.txt\
./test/y_test.txt\
./features.txt\
./activity_label.txt

## Merging data
The data from files is merged to one combined dataset containing information on
•which subject is considered
•which activity was observed
•the data (mean and standard deviation of measured movements and accelerations)