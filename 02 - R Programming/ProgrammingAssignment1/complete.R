# Script: complete.R
# Author: Steven Pettipas
# Date: 09 Sept 2017
#
# Given a directory containing files of pollution monitoring data (named
# monitorNumber.csv with columns DATE, SULFATE LEVEL, and NITRATE LEVEL),
# report the number of completely observed cases in each file as a data
# frame with columns FILE NAME and # OF COMPLETE CASES.

complete <- function(directory, id = 1:332){
        
        #set working directory and initialize variables
        setwd(directory)
        results <- data.frame()
        nobs<-0
        
        #loop over sequence of specified monitor files
        for(i in seq_along(id)){
                
                #follow XXX file naming convention
                if(id[i] < 10){
                        filePrefix <- "00"   
                }else if(id[i] < 100){
                        filePrefix <- "0"
                }else{
                        filePrefix <- ""
                }
                
                #read file in for monitor id[i]
                file <- paste(filePrefix, id[i], ".csv", sep="")
                data <- read.csv(file)
                
                #omit rows with NA values and find the count of complete cases
                nobs <- nrow(na.omit(data))
                
                #create a data frame for monitor id[i]'s file
                iFile <- data.frame(id = id[i], nobs)
                
                #add monitor id[i]'s row to the results data frame
                results <- rbind(results, iFile)
        }
        
        results
}