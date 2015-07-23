# clean_data_course_project_mb
This is Matt Blois's repository for the Getting and Cleaning Data course project from Coursera.

The repository contains:
1. README.md: A file that provides information about the data used in the project, explains the various files within the repository and provides an explanation of the R code for the function run_analysis.
2. A code book that describes the variables in the dataset.
3. run_analysis.R: An R script that downloads and organizes the "Human Activity Recognition Using Smartphones Dataset
Version 1.0" into a tidy readable tbl.

1. README.md
The R script run_analysis.R uses the "Human Activity Recognition Using Smartphones Dataset
Version 1.0".

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The function run_analysis will do the following:
1. It creates a new directory called run_analysis.
2. It sets run_analysis as the working directory.
3. It downloads a zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The zip file contains data collected from Samsung Galaxy smartphone accelerometers.  
4. It unzips the data.
5. It saves the unzipped data in a folder called UCI HAR Dataset.
6. 
