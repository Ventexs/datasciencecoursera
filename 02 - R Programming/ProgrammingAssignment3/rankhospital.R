# Script: rankhospital.R
# Author: Steven Pettipas
# Date: 14 Sept 2017
#
# Given a .CSV file of American hospital data, take a state, outcome
# (heart attack, heart failure, pneumonia), and rank number (based on
# outcome) and find the hospital in the state for the given ranking
# in the given outcome category. In the event of multiple hospitals
# with the lowest mortality rate, use alphabetical ordering to determine
# their rank.

rankhospital <- function(state, outcome, num) {
        
        # valid
        #
        # A function to validate the parent function's arguments
        valid <- function(dataset, state, outcome) {
                if(!(toupper(state) %in% dataset[,7])){
                        stop("invalid state")
                }else if(!(tolower(outcome) %in% c("heart attack", "heart failure", "pneumonia"))){
                        stop("invalid outcome")
                }
        }
        
        # readhospitalfile
        #
        # A function to read in and validate the .CSV file of hospital data
        readhospitalfile <- function(state, outcome) {
                path <- "C:/Users/Steven/Desktop/Coursera/datasciencecoursera/02 - R Programming/ProgrammingAssignment3/outcome-of-care-measures.csv"
                data <- read.csv(path, colClasses = "character")
                
                valid(data, state, outcome)
                
                data
        }   
        
        # cleanData
        #
        # A function that takes in the read .CSV data and cleans it to contain
        # only the necessary columns and data types
        cleanData <- function(dataset, state, outcome) {
                
                if(tolower(outcome) == "heart attack" ){
                        x <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
                }else if(tolower(outcome) == "heart failure"){
                        x <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
                }else if (tolower(outcome) == "pneumonia"){
                        x <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
                }
                
                suppressWarnings(dataset[,x] <- as.numeric(dataset[,x]))
                
                #dataset <- subset(dataset, dataset$State == state, select = c(Hospital.Name, x))
                dataset <- dataset[dataset$State == state, c("Hospital.Name", x)]
                
                dataset
                
        }
        
        #read and validate file/arguments
        data <- readhospitalfile(state, outcome)
        
        #clean data for given state/outcome
        data <- cleanData(data, state, outcome)
        
      
        #order data (numerically and then alphabetically)
        numorder <- order(data[,2], data[,1], na.last = NA)
        data <- data[numorder,]
        
        #find the given rank within the ordered data
        if(num == "best"){
                data <- data[1, 1]
        }else if(num == "worst"){
                data <- data[nrow(data), 1]
        }else{
                data <- data[num, 1]
        }
        
        #return ranked hospital
        data
}

