#getting and cleaning data course project
==============================

#Repository for Getting and Cleaning Data Course Project.

To get the data set ready for futher analyses run the script run_analysis.R

This scrip only needs the data packages "base" and "utils"

To run the script just run source("run_analysis.R")

The script downloads the data, when not already downloaded. 
The downloaded data is stored in a directory with the name downloaddata.
This directory should be a subdirectory from the working directory, If this directory does
not exits it's created.

the data is unziped, the unzipped date is stored in the same directory as the downloaded zip file.


## Processing steps

The step given in the peer assignment document 

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the 
   average of each variable for each activity and each subject.

are executed in the order 1, 4, 2, 3, 5

The steps are added as remarks in the "run_analysis.R" file
