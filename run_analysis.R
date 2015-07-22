run_analysis.R<-function(){
  # Create a directory for the files
    dir.create("run_analysis")
    setwd("run_analysis")
  # Download and unzip data
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    temp<-tempfile()
    download.file(fileURL, temp, method = "curl")
    data<-unzip(temp)
    unlink(temp)
    #Merge test and training datasets
      library(dplyr)
      train<-tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))
      test<-tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
      comb<-bind_rows(train,test)
          # Create a tbl of subjects and combine activity labels
          subs.train<-tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))
          subs.test<-tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
          subs<-bind_rows(subs.train, subs.test)
          subs<-rename(subs,Subjects=V1)
            # Add activity labels
              act.train<-tbl_df(read.table("UCI HAR Dataset/train/Y_train.txt"))
              act.test<-tbl_df(read.table("UCI HAR Dataset/test/Y_test.txt"))
              act<-bind_rows(act.train,act.test)
              # Descriptively name activities
              act.names<- mutate(act, Activity_Names = ifelse(V1=="1", "Walking",
                                                    ifelse(V1=="2", "Walking Upstairs",
                                                      ifelse(V1=="3", "Walking Downstairs",
                                                        ifelse(V1=="4", "Sitting",
                                                          ifelse(V1=="5", "Standing",
                                                            ifelse(V1=="6", "Laying",
                                                              NA)))))))       
                # Bind subjects activities and measurments
                comb<-bind_cols(subs[,1],act.names[,2],comb)
                  # Name variables
                    names<-tbl_df(read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE))
                    names<-names$V2
                    colnames(comb)[3:563]<-names
                      # Extract mean and standard deviation
                        filt.col.names<-grep('mean|std', colnames(comb))
                        filt<-comb[,c(1,2,filt.col.names)]
                          # Group by subjects and activity
                          grouped<-group_by(filt, Subjects, Activity_Names)
                            # Summarise data
                              summary<-summarise_each(grouped, funs(mean))
  
  print(summary)
  
  
}