# JHU_Getting-and-Cleaning-Data-Course-Project
Project submission. Getting and Cleaning Data Course Project

## Overview
A project to test the ability to take messy data and refine it to create a usable data set that is tidy.
Additionally to demonstrate the ability to combine data sitting in multipe tables/files.

Items submitted are outlined below
## readme.md
This file outling an overview of the submission

## run_analysis.R
The R script (run_analysis.R) does the following in the laid out order:
1. Merges the training and the test sets as downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Assign4_TidyData.txt
A text file file resulting from the cleaned dataset output by run_analysis.R.
The file contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation calculted from the base original dataset.

## Code Book
A document desrcibing the variables and elements used in the code. 
