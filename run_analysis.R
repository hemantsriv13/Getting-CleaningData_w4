library(plyr)
library(dplyr)
library(Hmisc)
library(data.table)

#training Data
x_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", header=FALSE)
sub_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
feat<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", header=FALSE)
colnames(x_train)<-feat[,2]
colnames(y_train)<-"activityLabel"
colnames(sub_train)<-"subjectID"
train<-cbind(sub_train,y_train,x_train)
ind_mean<-grep("mean", colnames(train))
ind_sd<-grep("std", colnames(train))
sub1<-select(train,1,2, ind_mean)
sub2<-select(train, ind_sd)
merged_train<-cbind(sub1,sub2)

#test Data 
x_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", header=FALSE)
sub_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
colnames(x_test)<-feat[,2]
colnames(y_test)<-"activityLabel"
colnames(sub_test)<-"subjectID"
test<-cbind(sub_test,y_test,x_test)
ind_mean<-grep("mean", colnames(test))
ind_sd<-grep("std", colnames(test))
sub1<-select(test,1,2, ind_mean)
sub2<-select(test, ind_sd)
merged_test<-cbind(sub1,sub2)

#merging both sets of data
merged_set<-rbind(merged_test,merged_train)
merged_set<-arrange(merged_set, subjectID, activityLabel)

#editong column names for merged dataset
cnames<-colnames(merged_set)
cnames<-gsub("Body","",cnames)
colnames(merged_set)<-cnames

#assigning activity names to variable activityLabel
merged_set$activityLabel<-gsub("1", "WALKING",merged_set$activityLabel) 
merged_set$activityLabel<-gsub("2", "WALKING_UPSTAIRS",merged_set$activityLabel) 
merged_set$activityLabel<-gsub("3", "WALKING_DOWNSTAIRS",merged_set$activityLabel) 
merged_set$activityLabel<-gsub("4", "SITTING",merged_set$activityLabel) 
merged_set$activityLabel<-gsub("5", "STANDING",merged_set$activityLabel) 
merged_set$activityLabel<-gsub("6", "LAYING",merged_set$activityLabel)

#another Tidy data set with average of each value for each subject and each activity
tidy_dataset<-aggregate(.~subjectID+activityLabel, merged_set, mean, na.rm=TRUE)
write.table(tidy_dataset,"tidy_dataset.txt", row.names = FALSE)
