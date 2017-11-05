#### This code book has two sections:

- Tidy Dataset Overview: describes dimensions, structure, features, variables and their renaming.
- Data Dictionary: describes each variable.

# Tidy Dataset Overview

### Dimensions and structure of the dataset

The tidy dataset is a data frame with 180 observations: 30 people doing 6 activities each, ordered by person (1 through 30) then activity (alphabetically).

The dataset has 81 variables. The first two variables are a person-activity set of ID variables. The 79 remaining variables are average values, for each person-activity pair,  
of mean, standard deviation, and mean frequeny measurements selected from the original data. Calling the str() function on the tidy set provides a look at the variable names, 
classes, levels, and first few values:

	str(TidyData)

    ## 'data.frame':    180 obs. of  81 variables:
    ##  $ person                      : int  1 1 1 1 1 1 2 2 2 2 ...
    ##  $ activity                    : chr  "LAYING" "SITTING" "STANDING" "WALKING" ...
    ##  $ TimeBodyAccX.mean           : num  0.222 0.261 0.279 0.277 0.289 ...
    ##  $ TimeBodyAccY.mean           : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
    ##  $ TimeBodyAccZ.mean           : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
    ##  $ TimeBodyAccX.sd             : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
    ##  $ TimeBodyAccY.sd             : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
    ##  $ TimeBodyAccZ.sd             : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
	With 73 more variables... 

### Features

From the original 'features_info.txt' file: The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Variables

The set of variables that were estimated from the original signals comprised 17 variables and 5 additional vectors. In the tidy dataset, only three variables remain for the various features:

1.  mean(): Mean value
2.  std(): Standard deviation
3.  meanFreq(): Weighted average of the frequency components to obtain a mean frequency

### Renaming of Variables

1.  Prefixes ('t' and 'f') where changed to 'Time' and 'Freq' to more clearly denote their meanings.
2.  The XYZ coordinates were appended to the name and not to the type of computation, for clarity (for example, instead of TimeBodyAcc.meanX, which would seem to denote a certain X kind of mean, I selected the name TimeBodyAccX.mean, representing the mean of Time-domain signals of Body Acceleration in the X direction).
3.  Step (2) also ensures that one can clearly see which variables are the mean, standard deviation (sd), or mean frequency (meanFreq).
4.  Finally, all extra symbols (such as () or -) were eliminated from the original variable names.


# Data Dictionary

Variable number. Variable name: class; 
- short description

1.  person: int (range 1-30); 
- numbers representing the subjects in the experiment
2.  activity: Factor (with 6 levels); 
- names of the six activities performed, in alphabetical order
3.  TimeBodyAccX.mean: num; 
- avg mean of time-domain signals of body acceleration in the X direction
4.  TimeBodyAccY.mean: num; 
- same in the Y direction 
5.  TimeBodyAccZ.mean: num; 
- same in the Z direction
6.  TimeBodyAccX.sd: num; avg 
- standard deviation of time-domain signals of body acceleration in the X direction
7.  TimeBodyAccY.sd: num; 
- same in the Y direction
8.  TimeBodyAccZ.sd: num; 
- same in the Z direction
9.  TimeGravityAccX.mean: num; 
- avg mean of time-domain signals of gravity acceleration in the X direction
10. TimeGravityAccY.mean: num; 
- same in the Y direction
11. TimeGravityAccZ.mean: num; 
- same in the Z direction
12. TimeGravityAccX.sd: num; 
- avg standard deviation of time-domain signals of gravity acceleration in the X direction
13. TimeGravityAccY.sd: num; 
- same in the Y direction
14. TimeGravityAccZ.sd: num; 
- same in the Z direction
15. TimeBodyAccJerkX.mean: num; 
- avg mean of time-domain signals of body linear acceleration jerk in the X direction
16. TimeBodyAccJerkY.mean: num; 
- same in the Y direction
17. TimeBodyAccJerkZ.mean: num; 
- same in the Z direction
18. TimeBodyAccJerkX.sd: num; 
- avg standard deviation of time-domain signals of body linear acceleration jerk in the X direction
19. TimeBodyAccJerkY.sd: num; 
- same in the Y direction
20. TimeBodyAccJerkZ.sd: num; 
- same in the Z direction
21. TimeBodyGyroX.mean: num; 
- avg mean of time-domain signals of body angular velocity in the X direction  
22. TimeBodyGyroY.mean: num; 
- same in the Y direction  
23. TimeBodyGyroZ.mean: num; 
- same in the Z direction  
24. TimeBodyGyroX.sd: num; 
- avg standard deviation of time-domain signals of body angular velocity in the X direction  
25. TimeBodyGyroY.sd: num; 
- same in the Y direction
26. TimeBodyGyroZ.sd: num; 
- same in the Z direction
27. TimeBodyGyroJerkX.mean: num; 
- avg mean of time-domain signals of body angular velocity jerk in the X direction
28. TimeBodyGyroJerkY.mean: num; 
- same in the Y direction
29. TimeBodyGyroJerkZ.mean: num; 
- same in the Z direction
30. TimeBodyGyroJerkX.sd: num; 
- avg standard dev of time-domain signals of body angular velocity jerk in the X direction
31. TimeBodyGyroJerkY.sd: num; 
- same in the Y direction
32. TimeBodyGyroJerkZ.sd: num; 
- same in the Z direction
33. TimeBodyAccMag.mean: num; 
- avg mean of the magnitude of 3-axial time-domain signals of body acceleration  
34. TimeBodyAccMag.sd: num; 
- avg standard deviation of the magnitude of 3-axial time-domain signals of body acceleration
35. TimeGravityAccMag.mean: num; 
- avg mean of of the magnitude of 3-axial time-domain signals of gravity acceleration
36. TimeGravityAccMag.sd: num; 
- avg standard deviation  of of the magnitude of 3-axial time-domain signals of gravity acceleration
37. TimeBodyAccJerkMag.mean: num; 
- avg mean of the magnitude of time-domain signals of body linear acceleration jerk
38. TimeBodyAccJerkMag.sd: num; 
- avg standard deviation  of the magnitude of time-domain signals of body linear acceleration jerk
39. TimeBodyGyroMag.mean: num; 
- avg mean of the magnitude of time-domain signals of body angular velocity
40. TimeBodyGyroMag.sd: num; 
- avg standard deviation of the magnitude of time-domain signals of body angular velocity
41. TimeBodyGyroJerkMag.mean: num; 
- avg mean of the magnitude of time-domain signals of body angular velocity jerk
42. TimeBodyGyroJerkMag.sd: num; 
- avg standard deviation of the magnitude of time-domain signals of body angular velocity jerk
43. FreqBodyAccX.mean: num; 
- avg mean of frequency-domain signals of body acceleration in the X direction
44. FreqBodyAccY.mean: num; 
- same in the Y direction
45. FreqBodyAccZ.mean: num; 
- same in the Z direction
46. FreqBodyAccX.sd: num; 
- avg standard deviation of frequency-domain signals of body acceleration in the X direction
47. FreqBodyAccY.sd: num; 
- same in the Y direction
48. FreqBodyAccZ.sd: num; 
- same in the Z direction
49. FreqBodyAccX.meanFreq: num; 
- avg mean frequency of frequency-domain signals of body acceleration in the X direction
50. FreqBodyAccY.meanFreq: num; 
- same in the Y direction
51. FreqBodyAccZ.meanFreq: num; 
- same in the Z direction
52. FreqBodyAccJerkX.mean: num; 
- avg mean of frequency-domain signals of body linear acceleration jerk in X direction
53. FreqBodyAccJerkY.mean: num; 
- same in the Y direction
54. FreqBodyAccJerkZ.mean: num; 
- same in the Z direction
55. FreqBodyAccJerkX.sd: num; 
- avg standard deviation of frequency-domain signals of body linear acceleration jerk in the X direction
56. FreqBodyAccJerkY.sd: num; 
- same in the Y direction
57. FreqBodyAccJerkZ.sd: num; 
- same in the Z direction
58. FreqBodyAccJerkX.meanFreq: num; 
- avg mean frequency of frequency-domain signals of body linear acceleration jerk in the X direction
59. FreqBodyAccJerkY.meanFreq: num; 
- same in the Y direction
60. FreqBodyAccJerkZ.meanFreq: num; 
- same in the Z direction
61. FreqBodyGyroX.mean: num; 
- avg mean of frequency-domain signals of body angular velocity in the X direction
62. FreqBodyGyroY.mean: num; 
- same in the Y direction
63. FreqBodyGyroZ.mean: num; 
- same in the Z direction
64. FreqBodyGyroX.sd: num; 
- avg standard deviation of frequency-domain signals of body angular velocity in the X direction
65. FreqBodyGyroY.sd: num; 
- same in the Y direction
66. FreqBodyGyroZ.sd: num;
- same in the Z direction
67. FreqBodyGyroX.meanFreq: num; 
- avg mean freq of frequency-domain signals of body angular velocity in the X direction
68. FreqBodyGyroY.meanFreq: num; 
- same in the Y direction
69. FreqBodyGyroZ.meanFreq: num; 
- same in the Z direction
70. FreqBodyAccMag.mean: num; 
- avg mean of the magnitude of 3-axial frequency-domain signals of body acceleration
71. FreqBodyAccMag.sd: num; 
- avg standard deviation of the magnitude of 3-axial frequency-domain signals of body acceleration
72. FreqBodyAccMag.meanFreq: num; 
- avg mean frequency of the magnitude of 3-axial frequency-domain signals of body acceleration
73. FreqBodyAccJerkMag.mean: num; 
- avg mean of the magnitude of frequency-domain signals of body linear acceleration jerk
74. FreqBodyAccJerkMag.sd: num; 
- avg standard deviation of the magnitude of frequency-domain signals of body linear acceleration jerk
75. FreqBodyAccJerkMag.meanFreq: num; 
- avg mean frequency of the magnitude of frequency-domain signals of body linear acceleration jerk
76. FreqBodyGyroMag.mean: num; 
- avg mean of the magnitude of frequency-domain signals of body angular velocity
77. FreqBodyGyroMag.sd: num; 
- avg standard deviation of the magnitude of frequency-domain signals of body angular velocity
78. FreqBodyGyroMag.meanFreq: num; 
- avg mean frequency of the magnitude of frequency-domain signals of body angular velocity
79. FreqBodyGyroJerkMag.mean: num; 
- avg mean of the magnitude of frequency-domain signals of body angular velocity jerk
80. FreqBodyGyroJerkMag.sd: num; 
- avg standard deviation of the magnitude of frequency-domain signals of body angular velocity jerk
81. FreqBodyGyroJerkMag.meanFreq: num; 
- avg mean frequency of the magnitude of frequency-domain signals of body angular velocity jerk


