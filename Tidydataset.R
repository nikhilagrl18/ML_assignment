
library(tidyverse)
library(lubridate)

# Download dataSet to /Tidydata directory
if(!file.exists("./Tidydata")){dir.create("./Tidydata")}
#Here are the data for the project:
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./Tidydata/Dataset.zip")

# Unzip dataSet to /Tidydata directory
unzip(zipfile="./Tidydata/Dataset.zip",exdir="./Tidydata")

# Load activity labels + features
activityLabels <- read.table("./Tidydata/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./Tidydata/UCI HAR Dataset/features.txt")

# Load the datasets
train <- read.table("./Tidydata/UCI HAR Dataset/train/X_train.txt")
trainActivities <- read.table("./Tidydata/UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("./Tidydata/UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("./Tidydata/UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("./Tidydata/UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("./Tidydata/UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# Merge dataset
fullSet <- rbind(test, train)

# Extract only data on mean and standard deviation
allNames <- c("subject", "activity", as.character(features$V2))
meanStdColumns <- grep("subject|activity|[Mm]ean|std", allNames, value = FALSE)
reducedsubset <- fullSet[ ,meanStdColumns]

# Add labels
names(activityLabels) <- c("activityNumber", "activityName")
reducedsubset$V1.1 <- activityLabels$activityName[reducedsubset$V1.1]

# Label data with descriptive variable name
reducedNames <- allNames[meanStdColumns]
reducedNames <- gsub("^t", "time", reducedNames)
reducedNames <- gsub("^f", "frequency", reducedNames)
reducedNames <- gsub("^anglet", "angleTime", reducedNames)
reducedNames <- gsub("[[:punct:]]", "", reducedNames)
reducedNames <- gsub("mean", "Mean", reducedNames)
reducedNames <- gsub("std", "Std", reducedNames)
reducedNames <- gsub("gravity", "Gravity", reducedNames)
names(reducedsubset) <- reducedNames   

# Create tidy data with average of each variable by activity, and by subject
tidyDataset <- reducedsubset %>% group_by(activity, subject) %>% 
  summarise_all(funs(mean))

write.table(tidyDataset, "tidydataset.txt", row.names = FALSE)

