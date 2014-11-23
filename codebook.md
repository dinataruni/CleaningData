 # CodeBook

This is a code book that describes the variables, the data, and any transformations performed to clean up the data.

## The data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The script run_analysis.R

The script assumes the data from the UCI Machine Learning Repository is already in the working directory.
It does the following things:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The Variables 

The output of run_analysis.R will create a file called "tidydata.txt".  The data contains the following id columns:

| Column Name | Description                                                    |
| ----------- | -------------------------------------------------------------- |
| Subject     | An integer identifying a single test subject. There are 30 subjects in total. |
| Activity    | Possible values are: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING` and `LAYING`. |
| Activity ID | A numeric integer ID that is attached to the above descriptive labels | 

In addition, each row has 86 columns with the average of each measurement for each subject and activity. Each column name will include the word "mean" or "std".  
Information regarding the column name variables may be found in "features_info.txt"
