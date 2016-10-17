getwd()  ##Check location of working directory.

#Load Libraries needed to run code
library(dplyr) 
library(data.table) 
library(tidyr) 

# Source the data file. Copy to working directory then unzip for use.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileUrl,destfile="./data/Dataset.zip") 
unzip(zipfile="./data/Dataset.zip",exdir="./data") 

# Define location of Base (raw) data
RawDataSet <- "./data/UCI HAR Dataset" 

#Requirement1.Merges the training and the test sets to create one data set.
## Create Data Frame for each file we want to work with
  Subject_Train <- tbl_df(read.table(file.path(RawDataSet,"train", "subject_train.txt"))) 
  Activity_Train <- tbl_df(read.table(file.path(filex, "train", "Y_train.txt"))) 
  Data_Train <- tbl_df(read.table(file.path(filex, "train", "X_train.txt" ))) 
  Subject_Test  <- tbl_df(read.table(file.path(filex, "test" , "subject_test.txt" )))
  Activity_Test  <- tbl_df(read.table(file.path(filex, "test" , "Y_test.txt" ))) 
  Data_Test  <- tbl_df(read.table(file.path(filex, "test" , "X_test.txt" ))) 

## Merge similar tables together for Test & Train and 
## clean "One Type in Multiple Tables" data.
  Subject <- rbind(Subject_Train, Subject_Test)
    setnames(Subject,"V1", "subject") 
  Activity<- rbind(Activity_Train, Activity_Test)
    setnames(Activity,"V1", "activityNum")
  Data_All <- rbind(Data_Train, Data_Test)
  
## Tidy data in Features data set 
  Features <- tbl_df(read.table(file.path(filex, "features.txt"))) 
    setnames(Features, names(Features), c("featureNum", "featureName")) 
    colnames(Data_All) <- Features$featureName 

## Obtain Label dataset and create column headers
  Labels<- tbl_df(read.table(file.path(RawDataSet, "activity_labels.txt"))) 
    setnames(Labels, names(Labels), c("activityNum","activityName")) 

## Bring all data together using column bind
    Galaxy_Subject<- cbind(All_Subject, All_Activity) 
    Galaxy_Data <- cbind(Galaxy_Subject, Data_All) 

# Requirement2. Extracting only the measurements on the mean and standard deviation 
#  for each measurement
  Features_MeanStd <- grep("mean\\(\\)|std\\(\\)",Features$featureName,value=TRUE) 
  Features_MeanStd <- union(c("subject","activityNum"), Features_MeanStd) 
  Galaxy_MeanStd<- subset(Galaxy_Data,select=FeaturesMeanStd) 
  
#Requirement3. Use descriptive activity names to name the activities in the data set
  ## Merge the Mean & Standard Deviation data frames usign ActivityNum as the common key.
  Galaxy_MeanStd_2 <- merge(Labels, Galaxy_MeanStd , by="activityNum", all.x=TRUE) 
  Galaxy_MeanStd_2$activityName <- as.character(Galaxy_MeanStd_2$activityName) 
  
#Requirement4. Label the data set with descriptive variable names. 
  names(Galaxy_MeanStd_2)<-gsub("std()", "Std Dev", names(Galaxy_MeanStd_2)) 
  names(Galaxy_MeanStd_2)<-gsub("mean()", "Mean", names(Galaxy_MeanStd_2)) 
  names(Galaxy_MeanStd_2)<-gsub("^t", "Time", names(Galaxy_MeanStd_2)) 
  names(Galaxy_MeanStd_2)<-gsub("^f", "Frequency", names(Galaxy_MeanStd_2)) 
  names(Galaxy_MeanStd_2)<-gsub("Acc", "Accelerometer", names(Galaxy_MeanStd_2)) 
  names(Galaxy_MeanStd_2)<-gsub("Gyro", "Gyroscope", names(Galaxy_MeanStd_2)) 
  names(Galaxy_MeanStd_2)<-gsub("Mag", "Magnitude", names(Galaxy_MeanStd_2)) 
  names(Galaxy_MeanStd_2)<-gsub("BodyBody", "Body", names(Galaxy_MeanStd_2)) 
  head(str(Galaxy_MeanStd_2),6) 

#Requirement5. 5.Create independent tidy data set from above with average of each variable for each activity and each subject.
  ## Compute summary of mean and arrange by Subject then Activity
  Galaxy_Mean <- aggregate(. ~ subject - activityName, data = Galaxy_MeanStd_2, mean)  
  Galaxy_MeanStd_3<- tbl_df(arrange(Galaxy_Mean,subject,activityName))
  
# Write last independent tidy data set to a .txt filw
  write.table(Galaxy_MeanStd_3, "Assign4_TidyData.txt", row.name=FALSE) 
