# Codebook for Getting and Cleaning Data Course Project
Written by LightningKitty on 23 November 2014

This is the codebook for the [tidy data set](https://github.com/LightningKitty/GettingCleaningDataCourseProject/blob/master/tidydata.txt)

## Study design and original data set

The original data was collected from accelerometers from the Samsung Galaxy S 
smartphone. A full description is available here (where the data was obtained):

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data is available at:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The following four paragraphs are from the original data set codebook 
("features_info.txt") for the data:

> The features selected for this database come from the accelerometer and 
> gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
> (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they
> were filtered using a median filter and a 3rd order low pass Butterworth filter 
> with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
> signal was then separated into body and gravity acceleration signals 
> (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter 
> with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in 
> time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
> magnitude of these three-dimensional signals were calculated using the Euclidean
> norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
> tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
> producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
> fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
> signals). 

> These signals were used to estimate variables of the feature vector for each 
> pattern. A suffix '-XYZ' is used to denote 3-axial signals in the X, Y and Z 
> directions.

## Description of new data set

### Columns and rows

There are four columns:

1. SubjectID - personal IDs (integer) that identify each subject from 1 to 30
2. Activity - factor identifying what the subject was doing. This will be one 
of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
STANDING, LAYING).
3. Variable - the name of the variable being measured. There are 66 variables
that were measured (see below).
4. Mean - mean (numeric) of the measurements for the variable, given the
subject and activity specified.

There are 11880 rows in this data set. For each of the 30 subjects who took 
part in the experiment (SubjectID), and each of the six activities undertaken 
by the subject (Activity), there is a row for each of the 66 variables that 
involved. 

### 66 variables

These 66 variables are derived from columns in the original data set that 
measured mean (Mean) or standard deviation(StdDeviation).

* These variables measured the acceleration (Accel) or angular velocity (Gyro)
of the subject's body (Body) or gravity (Gravity).

* The variables measure either direction (ending in X, Y or Z to signify
a measurement along that axis) or of magnitude (Mag).

* Some variables measure a derivation over time (Jerk).

* The data set retains the convention of prefixing time variables with 't'
and frequency variables with 'f'.

The mapping of the 66 old variable names to new variable names is:

| Number | Old variable name | New variable name | 
| ------ | ----------------- | ----------------- |
| 1 | tBodyAcc-mean()-X | tBodyAccelMeanX | 
| 2 | tBodyAcc-mean()-Y | tBodyAccelMeanY | 
| 3 | tBodyAcc-mean()-Z | tBodyAccelMeanZ | 
| 4 | tBodyAcc-std()-X | tBodyAccelStdDeviationX | 
| 5 | tBodyAcc-std()-Y | tBodyAccelStdDeviationY | 
| 6 | tBodyAcc-std()-Z | tBodyAccelStdDeviationZ | 
| 7 | tGravityAcc-mean()-X | tGravityAccelMeanX | 
| 8 | tGravityAcc-mean()-Y | tGravityAccelMeanY | 
| 9 | tGravityAcc-mean()-Z | tGravityAccelMeanZ | 
| 10 | tGravityAcc-std()-X | tGravityAccelStdDeviationX | 
| 11 | tGravityAcc-std()-Y | tGravityAccelStdDeviationY | 
| 12 | tGravityAcc-std()-Z | tGravityAccelStdDeviationZ | 
| 13 | tBodyAccJerk-mean()-X | tBodyAccelJerkMeanX | 
| 14 | tBodyAccJerk-mean()-Y | tBodyAccelJerkMeanY | 
| 15 | tBodyAccJerk-mean()-Z | tBodyAccelJerkMeanZ | 
| 16 | tBodyAccJerk-std()-X | tBodyAccelJerkStdDeviationX | 
| 17 | tBodyAccJerk-std()-Y | tBodyAccelJerkStdDeviationY | 
| 18 | tBodyAccJerk-std()-Z | tBodyAccelJerkStdDeviationZ | 
| 19 | tBodyGyro-mean()-X | tBodyGyroMeanX | 
| 20 | tBodyGyro-mean()-Y | tBodyGyroMeanY | 
| 21 | tBodyGyro-mean()-Z | tBodyGyroMeanZ | 
| 22 | tBodyGyro-std()-X | tBodyGyroStdDeviationX | 
| 23 | tBodyGyro-std()-Y | tBodyGyroStdDeviationY | 
| 24 | tBodyGyro-std()-Z | tBodyGyroStdDeviationZ | 
| 25 | tBodyGyroJerk-mean()-X | tBodyGyroJerkMeanX | 
| 26 | tBodyGyroJerk-mean()-Y | tBodyGyroJerkMeanY | 
| 27 | tBodyGyroJerk-mean()-Z | tBodyGyroJerkMeanZ | 
| 28 | tBodyGyroJerk-std()-X | tBodyGyroJerkStdDeviationX | 
| 29 | tBodyGyroJerk-std()-Y | tBodyGyroJerkStdDeviationY | 
| 30 | tBodyGyroJerk-std()-Z | tBodyGyroJerkStdDeviationZ | 
| 31 | tBodyAccMag-mean() | tBodyAccelMagMean | 
| 32 | tBodyAccMag-std() | tBodyAccelMagStdDeviation | 
| 33 | tGravityAccMag-mean() | tGravityAccelMagMean | 
| 34 | tGravityAccMag-std() | tGravityAccelMagStdDeviation | 
| 35 | tBodyAccJerkMag-mean() | tBodyAccelJerkMagMean | 
| 36 | tBodyAccJerkMag-std() | tBodyAccelJerkMagStdDeviation | 
| 37 | tBodyGyroMag-mean() | tBodyGyroMagMean | 
| 38 | tBodyGyroMag-std() | tBodyGyroMagStdDeviation | 
| 39 | tBodyGyroJerkMag-mean() | tBodyGyroJerkMagMean | 
| 40 | tBodyGyroJerkMag-std() | tBodyGyroJerkMagStdDeviation | 
| 41 | fBodyAcc-mean()-X | fBodyAccelMeanX | 
| 42 | fBodyAcc-mean()-Y | fBodyAccelMeanY | 
| 43 | fBodyAcc-mean()-Z | fBodyAccelMeanZ | 
| 44 | fBodyAcc-std()-X | fBodyAccelStdDeviationX | 
| 45 | fBodyAcc-std()-Y | fBodyAccelStdDeviationY | 
| 46 | fBodyAcc-std()-Z | fBodyAccelStdDeviationZ | 
| 47 | fBodyAccJerk-mean()-X | fBodyAccelJerkMeanX | 
| 48 | fBodyAccJerk-mean()-Y | fBodyAccelJerkMeanY | 
| 49 | fBodyAccJerk-mean()-Z | fBodyAccelJerkMeanZ | 
| 50 | fBodyAccJerk-std()-X | fBodyAccelJerkStdDeviationX | 
| 51 | fBodyAccJerk-std()-Y | fBodyAccelJerkStdDeviationY | 
| 52 | fBodyAccJerk-std()-Z | fBodyAccelJerkStdDeviationZ | 
| 53 | fBodyGyro-mean()-X | fBodyGyroMeanX | 
| 54 | fBodyGyro-mean()-Y | fBodyGyroMeanY | 
| 55 | fBodyGyro-mean()-Z | fBodyGyroMeanZ | 
| 56 | fBodyGyro-std()-X | fBodyGyroStdDeviationX | 
| 57 | fBodyGyro-std()-Y | fBodyGyroStdDeviationY | 
| 58 | fBodyGyro-std()-Z | fBodyGyroStdDeviationZ | 
| 59 | fBodyAccMag-mean() | fBodyAccelMagMean | 
| 60 | fBodyAccMag-std() | fBodyAccelMagStdDeviation | 
| 61 | fBodyBodyAccJerkMag-mean() | fBodyAccelJerkMagMean | 
| 62 | fBodyBodyAccJerkMag-std() | fBodyAccelJerkMagStdDeviation | 
| 63 | fBodyBodyGyroMag-mean() | fBodyGyroMagMean | 
| 64 | fBodyBodyGyroMag-std() | fBodyGyroMagStdDeviation | 
| 65 | fBodyBodyGyroJerkMag-mean() | fBodyGyroJerkMagMean | 
| 66 | fBodyBodyGyroJerkMag-std() | fBodyGyroJerkMagStdDeviation | 

## Tidiness of data set

This is a tidy data set because:
* Each of the variables is in one column, and there is only one
per column.
* Each observation is in a different row.
* The top of the file has a row with variable names.
* The variable names are human readable and R-compliant.
* The data set has been saved as one file for the single table instead of the 
original multiple files. 

## Process for generating new data set

The new data set was generated by executing the run_analysis() function stored
in run_analysis.R

There are no arguments for run_analysis()

The information is available at:

	https://github.com/LightningKitty/GettingCleaningDataCourseProject

The process was as follows 

1. Unzip the main file (located in working directory). 

2. Read these files:

	a. In the "UCI HAR Dataset" directory
	
		* features.txt - variable names for the "X" files
		
		* activity_labels.txt - code/activity mapping for "Y" files
		
	b. In the "UCI HAR Dataset/test" directory
	
		* subject_test.txt - personal IDs that identify each subject
		
		* X_test.txt - observations data
		
		* Y_test.txt  - activity data
		
	c. In the ""UCI HAR Dataset/train" directory
	
		* subject_train.txt - personal IDs that identify each subject
		
		* X_train.txt - observations data
		
		* Y_train.txt - activity data
	
3. Merge the observations data (X_test and X_train) from both test and training
directories into one table of merged data.

4. Identify the variable names that have "mean()" or "std()", which we know from
the original data set codebook that these are measurements of mean value and
standard deviation value. Other variables with "Mean" in the name were excluded
because they were not measurements on the mean or standard deviation of a 
measurement.

5. Select the columns from the merged data with the desired variable names to 
give the filtered data set.

6. Select the same columns from the features variable name list to get 
the matching variable names. Clean these up so they are R-compliant and 
readable. 

7. Create three extra columns and cbind them to the front of the filtered
data set to make an interim data set:

	a. DataSet - a string identifying whether the row came from test or 
		   training
		   
	b. SubjectID - an integer identifying the subject's ID number (1:30)
	
	c. Activity - a factor replacing the activity numbers with their names:
	
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING

8. Convert the interim data set to a table and then generate the mean for each
subject for each activity for each variable. The mean was chosen as the
average because the measurements are of continuous variables.

9. Reshape the data table generated in step 8 so that it is a narrow table.
Convert back to a data frame and select columns: SubjectID, Activity, Variable, 
Mean.
	
10. Write the data table to the tidydata.txt file.
		