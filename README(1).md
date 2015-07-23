---
title: "README.md"
author: "Matt Blois"
date: "Thursday, July 23, 2015"
output: html_document
---
This is Matt Blois's repository for the Getting and Cleaning Data course project from Coursera.

The repository contains:
  1. README.md: A file that provides information about the data used in the project, explains the various files          within the repository and provides an explanation of the R code for the function run_analysis.
  2. A code book that describes the variables in the dataset.
  3. run_analysis.R: An R script that downloads and organizes the "Human Activity Recognition Using Smartphones     Dataset Version 1.0" into a tidy, readable tbl.

The R script run_analysis.R uses the "Human Activity Recognition Using Smartphones Dataset Version 1.0".

In the 'README.txt' file included in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" the authors of the data (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto) describe their data: 

  "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person       performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone     (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration   and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data          manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for     generating the training data and 30% the test data. 

  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in            fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has     gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and       gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff     frequency was used. From each window, a vector of features was obtained by calculating variables from the time and           frequency domain. See 'features_info.txt' for more details. 

  For each record it is provided:

    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    - Triaxial Angular velocity from the gyroscope. 
    - A 561-feature vector with time and frequency domain variables. 
    - Its activity label. 
    - An identifier of the subject who carried out the experiment.

  For more information about this dataset contact: activityrecognition@smartlab.ws"


