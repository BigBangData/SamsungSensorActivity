## Setup: loading datasets from working directory
setwd("./UCI HAR Dataset")
subject_id_Test <- read.table("./test/subject_test.txt")
activity_label_Test <- read.table("./test/y_test.txt") 
data_Test <- read.table("./test/X_test.txt") 
subject_id_Train <- read.table("./train/subject_train.txt")
activity_label_Train <- read.table("./train/y_train.txt") 
data_Train <- read.table("./train/X_train.txt")
	
## 1. Merges the training and the test sets to create one data set.
data_Test <- cbind(subject_id_Test, activity_label_Test, data_Test)
data_Train <- cbind(subject_id_Train, activity_label_Train, data_Train)
dataset <- rbind(data_Test, data_Train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./features.txt")	
datanames <- c("person", "activity", as.character(features$V2))
mean_features <- grepl("person|activity|mean()|std()|meanFreq()", datanames)
data_subset <- dataset[, mean_features == TRUE] 

## 3. Uses descriptive activity names to name the activities in the data set.
activity_labels <- read.table("./activity_labels.txt")
data_subset[, 2] <- activity_labels[data_subset[, 2], 2]

## 4. Appropriately labels the data set with descriptive variable names.
x <- datanames[mean_features == TRUE]
x <- sub("tBody", "TimeBody", x)
x <- sub("tGravity", "TimeGravity", x)
x <- sub("fBody", "FreqBody", x)
x <- sub("BodyBody", "Body", x)
x <- sub("-mean\\(\\)-X", "X.mean", x)
x <- sub("-mean\\(\\)-Y", "Y.mean", x)
x <- sub("-mean\\(\\)-Z", "Z.mean", x)
x <- sub("-std\\(\\)-X", "X.sd", x)
x <- sub("-std\\(\\)-Y", "Y.sd", x)
x <- sub("-std\\(\\)-Z", "Z.sd", x)
x <- sub("-meanFreq\\(\\)-X", "X.meanFreq", x)
x <- sub("-meanFreq\\(\\)-Y", "Y.meanFreq", x)
x <- sub("-meanFreq\\(\\)-Z", "Z.meanFreq", x)
x <- sub("-mean\\(\\)", ".mean", x)
x <- sub("-std\\(\\)", ".sd", x)
x <- sub("-meanFreq\\(\\)", ".meanFreq", x)
names(data_subset) <- x

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr, warn.conflicts = FALSE)
TidyData <- data_subset %>%
	arrange(person, activity) %>%
	group_by(person, activity) %>%
	summarise_all(mean)
TidyData <- as.data.frame(TidyData)
write.table(TidyData, file = "../TidyData.txt", row.name = FALSE, sep = " ")
	


