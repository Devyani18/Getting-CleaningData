This file contains the description of the variables used in the run_analysis.R script.

features <- 561 rows, 2 columns
The features selected for this database whose values are given in the zip files.

activities <-  6 rows, 2 columns
List of activities over which the corresponding measurements were taken and its labels or codes

test_subject <- 2947 rows, 1 column
contains values for test data of 9 subjects observed

train_subject <- 7352 rows, 1 column
contains values for training data of 21 subjects observed

test_x <- test/X_test.txt : 2947 rows, 561 columns
contains recorded features for subjects observed for test data

test_y <- test/Y_test.txt : 2947 rows, 1 columns 
contains test data of activities code label for subjects observed for test data

train_x <- train/X_train.txt : 7352 rows, 561 columns
contains recorded features for subjects observed for training data

train_y <- train/Y_train.txt : 7352 rows, 1 columns
contains training data of activities code label for subjects observed for training data

XData <- 10299 rows, 561 columns, Merged test and training features data
YData <- 10299 rows, 1 column, Merged test and training activities data
Subject <- 10299 rows, 1 column, Merged test and training subjects data

Merged_Data <- 10299 rows, 563 column, created by combining subjects, activities and features

Tidy_Data <- 10299 rows, 88 columns, contains only the measurements on the mean and standard deviation for each measurement
"code" column in Tidy_Data replaced with names of activities taken from "activities" dataset
code column in TidyData renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time

Final_Data <- 180 rows, 88 columns, tidy data set with the average of each variable for each activity and each subject.
Exported Final_Data to Final_Data.txt file present in the repo.

