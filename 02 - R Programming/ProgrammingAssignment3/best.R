best <- function(state, outcome) {
        
        ## read outcome data and initialize variables
        results <- data.frame()
        path <- "C:/Users/Steven/Desktop/Coursera/datasciencecoursera/02 - R Programming/ProgrammingAssignment3/outcome-of-care-measures.csv"
        data <- read.csv(path, colClasses = "character")
        
        ## check that state and outcome are valid; otherwise throw error
        if(!(toupper(state) %in% data[,7])){
                stop("invalid state")
        }else if(!(tolower(outcome) %in% c("heart attack", "heart failure", "pneumonia"))){
                stop("invalid outcome")
        }
        
        ## create subset of data with only Hospital, State, and 3 Outcome columns we're interested in
        data <- subset(data, data$State == state,
                       select = c(Hospital.Name, State,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,
                                  Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,
                                  Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
        
        ## turn heart attack/heart failure/pneumonia columns to numeric for processing
        ## and surpress "NAs introduced by coercion" warnings
        suppressWarnings(data[,3] <- as.numeric(data[,3]))
        suppressWarnings(data[,4] <- as.numeric(data[,4]))
        suppressWarnings(data[,5] <- as.numeric(data[,5]))
        
        ## set variable for column number based on input
        if(tolower(outcome) == "heart attack" ){
                x <- 3
        }else if(tolower(outcome) == "heart failure"){
                x <- 4
        }else if (tolower(outcome) == "pneumonia"){
                x <- 5
        }
        
        ## find minimum of corresponding outcome column
        min <- range(data[,x], na.rm = TRUE)[1]
        
        ## further subset data into set of only hospitals with minimum outcome
        results <- subset(data, data[,x] == min, select = Hospital.Name)
        
        ## order results alphabetically and return the first match
        results <- results[order(results$Hospital.Name),1]
        results[1]
}