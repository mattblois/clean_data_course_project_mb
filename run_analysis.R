run_analysis<-function(){
  # This is a function designed to:
  # 1. Download and unzip accelerometer data from smartphones attached to 30 different subjects performing different activities.
  # 2. Merge the data tables containing information about the subjects, the activities performed and the measurements recorded by the smartphones. 
  # 3. Replace the activity code(1-6) with a descriptive activity name (walking, walking upstairs, walking downstairs, sitting, standing, laying).
  # 4. Applies descriptive variables names to all variables in the dataset.
  # 5. Extracts only the measurements that measure mean and standard deviation.
  # 6. Creates a seperate data table that lists the average of each measurement for each subject and each activity.
  #
  # First we will create a new directory for the files we are going to download.
    dir.create("run_analysis")
    setwd("run_analysis")
  # Next we will download and unzip data.
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    temp<-tempfile()
    download.file(fileURL, temp, method = "curl")
    data<-unzip(temp)
    unlink(temp)
    # Now we can merge the X_test.txt and X_train.txt datasets.  The obtained dataset was randomly partitioned into two sets, 
    # where 70% of the volunteers was selected for generating the training data and 30% the test data.  
      library(dplyr)
      train<-tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))
      test<-tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
      comb<-bind_rows(train,test)
          # Next we will create a tbl with the information on the subjects.  The subject IDs were not included in the X_train 
          # or the X_test file.  We will combine the subject data with the measurement data later.
          subs.train<-tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))
          subs.test<-tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
          subs<-bind_rows(subs.train, subs.test)
          subs<-rename(subs,Subjects=V1)
            # Now we will create a tbl with descriptive names for the activities.  The original dataset uses numbers (1-6)
            # to label the activities. Here we will create a tbl that records the activities as descriptive names (walking, 
            # walking upstairs, walking downstairs, sitting, standing, laying)
              act.train<-tbl_df(read.table("UCI HAR Dataset/train/Y_train.txt"))
              act.test<-tbl_df(read.table("UCI HAR Dataset/test/Y_test.txt"))
              act<-bind_rows(act.train,act.test)
              act.names<- mutate(act, Activity_Names = ifelse(V1=="1", "Walking",
                                                    ifelse(V1=="2", "Walking Upstairs",
                                                      ifelse(V1=="3", "Walking Downstairs",
                                                        ifelse(V1=="4", "Sitting",
                                                          ifelse(V1=="5", "Standing",
                                                            ifelse(V1=="6", "Laying",
                                                              NA)))))))       
                # Now we will bind the from the subjects tbl, the activities tbl and the measurements tbl into
                # one tbl with all the information.
                comb<-bind_cols(subs[,1],act.names[,2],comb)
                  # Next we will add descriptive names to the variables in the tbl.  We already named the first 2 variables (Subjects, Activity_Names)
                  # when we created the subject and activity tbls, but the other variables are simply named V1, V2, V3,....  Now we will read the variables from 
                  # from the features.txt file and add descriptive variable names to each measurement. 
                  #
                  # NOTE: I decided not to modify the variable names given in the features.txt file.  I considered the variable names sufficiently 
                  # descriptive, and I thought expanding the variable names would have made them cumbersome.  If there is any confusion about the 
                  # meaning of a specific variable a detailed description can be found in the code book located here: https://github.com/mattblois/clean_data_course_project_mb
                    names<-tbl_df(read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE))
                    names<-names$V2
                    colnames(comb)[3:563]<-names
                      # Next we will extract only the measurements that measure mean and standard deviation.  Using grep() we will search all variables and
                      # return only the variables that contain the string "mean" or "std".  We will also return the Subjects and Activity_Names columns so
                      # we know what subject and activity the measurements apply to.
                        filt.col.names<-grep('mean|std', colnames(comb))
                        filt<-comb[,c(1,2,filt.col.names)]
                          # Now we will group the filtered tbl by subjects and by activity.
                          grouped<-group_by(filt, Subjects, Activity_Names)
                            # Now we will summarise each variable for each subject and each activity.
                              summary<-summarise_each(grouped, funs(mean))
  
  # Finally we will print the summarised table.
  print(summary)
}