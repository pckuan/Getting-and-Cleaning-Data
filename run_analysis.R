## For the program to run successfully, please place related files into the same directory as the program itself
## e.g.: X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt,
## (continued) features.txt and activity_labels.txt.
XTrain<-read.table("X_train.txt")
XTest<-read.table("X_test.txt")
YTrain<-read.table("y_train.txt")
YTest<-read.table("y_test.txt")
SubTrain<-read.table("subject_train.txt")
SubTest<-read.table("subject_test.txt")
feature<-read.table("features.txt")
ActivityLabel<-read.table("activity_labels.txt")
YData<-rbind(YTrain,YTest)
colnames(YData)<-"Activity"
for (i in 1:6){
  YData$Activity[YData$Activity == i] <- toString(ActivityLabel[i,2])
}
SubData<-rbind(SubTrain,SubTest)
colnames(SubData)<-"Subject"
XData<-rbind(XTrain,XTest)
featureIndex<-grep("mean[^Freq]|std",feature$V2) ## I don't think meanFreq should be included
XFeature<-XData[,featureIndex]
featureName<-feature[featureIndex,2]
colnames(XFeature)<-featureName
XTable<-cbind(SubData,YData,XFeature)
SortedTable<-XTable[order(XTable$Subject,XTable$Activity),]
Act<-c(rep("Laying",30),rep("Sitting",30),rep("Standing",30),rep("Walking",30),rep("Walking UpStairs",30),rep("Walking Downstairs",30))
Sub<-c(rep(seq(1:30),6))
AverageTable<-NULL
for (j in 1:length(featureIndex)){
  Temp1<-data.frame(tapply(SortedTable[,j+2],list(SortedTable$Subject,SortedTable$Activity),mean))
  Temp2<-unlist(Temp1)
  AverageTable<-cbind(AverageTable,Temp2)
}
FinalTable<-data.frame(cbind(Sub,Act,AverageTable))
colnames(FinalTable)<-colnames(XTable)
write.table(FinalTable, "FinalTable.txt", sep="\t",row.name=FALSE)