library(dplyr)
## Reading the files from the working directory using relative path
## Loading features Data

test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")

## Combining the features data

data_x <-rbind(test_x,train_x)

## Reading the feature Names

features <- read.table("./UCI HAR Dataset/features.txt")

## Labeling combined Training data with features 

names(data_x) <- features$V2

## Selecting the desired features containing mean and std

sel_features <- grep( ".*mean\\(\\)|std\\(\\)", features$V2)
req_features <- select(data_x, all_of(sel_features))

##Loading Test and Training set Subjects

test_sub <- read.table("./UCI HAR Dataset/test/Subject_test.txt")
train_sub <- read.table("./UCI HAR Dataset/train/Subject_train.txt")


## Combining the Test and Training set Subjects

data_sub <-rbind(test_sub,train_sub)

## naming the Subjects vector

names(data_sub) <- "Subject"

## Loading Test and Training set Activities

test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt")
train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt")


## Combining the Test and Training set Activities

data_y <-rbind(test_y,train_y)

## Loading Activity Labels

activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")

##Use descriptive activity names to name the activities in the data set
## Renaming activity labels and activity data

names(activity_label) <- c("Activity.Code", "Activity.Name")
names(data_y) <- "Activity.Code"

## Mapping the activity names
Activity <- left_join(data_y, activity_label, "Activity.Code")$Activity.Name

## Joining the DataSet with mean and standard deviations
dataSet<- cbind( data_sub, Activity, req_features)

##Appropriately labels the data set with descriptive variable names.
## Giving meaningful names to the columns

names(dataSet)<-gsub("^t", "time", names(dataSet))
names(dataSet)<-gsub("^f", "frequency", names(dataSet))
names(dataSet)<-gsub("Acc", "Accelerometer", names(dataSet))
names(dataSet)<-gsub("Gyro", "Gyroscope", names(dataSet))
names(dataSet)<-gsub("Mag", "Magnitude", names(dataSet))
names(dataSet)<-gsub("BodyBody", "Body", names(dataSet))

## Grouping all data by Subject and activity

dataSet <- group_by(dataSet,Subject, Activity)

## Summarize the grouped data and taking the mean value

tidy_data <- summarise_all(dataSet,mean)

#Save this tidy dataset to local file

write.table(tidy_data, file = "tidydata.txt",row.name=FALSE)