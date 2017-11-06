# Data in the cleaned version of the UCI HAR Dataset

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcc-XYZ and timeGyro-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc-XYZ and timeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

time domain signals | FFT frequency domain signals
--------------------|-----------------------------
timeBodyAcc-XYZ | freqBodyAcc-XYZ
timeGravityAcc-XYZ |
timeBodyAccJerk-XYZ | freqBodyAccJerk-XYZ
timeBodyGyro-XYZ | freqBodyGyro-XYZ
timeBodyGyroJerk-XYZ |
timeBodyAccMag | freqBodyAccMag
timeGravityAccMag |
timeBodyAccJerkMag | freqBodyAccJerkMag
timeBodyGyroMag | freqBodyGyroMag
timeBodyGyroJerkMag | freqBodyGyroJerkMag

In this cleaned data set, the set of variables that were extracted from the original data set, which contained more variables estimated from these signals, are: 

* mean(): Mean value
* std(): Standard deviation

Data from the original training and test data set were combined into one data set, and columns with subject identification number and descriptive activity names were added to the table.

A second data set, called tidy data, contains only one value per subject and activity, calculated as the average of each variable for each subject and activity.
