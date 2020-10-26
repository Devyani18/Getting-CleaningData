#CAPSTONE PROJECT R SCRIPT
#Author - Devyani

#Get provided information about data into dataframes
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n","functions") )
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("n","activity") )
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = "code")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = "code")

#Merge the training and the test sets to create one data set.
XData <- rbind(train_x, test_x)
YData <- rbind(train_y, test_y)
Subject <- rbind(train_subject,test_subject)

#Combine the subjects and x y data
Merged_Data <- cbind(Subject,YData, XData)
library("dplyr")

#Extract only the measurements on the mean and standard deviation for each measurement.
Tidy_Data <- Merged_Data %>% select(subject,code,contains("mean"),contains("std"))

#Use descriptive activity names to name the activities in the data set
Tidy_Data$code <- activities[Tidy_Data$code,2]

#Appropriately label the data set with descriptive variable names.
names(Tidy_Data)[2] <- "activity"
names(Tidy_Data) <- gsub("Acc", "Accelerometer", names(Tidy_Data))
names(Tidy_Data) <- gsub("Gyro", "Gyroscope", names(Tidy_Data))
names(Tidy_Data) <- gsub("Mag", "Magnitude", names(Tidy_Data))
names(Tidy_Data) <- gsub("^t", "Time", names(Tidy_Data))
names(Tidy_Data) <- gsub("^f", "Frequency", names(Tidy_Data))
names(Tidy_Data) <- gsub("tBody", "TimeBody", names(Tidy_Data))
names(Tidy_Data) <- gsub("-mean()", "Mean", names(Tidy_Data), ignore.case = T)
names(Tidy_Data) <- gsub("-std()", "STD", names(Tidy_Data), ignore.case = T)
names(Tidy_Data) <- gsub("-freq()", "Frequency", names(Tidy_Data), ignore.case = T)
names(Tidy_Data) <- gsub("angle", "Angle", names(Tidy_Data), ignore.case = T)
names(Tidy_Data) <- gsub("gravity", "Gravity", names(Tidy_Data))
names(Tidy_Data) <- gsub("BodyBody", "Body", names(Tidy_Data))

#create independent tidy data set with the average of each variable for each activity and each subject.
Final_Data <- Tidy_Data %>% group_by(subject,activity) %>% summarise_all(funs(mean))
write.table(Final_Data, "Final_Data.txt", row.name=FALSE)