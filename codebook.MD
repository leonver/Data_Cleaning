#Getting and Cleaning Data (Coursera). Course Project Codebook 
==============================================================


## Original Data

There original data comes from the smartphone accelerometer and gyroscope 3-axial raw signals, 
which have been processed using various signal processing techniques to measurement vector 
consisting of 561 features. For detailed description of the original dataset, please see 
`features_info.txt` in the zipped dataset file.

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


The subjects, Activities and measurements given in six diferent files are combined to one dataset

## Data sets

The subjects, activities and measurements given in six diferent files are combined to one dataset,
The column names are replace by "subject", "activity" and the names given in the data set "features.txt"

The activity is a value from 1 to 6, There is also a file with a label for each value.
1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


In the resulting dataset the numbers are replaced by the label given with the file "activity_labels.txt"
number of acti

The resulting data set only contains the variables wich contains the string "mean()" in the variable name
The resulting data set contains a subset of the variables described in "features_info.txt" and the subject 
and activity. the number of variables of the result dataset is 35

#### Sample of variables compared to original variable name

  Result data set     | data
  --------------------|--------------
  `subject`           | 2
  `activity           | STANDING
  `tBodyAcc-mean()-X` | 0.257
  `tBodyAcc-mean()-Y` | -0.0233
  `tBodyAcc-mean()-Z` | -0.0147

