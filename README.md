### Getting and Cleaning Data - Course Project

This repository created by LightningKitty on 23 November 2014 to hold
the course project for Getting and Cleaning Data course on Coursera.

There are four files in this repository:

1. README.md - this file
2. tidydata.txt - a tidy data set generated from the UCI Machine Learning 
	Repository Human Activity Recognition Using Smartphones Data Set 
3. Codebook.md - the codebook for the tidy data set
4. run_analysis.R - the R program used to generate the tidy data set from this 
zip file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Note: The zip file was downloaded separately and placed in the R working 
directory.

This data set will be most readable in R. To read the tidy data set back 
into R, use this code written by David Hood at 
https://class.coursera.org/getdata-009/forum/thread?thread_id=58:

	data <- read.table(file_path, header = TRUE)
	View(data)
