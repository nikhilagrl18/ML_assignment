## Course Project - Getting and Cleaning Data

This project is an exercise in acquiring and cleaning data. The project uses data from the UCI Machine Learning Repository: Human Activity Recognition and Smart Phone Data site: [Link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Data for the project can be downloaded here: [Zip Archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The original data was transformed by:

1. Downloading the dataset if it does not already exist in the working directory.
2. Loading the activity, feature information, training and test datasets.
3. Loading the activity and subject data for each dataset and merging training and test sets to create one data set.
4. Extracting only measurement on mean and standard deviation
5. Using descriptive activities names for activity measurements.
6. Appropriately labelling the dataset with descriptive names
7. Creating a tidy dataset consisting of the average (mean) value of each variable for each subject and activity pair.

### About Variables:

### Data Scource:
url = Data source for project

### Files in zipped data source folder imported for processing
activityLabels = Activity codes and corresponding activity names
features = feature names in X_test and X_train files
train = train set feature measurements
trainActivities = train set acivity
trainSubjects = train set subject number


test = test set feature measurements
testActivities = test set acivity
testSubjects = test set subject number


### Combined datasets
train = Updated to include trainActivities and trainSubjects as (trainSubjects, trainActivities, train) by columns
test = Updated to include testActivities and testSubjects as (testSubjects, testActivities, test) by columns
completeset = combined test and train dataset by rows

### Column names
allNames = set of names corresponding to completeset
meanStdColumns = subject, activity, and all features with mean or standard deviation
reducedsubset = completeset subsetted with meanStdColumns
reducedNames = allNames subsetted with meanStdColumns

### Final tidy dataset
tidyDataset = dataset consisting of the average (mean) value of each variable for each subject and activity pair
