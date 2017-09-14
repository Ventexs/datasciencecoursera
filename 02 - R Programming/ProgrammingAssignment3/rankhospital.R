#14 Sept 2017
rankhospital <- function(state, outcome, num) {
        
        valid <- function(dataset, state, outcome) {
                if(!(toupper(state) %in% dataset[,7])){
                        stop("invalid state")
                }else if(!(tolower(outcome) %in% c("heart attack", "heart failure", "pneumonia"))){
                        stop("invalid outcome")
                }
        }
        
        readhospitalfile <- function(state, outcome) {
                path <- "C:/Users/Steven/Desktop/Coursera/datasciencecoursera/02 - R Programming/ProgrammingAssignment3/outcome-of-care-measures.csv"
                data <- read.csv(path, colClasses = "character")
                
                valid(data, state, outcome)
                
                data
        }   
        
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
        
      
        #order data
        numorder <- order(data[,2], data[,1], na.last = NA)
        data <- data[numorder,]
        
        
        if(num == "best"){
                data <- data[1, 1]
        }else if(num == "worst"){
                data <- data[nrow(data), 1]
        }else{
                data <- data[num, 1]
        }
        
        data
}

