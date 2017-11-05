## Setup: loading datasets from working directory
setwd("./UCI HAR Dataset")
setwd("./test/")
subject_id_Test <- read.table("./subject_test.txt")
activity_label_Test <- read.table("./y_test.txt") 
data_Test <- read.table("./X_test.txt") 
setwd("../")
setwd("./train")
subject_id_Train <- read.table("./subject_train.txt")
activity_label_Train <- read.table("./y_train.txt") 
data_Train <- read.table("./X_train.txt")
setwd("../")	
	
## 1. Merges the training and the test sets to create one data set.
Test <- cbind(subject_id_Test, activity_label_Test, data_Test)
Train <- cbind(subject_id_Train, activity_label_Train, data_Train)
TestTrain <- rbind(Test, Train) 

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
TestTrain_subset <- TestTrain[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243,
				  255:256, 268:273, 296:298, 347:352, 375:377, 426:431, 454:456, 505:506, 
				  515, 518:519, 528, 531:532, 541, 544:545, 554)]

## 3. Uses descriptive activity names to name the activities in the data set.
activity_labels <- read.table("./activity_labels.txt")
TestTrain_subset[, 2] <- activity_labels[TestTrain_subset[, 2], 2]

## 4. Appropriately labels the data set with descriptive variable names.
library(dplyr, warn.conflicts = FALSE)
sensorData <- TestTrain_subset %>%
	arrange(V1, V1.1) %>%              
	rename(person=V1, activity=V1.1, 
	TimeBodyAccX.mean=V1.2, TimeBodyAccY.mean=V2, TimeBodyAccZ.mean=V3, 
	TimeBodyAccX.sd=V4, TimeBodyAccY.sd=V5, TimeBodyAccZ.sd=V6, 
	TimeGravityAccX.mean=V41, TimeGravityAccY.mean=V42, TimeGravityAccZ.mean=V43, 
	TimeGravityAccX.sd=V44, TimeGravityAccY.sd=V45, TimeGravityAccZ.sd=V46,
	TimeBodyAccJerkX.mean=V81, TimeBodyAccJerkY.mean=V82, TimeBodyAccJerkZ.mean=V83, 
	TimeBodyAccJerkX.sd=V84, TimeBodyAccJerkY.sd=V85, TimeBodyAccJerkZ.sd=V86,
	TimeBodyGyroX.mean=V121, TimeBodyGyroY.mean=V122, TimeBodyGyroZ.mean=V123, 
	TimeBodyGyroX.sd=V124, TimeBodyGyroY.sd=V125, TimeBodyGyroZ.sd=V126,
	TimeBodyGyroJerkX.mean=V161, TimeBodyGyroJerkY.mean=V162, TimeBodyGyroJerkZ.mean=V163, 
	TimeBodyGyroJerkX.sd=V164, TimeBodyGyroJerkY.sd=V165, TimeBodyGyroJerkZ.sd=V166,
	TimeBodyAccMag.mean=V201, TimeBodyAccMag.sd=V202, 
	TimeGravityAccMag.mean=V214, TimeGravityAccMag.sd=V215, 
	TimeBodyAccJerkMag.mean=V227, TimeBodyAccJerkMag.sd=V228, 
	TimeBodyGyroMag.mean=V240, TimeBodyGyroMag.sd=V241, 
	TimeBodyGyroJerkMag.mean=V253, TimeBodyGyroJerkMag.sd=V254,
	FreqBodyAccX.mean=V266, FreqBodyAccY.mean=V267, FreqBodyAccZ.mean=V268, 
	FreqBodyAccX.sd=V269, FreqBodyAccY.sd=V270, FreqBodyAccZ.sd=V271,
	FreqBodyAccX.meanFreq=V294, FreqBodyAccY.meanFreq=V295, FreqBodyAccZ.meanFreq=V296,
	FreqBodyAccJerkX.mean=V345, FreqBodyAccJerkY.mean=V346, FreqBodyAccJerkZ.mean=V347, 
	FreqBodyAccJerkX.sd=V348, FreqBodyAccJerkY.sd=V349, FreqBodyAccJerkZ.sd=V350,
	FreqBodyAccJerkX.meanFreq=V373, FreqBodyAccJerkY.meanFreq=V374, FreqBodyAccJerkZ.meanFreq=V375,
	FreqBodyGyroX.mean=V424, FreqBodyGyroY.mean=V425, FreqBodyGyroZ.mean=V426, 
	FreqBodyGyroX.sd=V427, FreqBodyGyroY.sd=V428, FreqBodyGyroZ.sd=V429,
	FreqBodyGyroX.meanFreq=V452, FreqBodyGyroY.meanFreq=V453, FreqBodyGyroZ.meanFreq=V454,
	FreqBodyAccMag.mean=V503, FreqBodyAccMag.sd=V504, FreqBodyAccMag.meanFreq=V513,
	FreqBodyAccJerkMag.mean=V516, FreqBodyAccJerkMag.sd=V517, FreqBodyAccJerkMag.meanFreq=V526,
	FreqBodyGyroMag.mean=V529, FreqBodyGyroMag.sd=V530, FreqBodyGyroMag.meanFreq=V539,
	FreqBodyGyroJerkMag.mean=V542, FreqBodyGyroJerkMag.sd=V543, FreqBodyGyroJerkMag.meanFreq=V552)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidySensorData <- sensorData %>%
	group_by(person, activity) %>%
	summarise_all(mean)
TidyData <- as.data.frame(TidySensorData)
write.table(TidyData, file = "../TidyData.txt", row.name = FALSE, sep = " ")
	


