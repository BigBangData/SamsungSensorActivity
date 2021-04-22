## SETUP 

# cleanup global env
rm(list=ls())  
# setup dir 
setwd("../GitHub/SamsungSensorActivity/")
# download if first time 
if (!dir.exists("UCI HAR Dataset")) {
	URL <- paste0("http://archive.ics.uci.edu/ml/"
				 ,"machine-learning-databases/00240/"
				 ,"UCI%20HAR%20Dataset.zip")
	download.file(URL, destfile = "./smartphones.zip")
	# unzip and cleanup 
	unzip(zipfile = "./smartphones.zip")
	unlink("smartphones.zip")
	unlink("./__MACOSX", recursive = TRUE)
}	

## LOAD DATA
setwd("./UCI HAR Dataset")
# train
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt") 
X_train <- read.table("./train/X_train.txt")
# test 
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt") 
X_test <- read.table("./test/X_test.txt") 

## DATA WRANGLING 

# merge train, test sets 
X_test <- cbind(subject_test, y_test, X_test)
X_train <- cbind(subject_train, y_train, X_train)
X <- rbind(X_test, X_train)

## extract mean and stdev for each measurement 
features <- read.table("./features.txt")	
datanames <- c("person", "activity", as.character(features$V2))
mean_features <- grepl("person|activity|mean()|std()|meanFreq()", datanames)
data_subset <- X[, mean_features == TRUE] 

## rename with descriptive activity labels
activity_labels <- read.table("./activity_labels.txt")
data_subset[, 2] <- activity_labels[data_subset[, 2], 2]

## rename with descriptive variable names
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

# create independent tidy dataset with the mean of each variable
# for each activity and each subject
library(dplyr, warn.conflicts = FALSE)
TidyData <- data_subset %>%
	arrange(person, activity) %>%
	group_by(person, activity) %>%
	summarise_all(mean)
TidyData <- as.data.frame(TidyData)

# save tidy data
write.table(TidyData, file = "../TidyData.txt", 
			row.name = FALSE, sep = " ")
	
	


