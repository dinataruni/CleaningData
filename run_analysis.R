## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(dplyr)
library(reshape2)

# Read Training datasets
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Read Test datasets
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Read Activities

activities <- read.table("activity_labels.txt")

# Merging

x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
sub_merged <- rbind(subject_train, subject_test)

# 3. Uses descriptive activity names to name the activities in the data set

merge_act <- inner_join(activities, y_merged)

# Read Features 

features <- read.table("features.txt")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

extract_features <- features[grep('mean|std|Mean', features$V2), ]

# Subset merged data to only show measurements on mean and standard deviation

subset_meanstd <- x_merged[ ,c(extract_features$V1)]

# Assign useful colnames

colnames(subset_meanstd) <- extract_features$V2

# Merge Subjet & Activity and Merges the training and the test sets to create one data set.

data <- cbind(sub_merged, merge_act, subset_meanstd)

# Renaming columns 

names(data)[1] <- "Subject"
names(data)[2] <- "Activity_ID"
names(data)[3] <- "Activity"

# Summarizing by Subject & Activity 

data.long <- melt(data, id = c("Subject", "Activity"))
data.wide <- dcast(data.long, Subject + Activity ~ variable, mean)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy.data <- data.wide
write.table(tidy.data, "tidydata.txt", row.names = FALSE, quote = FALSE)