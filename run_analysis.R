## This file sets out the steps for generating a tidy data set from the
## UCI Machine Learning Repository - Human Activity Recognition Using Smartphones
## Data Set.

## The function run_analysis.R does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

run_analysis <- function() {

    zipDataFile <- "getdata_projectfiles_UCI HAR Dataset.zip"
    
    ## Unzip the data file "getdata_projectfiles_UCI HAR Dataset.zip"
    ## if not already done.
    
    if (!file.exists("UCI HAR Dataset")) {
            if (!file.exists(zipDataFile)) stop("Data file not present")
            else unzip(zipDataFile)
    } 
    
    ## Read each of the tables in the training and test files into R
    
    subject_test <- read.table("UCI HAR Dataset//test//subject_test.txt")
    X_test <- read.table("UCI HAR Dataset//test//X_test.txt")
    Y_test <- read.table("UCI HAR Dataset//test//y_test.txt")
    
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    X_train <- read.table("UCI HAR Dataset//train//X_train.txt")
    Y_train <- read.table("UCI HAR Dataset//train//y_train.txt")
    
    ## Read the features list to get all the variable names
    ## Read the activity labels to get the mapping of activity code to activity name
    
    features <- read.table("UCI HAR Dataset//features.txt")
    activitylabels <- read.table("UCI HAR Dataset//activity_labels.txt")    
    
    ############## STEP 1 #########################
    
    ## Combine the X_test and X_train tables
    
    fullset <- merge(X_test,X_train,all=TRUE)
    
    ## Identify the columns with mean and standard deviation measurements
    ## Note that mean measurements have been assumed that are described as "[Mm]ean"
    ## in the features.txt file, while standard deviation measurements
    ## are those described as "[Ss]td]
    
    meancols <- grepl("[Mm]ean\\(\\)", features$V2)
    stddevcols <- grepl("[Ss]td\\(\\)", features$V2)
    
    ## Use the columns identified above to filter the merged X_test and X_train data
    meanstddevdata <- fullset[,meancols|stddevcols]
    
    ## Filter the features list to get good column names and rename the columns
    ## Clean up the names
    meanstdcolnames <- make.names(features[meancols|stddevcols,"V2"])
    meanstdcolnames <- gsub("(\\.)", "", meanstdcolnames)
    meanstdcolnames <- gsub("(mean)", "Mean", meanstdcolnames)
    meanstdcolnames <- gsub("([Bb]ody[Bb]ody)", "Body", meanstdcolnames)
    meanstdcolnames <- gsub("(Acc)", "Accel", meanstdcolnames)
    
    ## Set the data table's column names to the clean ones
    colnames(meanstddevdata) <- meanstdcolnames
    
    ## Create the dataset, subject ID and Activity columns
    ## NOTE: The order of adding test/train data MUST match the merge order above.
    dataset <- c(replicate(nrow(Y_test), "Test data"),
                 replicate(nrow(Y_train), "Training data"))
    subject <- c(subject_test$V1,subject_train$V1)
    activity <- c(Y_test$V1,Y_train$V1)
    activity <- factor(activity, levels=activitylabels$V1, labels=activitylabels$V2)
    
    ## cbind the dataset column to the left, of the standard deviation and mean data,
    ## cbind the subject and Activity columns to right of data.
    tidydata <- cbind(
                        DataSet = dataset, 
                        SubjectID = subject,
                        Activity = activity,
                        meanstddevdata
                    )
    
    ## Second table - calc average of each variable for each activity and each subject
    require(data.table)
    tidyDT <- data.table(tidydata)
    segdata <- tidyDT[, lapply(.SD, mean), by = c("SubjectID","Activity")]
    
    ## Reshape the resulting data to a narrow form for readability
    ## Take only interesting columns - leave out data set.
    require(reshape2)
    tidySegDT <- melt(segdata,id=c("SubjectID","Activity"),measure.vars=colnames(segdata)[4:69])
    
    ## Tidy up the column names
    newnames <- c(colnames(tidySegDT)[1:2],"Variable","Mean")
    setnames(tidySegDT,colnames(tidySegDT),newnames)
    
    ## Sort by subject and activity
    tidySegDT <- arrange(tidySegDT, SubjectID, Activity)
    
    ## Tidy up columns
    segdata <- data.frame(tidySegDT)
    segdata <- select(segdata,SubjectID,Activity,Variable,Mean)
    
    ## Write the tidy data set out to the file
    write.table(segdata,file = "tidydata.txt", row.name=FALSE)
    
}
