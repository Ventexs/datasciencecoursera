#14 Sept 2017
rankall <- function(outcome, num = "best") {
        
        valid <- function(outcome, num) {
                if(!(tolower(outcome) %in% c("heart attack", "heart failure", "pneumonia"))){
                        stop("invalid outcome")
                }else if(!(tolower(as.character(num)) %in% c("best", "worst")) && !(is.numeric(num))){
                        stop("invalid rank")
                }
        }
        
        readhospitalfile <- function() {
                path <- "C:/Users/Steven/Desktop/Coursera/datasciencecoursera/02 - R Programming/ProgrammingAssignment3/outcome-of-care-measures.csv"
                data <- read.csv(path, colClasses = "character")
                
                data
        } 
        
        cleanData <- function(dataset, outcome) {
                
                if(tolower(outcome) == "heart attack" ){
                        x <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
                }else if(tolower(outcome) == "heart failure"){
                        x <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
                }else if (tolower(outcome) == "pneumonia"){
                        x <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
                }
                
                suppressWarnings(dataset[,x] <- as.numeric(dataset[,x]))
                
                #dataset <- subset(dataset, dataset$State == state, select = c(Hospital.Name, x))
                dataset <- dataset[, c("Hospital.Name", "State", x)]
                
                dataset
                
        }
        
        #validate arguments
        valid(outcome, num)
        
        results <- data.frame(Hospital.Name = as.character(), State = as.character())

        
        
        
        #read file
        data <- readhospitalfile()
        
        #clean data for given state/outcome
        data <- cleanData(data, outcome)
        
        #split data by state
        listofsubdata <- split(data, data$State)
        
        #loop over each state to order their data and find the corresponding hospital in
        #that state for the given rank
        for(i in 1:length(listofsubdata)){
                state = listofsubdata[[i]][1,2]
                ord <- order(listofsubdata[[i]][,3], listofsubdata[[i]][,1], na.last = NA)
                stateData <- listofsubdata[[i]][ord,]
                
                if(num == "best"){
                        n <- 1
                }else if(num == "worst"){
                        n <- nrow(stateData)
                }else {
                        n <- num
                }
                
                stateresult <- data.frame(Hospital.Name = stateData[n,1], State = state)
                row.names(stateresult) <- state
                results <- rbind(results, stateresult)
        }
        
        results
}