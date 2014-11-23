CleaningData
============

## Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Run Analysis

The file run_analysis.R contains script that will analyze the code for the Samsung accelerometer data found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
It works in the following steps:

1. Reads files.
2. Assigns Activity Labels based on ID from the activity_labels.txt file.  
3. Subsetting only variables regarding the mean or standard deviation.  Variable names can be found in features.txt.
4. Merging all data into one dataset.
5. Summarizing data by Subject and Activity
6. Creating new tidy data file, named "tidydata.txt".
