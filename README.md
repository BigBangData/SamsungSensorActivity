# SamsungSensorActivity
Tidy Dataset Project for 'Getting and Cleaning Data' - JHU Data Science Specialization from Coursera

===============================================================================
## This README file comprises:

1. Project overview
2. Raw Data description
3. R script analysis
4. Tidy Dataset overview
5. Sources

===============================================================================
	
# 1 - PROJECT OVERVIEW

The Tidy Dataset Project computes averages on mean and standard deviation 
measurements in the Human Activity Recognition Using Smartphones Dataset. 
The project is the Final Peer-graded Assignment in 'Getting and Cleaning Data', 
Course 3 of the 9-course Johns Hokpins University Data Science Specialization 
from Coursera.

The TidyData.txt dataset is the result of running the run_analysis.r script, 
which performs these steps: 
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and std for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy dataset 
with the average of each variable for each activity and each subject

The final Tidy Dataset comprises: 
- An ID variable of the subject who carried out the experiment
- An ID variable with one of six activities performed by each subject
- 79 calculated variables, averages, for each subject-activity pair, 
of mean, std and mean freq. measurements in the raw data

Project files, located in the GitHub repo
 <https://github.com/BigBangData/SamsungSensorActivity>:
- 'README.md': explains all the analysis files submitted in this project, 
including an R script analysis
- 'run_analysis.r': R script which performs the analysis and outputs a tidy dataset
- 'TidyData.txt': the tidy dataset produced by run_analysis.r
- 'CodeBook.md': describes the data and the variables in the tidy dataset

===============================================================================

# 2 - RAW DATA DESCRIPTION

The original project, Human Activity Recognition Using Smartphones Dataset, 
Version 1.0, was conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro 
Ghio, Luca Oneto and Xavier Parra. It consists of strapping a smartphone around 
the waist of 30 volunteers who performed 6 activities (walking, walking upstairs 
and downstairs, sitting, standing and laying) and taking a variety of physical 
measures using the phone's embedded accelerometer and gyroscope. The obtained 
dataset was randomly partitioned into a training and test subsets with 70 and 
30 percent of the data, respectively.

For a complete description and access to the original dataset, visit:
<http://archive.ics.uci.edu/ml/dataset>. A video of the experiment can be seen 
here: <http://www.youtube.com/watch?v=XOEN9W05_4A>.
For more information about this dataset please contact: 
activityrecognition '@' smartlab.ws

File structure of the 'UCI HAR Dataset' folder containing the raw data:
- 'test': a folder containing the test data
	+ 'Inertial Signals': a folder containing raw signals, not used* 
	+ 'subject_test.txt': subject id numbers (1-30), with 2947 obs.
	+ 'X_test.txt': the test data, with 2947 observations of 561 variables
	+ 'y_test.txt': activity labels for the test data (1-6), with 2947 obs.
- 'train': a folder containing the training data 
	+ 'Inertial Signals': a folder containing raw signals, not used* 
	+ 'subject_train.txt': subject id numbers (1-30), with 7352 obs.
	+ 'X_train.txt': the train data, with 7352 observations of 561 variables
	+ 'y_train.txt': activity labels for the train data (1-6), with 7352 obs.
- 'activity_labels.txt':  links the class labels with their activity name
- 'features.txt': list of all 561 variables 
- 'features_info.txt': info. about the variables used on the feature vector
- 'README.txt': explains the original project

 \* the 'Inertial Signals' folders do not contain any mean or std of any values, 
being comprised of files with raw signals, so they were not needed for the 
project, as per project guidelines 

NOTES: 
1. The last six features of the original dataset, although labelled 
gravityMean, were not considered in the tidy dataset project since they 
represent averaging the signals in a signal window sample used on the angle() 
variable (angle between vectors), and seem unecessary and not representative 
of more direct mean and standard deviation measures. 

2. All mean() and std() variables were selected, as well as the meanFreq() 
variables (weighted average of the frequency components to obtain a mean 
frequency).

===============================================================================

# 3 - R SCRIPT ANALYSIS

The run_analysis.r script was created using R version 3.4.2 on a 
x86_64-w64-mingw32 platform.  Please make sure to have a compatible system and 
R version, and have the dplyr package installed.

WARNING: the first command, rm(list=ls()), clears your workspace completely.

### Clear workspace and download raw data
    rm(list=ls())  
    fileUrl <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "./smartphones.zip")
    unzip(zipfile = "./smartphones.zip")
	
### Sourcing the R script:
Please make sure to download the R script submitted (run_analysis.r) into your 
working directory first.

    source("./run_analysis.r")

### Setup: loads datasets.

Starts in the working directory, switches directories, entering and extiting the 
UCI HAR Dataset folder to access the train and test folders. Reads data into data 
frames labelled so as to identify each data component:

- subject_id_Test: subject ids for the test data
- activity_label_Test: activity labels for the test data
- data_Test: actual test data
- subject_id_Train: subject ids for the train data
- activity_label_Train: activity labels for the train data
- data_Train: actual training data

### 1. Merges the training and the test sets to create one data set.

Binds the columns of subject ids and activity labels with the data for the 
test set; creates Test data frame.
Binds the columns of subject ids and activity labels with the data for the 
traning set; creates Train data frame.
Merges the Test and Train data frames into one big data frame with all the 
observations.

The resulting TestTrain data frame has 10299 observations of 563 variables, 
with 2 added variables (subject ids and activity labels) to the 561 
features of the original dataset. The variables are named V1, V1.1, V1.2, 
V2, V3, V4 ... V561. 

The TestTrain data frame starts with the 8 test subjects (2, 4, 9, 10, 12, 13, 
18, 20, 24) and proceeds with the remaining 22 train subjects. The activity 
labels are numbers (1-6) and there are several repeated observations of 
each activity for each subject. 

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Subsets columns with mean(), std() and meanFreq() measures in the TestTRain 
data frame. The resulting data frame has 10299 observations of 81 variables
(2 person-activity IDs and 79 measurements).

### 3. Uses descriptive activity names to name the activities in the data set.

Reads in the 'activity_labels.txt' file and creates a data frame linking 
activity numbers with descriptions. Applies activity descriptions to the 
activity ID variable by matching ID numbers with those descriptions.  This 
process effectively renames all the activity using the original (and 
sufficiently descriptive) names:

	head(TestTrain_subset[, 2])
	[1] STANDING STANDING STANDING STANDING STANDING STANDING
	Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS

NOTE: the order of levels, although alphabetical, follows a logical progression
from inactivity to activity, so it was not changed.

### 4. Appropriately labels the data set with descriptive variable names.

Uses the dplyr package arrange() to organize the data frame according to 
subject ids first, then activity labels. Uses the dplyr package rename() to 
rename all variables with descriptive names. 

(For further information on renaming variables and their descriptions, 
please consult the CodeBook.md)

The resulting data frame, sensorData, is now organized by the person-activity 
pair of id variables. Since there are still many observations for each ID pair, 
step 5 is necessary to achieve a tidy data format.

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Uses the dplyr package group_by() to group the person and activity into pairs.
Uses the dplyr package summarise_all() to calculate the mean (average) for each 
grouped person-activity pair. Simplifies the class to be a simple data frame 
instead of a grouped_df, tbl_df, and tbl as well.

Writes the data frame into a text file for submission, in compliance with 
project guidelines:

	write.table(TidyData, file = "../TidyData.txt", row.name = FALSE, sep = " ")   	

===============================================================================

# 4 - TIDY DATASET OVERVIEW

The resulting 'TidyData' data frame in R and 'TidyData.txt' output in the 
working directory should be identical, and have 181 lines (a header and 180
observations) and 81 variables.

To read the tidy data back into R:

    TidyData <- read.table("./TidyData.txt", header = TRUE, stringsAsFactors = FALSE)
    View(TidyData)

The CodeBook.md further describes the tidy dataset and all of its variables.

===============================================================================

# 5- SOURCES

I am indebted to David Hood for his 'infamous tutorial', which helped me in organizing this project:
<https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment>





