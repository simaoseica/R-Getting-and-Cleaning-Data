Getting and Cleaning Data Course Project
==================================================================

The purpose of this project is to collect, work with, and clean a data set. 
It will result in a creation of a tidy data set that can be used for later analysis.

The R script that downloads the raw data and that creates the tidy data set is under the name `run_analysis.R`. 


The main steps in the script are: 
=========================================

1. Merge the training and the test sets to create one data set.

2. Extract only the measurements on the mean and standard deviation for each measurement. 

3. Use descriptive activity names to name the activities in the data set

4. Label the data set with descriptive variable names. 

5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.


Data Source 
=========================================
The data linked from the course website represents data collected from the accelerometers of the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be found here:
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  


The dataset includes the following files:
=========================================

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 