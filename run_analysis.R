library(plyr)
library(dplyr)
#getwd()
#setwd("./UCI HAR Dataset/")

# read data description
feat<-read.table("features.txt",as.is=TRUE)
posMeanStd<-grep("mean[^F]|std",feat$V2)
colNames<-feat$V2[posMeanStd]
colNames<-gsub("[[:punct:]]mean[[:punct:]]{3}",".Mean.",colNames)
colNames<-gsub("[[:punct:]]std[[:punct:]]{3}",".Std.",colNames)
colNames<-gsub("[[:punct:]]mean[[:punct:]]{2}",".Mean",colNames)
colNames<-gsub("[[:punct:]]std[[:punct:]]{2}",".Std",colNames)
colNames<-gsub("tBody","timeBody",colNames)
colNames<-gsub("fBody","freqBody",colNames)
colNames<-gsub("tGrav","timeGrav",colNames)
colNames<-gsub("fGrav","freqGrav",colNames)
colNames<-gsub("BodyBody","Body",colNames)

# read test data and select rows giving mean and std values
dat<-read.table("test/X_test.txt") %>% select(posMeanStd)
colnames(dat)<-colNames

# add person and activity data
subject_test<-scan("test/subject_test.txt")
activity_test<-scan("test/y_test.txt")
dat<-mutate(dat,subject=subject_test,activity=activity_test)
datTest<-dat[,c(ncol(dat)-1,ncol(dat),1:(ncol(dat)-2))]

# read training data
dat<-read.table("train/X_train.txt") %>% select(posMeanStd)
colnames(dat)<-colNames

# add person and activity data
subject_train<-scan("train/subject_train.txt")
activity_train<-scan("train/y_train.txt")
dat<-mutate(dat,subject=subject_train,activity=activity_train)
datTrain<-dat[,c(ncol(dat)-1,ncol(dat),1:(ncol(dat)-2))]

# combine test and training data, sort by person and activity
dat<-rbind(datTest,datTrain)
dat<-arrange(dat,subject,activity)

# give reasonable names for activities
actiLabels<-read.table("activity_labels.txt",as.is=TRUE)
datAll<-mutate(dat,activity=actiLabels$V2[dat$activity])

# create tidy data set with no repeated subject/activity pairs
dat<-group_by(datAll,subject,activity)
tidyData<-summarize_all(dat,mean)

# write data file
write.table(tidyData,"tidyData.txt",row.name=FALSE)
