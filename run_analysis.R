source("creating dir.R")
source("reading files.R")

#Merging train and test
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
mg_data <- cbind(subject, x, y) #one dataset

#Extracting only variables with mean and std
ext_data <- select(mg_data, subject, code, contains("mean"), contains("std"))

#descriptive activity names
ext_data$code <- activities[ext_data$code, 2]

#Appropriately labels the data set with descriptive variable names.
names(ext_data)[2] = "activity"
names(ext_data)<-gsub("Acc", "accelerometer", names(ext_data))
names(ext_data)<-gsub("Gyro", "gyroscope", names(ext_data))
names(ext_data)<-gsub("BodyBody", "body", names(ext_data))
names(ext_data)<-gsub("Mag", "magnitude", names(ext_data))
names(ext_data)<-gsub("^t", "time", names(ext_data))
names(ext_data)<-gsub("^f", "frequency", names(ext_data))
names(ext_data)<-gsub("tBody", "timeBody", names(ext_data))
names(ext_data)<-gsub("-mean()", "mean", names(ext_data), ignore.case = TRUE)
names(ext_data)<-gsub("-std()", "std", names(ext_data), ignore.case = TRUE)
names(ext_data)<-gsub("-freq()", "frequency", names(ext_data), ignore.case = TRUE)
names(ext_data)<-gsub("angle", "angle", names(ext_data))
names(ext_data)<-gsub("gravity", "gravity", names(ext_data))

#Final tidy dataset
fdata <- summarise_all(group_by(ext_data, subject, activity), funs(mean))
write.table(fdata, "Final Data.txt", row.names = FALSE)