# COURSERA: Getting And Cleaning Data - Course Project

## Calculations
The run_analysis.R script does the following:
1.Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables
The returned dataset of run_analysis includes 81 variables.

### Identifiers
Variables which identify the data subject (1-30) and activity (laying, sitting, standing, walking, walking upstairs, walking downstairs):

*[1] "Subject": (numeric) 1-30                                               
*[2] "Activity": (character) laying, sitting, standing, walking, walking upstairs, walking downstairs
    
### Time Domain Signals
Variables which show the calculated average mean or standard deviation of measurements by subject/activity in the XYZ axises and measured in the original dataset in the time domain:
                                             
*[3] "Average Body Acceleration Mean X-Axis (Time Domain)"                           
*[4] "Average Body Acceleration Mean Y-Axis (Time Domain)"                           
*[5] "Average Body Acceleration Mean Z-Axis (Time Domain)"                           
*[6] "Average Body Acceleration Standard Deviation X-Axis (Time Domain)"             
*[7] "Average Body Acceleration Standard Deviation Y-Axis (Time Domain)"             
*[8] "Average Body Acceleration Standard Deviation Z-Axis (Time Domain)"             
*[9] "Average Gravity Acceleration Mean X-Axis (Time Domain)"                        
*[10] "Average Gravity Acceleration Mean Y-Axis (Time Domain)"                        
*[11] "Average Gravity Acceleration Mean Z-Axis (Time Domain)"                        
*[12] "Average Gravity Acceleration Standard Deviation X-Axis (Time Domain)"          
*[13] "Average Gravity Acceleration Standard Deviation Y-Axis (Time Domain)"          
*[14] "Average Gravity Acceleration Standard Deviation Z-Axis (Time Domain)"          
*[15] "Average Body Acceleration Jerk Mean X-Axis (Time Domain)"                      
*[16] "Average Body Acceleration Jerk Mean Y-Axis (Time Domain)"                      
*[17] "Average Body Acceleration Jerk Mean Z-Axis (Time Domain)"                      
*[18] "Average Body Acceleration Jerk Standard Deviation X-Axis (Time Domain)"        
*[19] "Average Body Acceleration Jerk Standard Deviation Y-Axis (Time Domain)"        
*[20] "Average Body Acceleration Jerk Standard Deviation Z-Axis (Time Domain)"        
*[21] "Average Body Gyroscope Mean X-Axis (Time Domain)"                              
*[22] "Average Body Gyroscope Mean Y-Axis (Time Domain)"                              
*[23] "Average Body Gyroscope Mean Z-Axis (Time Domain)"                              
*[24] "Average Body Gyroscope Standard Deviation X-Axis (Time Domain)"                
*[25] "Average Body Gyroscope Standard Deviation Y-Axis (Time Domain)"                
*[26] "Average Body Gyroscope Standard Deviation Z-Axis (Time Domain)"                
*[27] "Average Body Gyroscope Jerk Mean X-Axis (Time Domain)"                         
*[28] "Average Body Gyroscope Jerk Mean Y-Axis (Time Domain)"                         
*[29] "Average Body Gyroscope Jerk Mean Z-Axis (Time Domain)"                         
*[30] "Average Body Gyroscope Jerk Standard Deviation X-Axis (Time Domain)"           
*[31] "Average Body Gyroscope Jerk Standard Deviation Y-Axis (Time Domain)"           
*[32] "Average Body Gyroscope Jerk Standard Deviation Z-Axis (Time Domain)"           
*[33] "Average Body Acceleration Magnitude Mean (Time Domain)"                        
*[34] "Average Body Acceleration Magnitude Standard Deviation (Time Domain)"          
*[35] "Average Gravity Acceleration Magnitude Mean (Time Domain)"                     
*[36] "Average Gravity Acceleration Magnitude Standard Deviation (Time Domain)"       
*[37] "Average Body Acceleration Jerk Magnitude Mean (Time Domain)"                   
*[38] "Average Body Acceleration Jerk Magnitude Standard Deviation (Time Domain)"     
*[39] "Average Body Gyroscope Magnitude Mean (Time Domain)"                           
*[40] "Average Body Gyroscope Magnitude Standard Deviation (Time Domain)"             
*[41] "Average Body Gyroscope Jerk Magnitude Mean (Time Domain)"                      
*[42] "Average Body Gyroscope Jerk Magnitude Standard Deviation (Time Domain)"

### Frequency Domain Signals
Variables which show the calculated average mean or standard deviation of measurements by subject/activity in the XYZ axises and calculated in the original dataset in the frequency domain using a Fast Fourier Transform:  
     
*[43] "Average Body Acceleration Mean X-Axis (Frequency Domain)"                      
*[44] "Average Body Acceleration Mean Y-Axis (Frequency Domain)"                      
*[45] "Average Body Acceleration Mean Z-Axis (Frequency Domain)"                      
*[46] "Average Body Acceleration Standard Deviation X-Axis (Frequency Domain)"        
*[47] "Average Body Acceleration Standard Deviation Y-Axis (Frequency Domain)"        
*[48] "Average Body Acceleration Standard Deviation Z-Axis (Frequency Domain)"        
*[49] "Average Body Acceleration Mean X-Axis (Frequency Domain)"                      
*[50] "Average Body Acceleration Mean Y-Axis (Frequency Domain)"                      
*[51] "Average Body Acceleration Mean Z-Axis (Frequency Domain)"                      
*[52] "Average Body Acceleration Jerk Mean X-Axis (Frequency Domain)"                 
*[53] "Average Body Acceleration Jerk Mean Y-Axis (Frequency Domain)"                 
*[54] "Average Body Acceleration Jerk Mean Z-Axis (Frequency Domain)"                 
*[55] "Average Body Acceleration Jerk Standard Deviation X-Axis (Frequency Domain)"   
*[56] "Average Body Acceleration Jerk Standard Deviation Y-Axis (Frequency Domain)"   
*[57] "Average Body Acceleration Jerk Standard Deviation Z-Axis (Frequency Domain)"   
*[58] "Average Body Acceleration Jerk Mean X-Axis (Frequency Domain)"                 
*[59] "Average Body Acceleration Jerk Mean Y-Axis (Frequency Domain)"                 
*[60] "Average Body Acceleration Jerk Mean Z-Axis (Frequency Domain)"                 
*[61] "Average Body Gyroscope Mean X-Axis (Frequency Domain)"                         
*[62] "Average Body Gyroscope Mean Y-Axis (Frequency Domain)"                         
*[63] "Average Body Gyroscope Mean Z-Axis (Frequency Domain)"                         
*[64] "Average Body Gyroscope Standard Deviation X-Axis (Frequency Domain)"           
*[65] "Average Body Gyroscope Standard Deviation Y-Axis (Frequency Domain)"           
*[66] "Average Body Gyroscope Standard Deviation Z-Axis (Frequency Domain)"           
*[67] "Average Body Gyroscope Mean X-Axis (Frequency Domain)"                         
*[68] "Average Body Gyroscope Mean Y-Axis (Frequency Domain)"                         
*[69] "Average Body Gyroscope Mean Z-Axis (Frequency Domain)"                         
*[70] "Average Body Acceleration Magnitude Mean (Frequency Domain)"                   
*[71] "Average Body Acceleration Magnitude Standard Deviation (Frequency Domain)"     
*[72] "Average Body Acceleration Magnitude Mean (Frequency Domain)"                   
*[73] "Average Body Acceleration Jerk Magnitude Mean (Frequency Domain)"              
*[74] "Average Body Acceleration Jerk Magnitude Standard Deviation (Frequency Domain)"
*[75] "Average Body Acceleration Jerk Magnitude Mean (Frequency Domain)"              
*[76] "Average Body Gyroscope Magnitude Mean (Frequency Domain)"                      
*[77] "Average Body Gyroscope Magnitude Standard Deviation (Frequency Domain)"        
*[78] "Average Body Gyroscope Magnitude Mean (Frequency Domain)"                      
*[79] "Average Body Gyroscope Jerk Magnitude Mean (Frequency Domain)"                 
*[80] "Average Body Gyroscope Jerk Magnitude Standard Deviation (Frequency Domain)"   
*[81] "Average Body Gyroscope Jerk Magnitude Mean (Frequency Domain)"  