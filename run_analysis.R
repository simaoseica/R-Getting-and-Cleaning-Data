
# Download the zip file that contains the data sets
data_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zip_file <- 'dataset.zip'

download.file(data_url, destfile = zip_file, method = 'curl')
unzip(zip_file)


# Load data sets to local vars
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Load all tests to local vars
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Load all trains to local vars
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


## -------------------------------------------------------------------------
## 1. Merges the training and the test sets to create one data set.
## 3. Uses descriptive activity names to name the activities in the data set
## -------------------------------------------------------------------------

# Create the vector of named activities
activities_test = activity_labels[y_test[,1]]
activities_train = activity_labels[y_train[,1]]

# Create table with subject, activities and simulation info
test_data <- cbind(subject_test, activity = activities_test, x_test)
train_data <- cbind(subject_train, activity = activities_train, x_train)

# Merge all rows from test and train data sets
all_data = rbind(test_data, train_data)


## -----------------------------------------------------------------------------------------
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## -----------------------------------------------------------------------------------------

refined_data = all_data[,c(TRUE,TRUE, grepl("mean|std", features))]


## ---------------------------------------------------------------------
## 4. Appropriately labels the data set with descriptive variable names. 
## ---------------------------------------------------------------------

names(refined_data) = c("Subject", "Activity", grep("mean|std", features, value= TRUE))


## -------------------------------------------------------------------------------------------------------------------------------------------------
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## -------------------------------------------------------------------------------------------------------------------------------------------------

if (!require("reshape2")) { install.packages("reshape2") }
if (!require("data.table")) { install.packages("data.table") }
library(reshape2)
library(data.table)

# Reshape the data
melted_data <- melt(as.data.table(refined_data), id=c(1:2))

# Run mean function to dataset
tidy_data <- dcast(melted_data, Subject + Activity ~ variable, mean)

# Save the tidy table to a csv file
write.csv(tidy_data, file = "./tidy_data.csv", row.names=FALSE)