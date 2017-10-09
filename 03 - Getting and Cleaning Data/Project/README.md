The run_analysis script takes a path where the UCI HAR Dataset folder is saved (defaults to the current working directory) and reads in all the components of the dataset (activity_labels, features, subject_test, x_test, y_test, subject_train, x_train, y_train [see UCI HAR Dataset README for details]).

The fuction then merges the test and train datasets together, adds descriptive labels to the ACTIVITY column, and uses regular expressions to select the mean/standard deviation columns out of the 561 variables. Regular Expressions are further used to clean the variable names.

The dataset is then looped over to calculate the average of each column before returning the dataset.