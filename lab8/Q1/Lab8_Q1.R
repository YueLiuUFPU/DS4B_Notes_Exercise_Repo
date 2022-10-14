# lab 8 for DSB Fall 2022
# Date: 09-30-2022
# Author: Yue Liu

# Question 1: Self-Incompatibility in Plants
# 1-1
getwd()
setwd("/Users/liuyue/Desktop/DSB_Lecture/lab8_exs/Q1")
plant<-read.csv("Goldberg2010_data.csv")
table(plant$Status)# count variable "Status"
incompat_stats<-data.frame(table(plant$Status))# transfer the count table to data frame
incompat_stats
incompat_stats$Status<-incompat_stats$Var1 # create Status column
incompat_stats$Counts<-incompat_stats$Freq # create counts column
incompat_stats<-subset(incompat_stats, select = -c(Var1,Freq)) # keep the columns i want to include
incompat_stats


# 1-2
install.packages("stringr")
library("stringr")
plant
str(plant)
plant[c("Genus","newSpecies")] <- str_split_fixed(plant$Species,"_", n = 2)
View(plant)

# Or use the following code to split the column
sp<-str_split_fixed(plant$Species, '_', n = 2) 
colnames(sp)<-c("Genus","newSpecies")
is.list(sp)
sp_data<-as.data.frame(sp)
is.list(sp_data)
sp_data
plant$Genus<-sp_data$Genus # add Genus column to "plant"
plant$NewSpecies<-sp_data$newSpecies # add species column to "plant"
plant # get the updated "plant"
str(plant) # check data structure of "plant"
as.factor(plant$Status)

Genus_list<-data.frame(table(plant$Genus))
Genus_list # use data.frame(table()) to create a data set lists all genus
Genus_list$code<-c(1:length(Genus_list$GenusName))
colnames(Genus_list)<-c("GenusName","Frequency","GenusCode")
View(Genus_list)


results=data.frame()
  for (i in Genus_list$GenusName){
  a<-subset(plant,plant$Genus==j)
  status_0<-nrow(a[a$Status==0, ])
  status_1<-nrow(a[a$Status==1, ])
  status_2<-nrow(a[a$Status==2, ])
  status_3<-nrow(a[a$Status==3, ])
  status_4<-nrow(a[a$Status==4, ])
  status_5<-nrow(a[a$Status==5, ])
  new<-c(i,status_0,status_1,status_2,status_3,status_4,status_5)
  results=rbind(results,new)
  }
results
colnames(results)<-c("GenusName","Num_Status_0","Num_Status_1","Num_Status_2","Num_Status_3","Num_Status_4","Num_Status_5")
View(results)
