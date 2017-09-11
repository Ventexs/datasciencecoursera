# Script: corr.R
# Author: Steven Pettipas
# Date: 11 Sept 2017
#
# Given a directory containing files of pollution monitoring data (named
# monitorNumber.csv with columns DATE, SULFATE LEVEL, and NITRATE LEVEL),
# take a threshold of number of complete cases in each file, and compute
# the correlation between sulfate and nitrate levels for all files above
# that threshold.

corr <- function(directory, threshold = 0){
        
        #set working directory and initialize variables
        setwd(directory)
        fileNum <- length(list.files(directory))
        data <- data.frame()
        results <- numeric()
        
        #loop over monitors to find which ones meet threshold
        for(i in 1:fileNum){
                nobs <- complete(directory, i)
                if(nobs[1,2] > threshold){
                        #read file i
                        #follow XXX file naming convention
                        if(i < 10){
                                filePrefix <- "00"   
                        }else if(i < 100){
                                filePrefix <- "0"
                        }else{
                                filePrefix <- ""
                        }
                        
                        #read file in for monitor id[i]
                        file <- paste(filePrefix, i, ".csv", sep="")
                        data <- na.omit(read.csv(file))
                        
                        #calculate correlation
                        results <- c(results,cor(data[,2],data[,3]))
                        #append to results
                        
                }
        }
        
        results
}