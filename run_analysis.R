## this script creates a dataset from series of files downloaded from the
## internet.

## The files consist of measured data "X_test.txt" and "X_train.txt".
## The measurements are from for certain activities. There are 6 activities.
## The persons (Subjects) who have been meassured are stored in separted files 
## "subject_test.txt" and "subject_train.txt". To know which measurements 
## belong to which persons these files have to be combined. 

## The activities are given in number from 1 to 6. The description of these
## labels are given in the file "activity_labels.txt".

## The names of the measured variables are not in the date set but in a 
## separate file "features.txt". The values in the features.txt file have
## to be used as column_names. The column_names will be cleared from special
## characters.

# Conditional download data from the internet

# Create a data folder for the data to download
if (!file.exists("downloaddata")) 
{
    dir.create("./downloaddata")
}

#name to give to the dataset to download
dataset.zip <- "./downloaddata/dataset.zip"

if (!file.exists(dataset.zip))
{
    #location of the file to download
    downloadurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    #execute download
    download.file(downloadurl, destfile=dataset.zip, mode="wb")
    #extract the data from the zipfile
    unzip(dataset.zip, exdir="./downloaddata")
    file.rename("./downloaddata/UCI HAR Dataset","./downloaddata/Dataset")
}

##1.Merges the training and the test sets to create one data set.
    # Read the persons data from the test and training data sets
    test_subj<-read.table("./downloaddata/Dataset/test/subject_test.txt")
    train_subj<-read.table("./downloaddata/Dataset/train/subject_train.txt")
    
    # combine the two persons dataset to one dataset
    all_subj <- test_subj
    all_subj<-rbind(all_subj,train_subj)

    #remove help files
    rm(test_subj, train_subj)

    # Read the activities data from the person who participated in the test and training
    test_act<-read.table("./downloaddata/Dataset/test/y_test.txt")
    train_act<-read.table("./downloaddata/Dataset/train/y_train.txt")
    
    # combine the two activity dataset to one dataset
    all_act <- test_act
    all_act<-rbind(all_act,train_act) 
    
    #remove help files
    rm(test_act, train_act)

    # Read the Measurments form the test and training files
    test_meas<-read.table("./downloaddata/Dataset/test/X_test.txt")
    train_meas<-read.table("./downloaddata/Dataset/train/X_train.txt")
    
    # combine the two measurments  dataset to one dataset
    all_meas<-test_meas
    all_meas<-rbind(all_meas,train_meas)
    
    #remove help files
    rm(test_meas, train_meas)

    # Merge the datasets to one dataset
    merged_data <- cbind(all_subj, all_act, all_meas)
    
    #remove help files
    rm(all_subj, all_act, all_meas)

##4.Appropriately labels the data set with descriptive variable names. 
    colnames(merged_data)[1] <- "subjects"  
    colnames(merged_data)[2] <- "activity"  

    # Read the column names of the measurement from the file "features.txt"
    column_names<-read.table("./downloaddata/Dataset/features.txt",stringsAsFactors=F)

    # Rename the column name of all_meas with the values of column_names
    for (i in 1:(nrow(column_names)))
    {
        colnames (merged_data)[i + 2] <- column_names[i ,2]
    }

    #remove help files
    rm(column_names)

##2.Extracts only the measurements on the mean and standard deviation for each measurement
    # select the names of the measurments ("xxxmean()xxx") and std ("xxxstd()xxx")
    sel_vars <- grep("(mean|std)[/(/)]",colnames(merged_data),value=T)

    ## subsetting the measurements
    sel_data <- merged_data[c("subjects", "activity", sel_vars)]
    
    #remove help files
    rm(sel_vars)

## 3.Uses descriptive activity names to name the activities in the data set

    # Read the activity labels from "activity_labels.txt" for activities 
    act_lab <-read.table("./downloaddata/Dataset/activity_labels.txt",stringsAsFactors=F)

    # change the activity number from all_act by the activity label from act_label
    for(i in 1:nrow(sel_data))
    {
        lab_nr<-which(act_lab[,1] == sel_data[i,2])
        sel_data$activity[i]<-act_lab[lab_nr,2]
    }
    
    #remove help files
    rm(act_lab)

## 5.From the data set in step 4, creates a second, independent tidy data set 
##     with the average of each variable for each activity and each subject.
    sel_vars <- grep("mean[/(/)]",colnames(sel_data),value=T)
    sel_data2 = sel_data[c("subjects", "activity", sel_vars)]

    write.csv(sel_data2,"tidy_data_set.txt",row.names=FALSE)
    
    #remove help files
    rm(merged_data, sel_data)


