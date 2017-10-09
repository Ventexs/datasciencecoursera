# COURSERA: Getting And Cleaning Data - Course Project

## Purpose
The purpose of this project is to get hands on experience with getting and cleaning data in order to create tidy datasets.

## Requirements
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

## Data Source
The data source used in this project can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## run_analysis.R
The run_analysis script takes a path where the UCI HAR Dataset folder is saved (defaults to the current working directory) and reads in all the components of the dataset (activity_labels, features, subject_test, x_test, y_test, subject_train, x_train, y_train [see UCI HAR Dataset README for details]).

The fuction then merges the test and train datasets together, adds descriptive labels to the ACTIVITY column, and uses regular expressions to select the mean/standard deviation columns out of the 561 variables. Regular Expressions are further used to clean the variable names.

The dataset is then looped over to calculate the average of each column before returning the dataset.