# Script: run_analysis.R
# Author: Steven Pettipas
# Date: 08 Oct 2017
#
# Given a path to the UCI HAR Dataset, this function merges the test and train datasets together
# and returns a dataset of the original columns' average mean/standard deviation by subject and activity.

run_analysis <- function(path = getwd()){
        
        ##set working directory to path containing UCI HAR Dataset folder
        setwd(path)
        
        ##read in all the dataset parts
        activity_labels <- read.table("UCI HAR Dataset/activity_Labels.txt", header=FALSE, sep=" ")
        features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
        x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
        x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
        
        ##merge the subject/activity columns to test/train then merge test and train datasets
        dataset <- rbind(cbind(subject_test, y_test, x_test), cbind(subject_train, y_train, x_train))
        
        ##add column names to dataset using provided features
        colnames(dataset) <- c("Subject", "Activity", as.character(features[,2]))
        
        ##set descriptive activity labels
        dataset[,2] <- factor(dataset[,2], labels = as.character(activity_labels[,2]))
        
        ##use regular expressions to find mean and standard deviation columns
        regex <- grep("Subject|Activity|.*mean.*|.*std.*", colnames(dataset))
        
        ##select only mean/standard deviation columns
        dataset <- dataset[,regex]
        
        ##descriptive variable names?
        #remove () from mean/std
        colnames(dataset) <- gsub("\\(\\)", "", colnames(dataset))
        #remove - from names
        colnames(dataset) <- gsub("-", " ", colnames(dataset))
        #change std to Standard Deviation
        colnames(dataset) <- gsub("std", "Standard Deviation", colnames(dataset))
        #change mean/meanFreq to Mean
        colnames(dataset) <- gsub("mean|meanFreq", "Mean", colnames(dataset))
        
        #change x/y/z to x/y/z axis
        colnames(dataset)[grep("[XYZ]", colnames(dataset))] <- paste(colnames(dataset)[grep("[XYZ]", colnames(dataset))], "-Axis", sep="")
        
        #change t/f to Time/Frequency Domain
        colnames(dataset)[grep("^t", colnames(dataset))] <- paste(colnames(dataset)[grep("^t", colnames(dataset))], "(Time Domain)", sep=" ")
        colnames(dataset)[grep("^f", colnames(dataset))] <- paste(colnames(dataset)[grep("^f", colnames(dataset))], "(Frequency Domain)", sep=" ")
        
        colnames(dataset) <- gsub("^t", "", colnames(dataset))
        colnames(dataset) <- gsub("^f", "", colnames(dataset))
        colnames(dataset) <- gsub("Acc", " Acceleration", colnames(dataset))
        colnames(dataset) <- gsub("Jerk", " Jerk", colnames(dataset))
        colnames(dataset) <- gsub("Gyro", " Gyroscope", colnames(dataset))
        colnames(dataset) <- gsub("Mag", " Magnitude", colnames(dataset))
        
        #ie Average Body Acceleration Mean X-axis (Time Domain)
        
        
        
        ##take average of each variable for activity/subject
        splitData <- split(dataset, paste(dataset$Subject, dataset$Activity))
        
        avgData <- dataset[FALSE,]
        
        #add prefix Average to column names
        colnames(avgData[3:81]) <- paste("Average", colnames(avgData[3:81]), sep=" ")
        
        for(i in 1:length(splitData)){
               avgData[i,1:2] <- as.data.frame(splitData[i])[1,1:2]
               avgData[i,3:81] <- colMeans(as.data.frame(splitData[i])[,3:81])
        }
        
        avgData[order(avgData$Subject),]
        
}