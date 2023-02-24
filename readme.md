## Course Project - Getting and Cleaning Data

This is the assignemnt for the course "Getting and Cleaning Data. 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The R script "Tidydataset.R" performs the following actions:

1. Downloads the dataset if it does not already exist in the working directory.
2. Loads the activity, feature information, training and test datasets.
3. Loads the activity and subject data for each dataset and merges training and test sets to create one data set.
4. Extracts only measurement on mean and standard deviation
5. Use descriptive activities names for activity measurements.
6. Appropriately label the dataset with descriptive names
7. Creates a tidy dataset consisting of the average (mean) value of each variable for each subject and activity pair.

The resulting output is saved as a file named "tidydataset.txt.