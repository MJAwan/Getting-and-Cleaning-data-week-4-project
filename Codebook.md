#This is the code book for the project

##How to get to the tidyData.txt:

Download data from the link below and unzip it into working directory of R Studio.
Execute the R script.
About the source data
The source data are from the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About R script
File with R code "run_analysis.R" performs the 5 following steps (in accordance assigned task of course work):

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The code assumes all the data is present in the same folder, un-compressed and without names altered.

About variables:
train_x, train_y, test_x, test_y, train_sub and test_sub contain the data from the downloaded files.
data_x, data_y and data_sub merge the previous datasets to further analysis.
features contains the correct names for the data_x dataset, which are applied to the column names stored in the tidy data set with the average of each variable for each activity and each subject.


About Source code "run_analysis.R" calculates the average for all measurement columns grouped by variables Activity and Subject and then writes the output to a local text file named "tidydata.txt""