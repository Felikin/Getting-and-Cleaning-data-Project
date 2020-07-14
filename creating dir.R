library(dplyr)

filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}

