# Script: pollutemean.R
# Author: Steven Pettipas
# Date: 09 Sept 2017
#
# Given a directory containing files of pollution monitoring data (named
# monitorNumber.csv with columns DATE, SULFATE LEVEL, and NITRATE LEVEL),
# calculate the mean of a given pollutant over a given number of monitors.

pollutantmean <- function(directory, pollutant, id = 1:332){
        
        #set working directory and initialize variables
        setwd(directory)
        allSubData <- data.frame()
        
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
                allData <- read.csv(file)
                
                #get subset of data for specified pollutant
                subData <- subset(allData, select = pollutant)
                
                #add monitor id[i]'s pollutant data to rest of monitors' data
                allSubData <- rbind(allSubData, subData)
        }
        
        #calculate mean of one long column of all monitors' data
        as.numeric(colMeans(allSubData, na.rm=TRUE))
}