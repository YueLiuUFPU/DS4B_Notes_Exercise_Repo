# 2-2
# Code version 1
rm(list = ls())
getwd()
setwd("/Users/liuyue/Desktop/DSB_Lecture/lab8_exs/Q2")
source("read_mass.R") # call "read_mass.R"
Family_list<-data.frame(table(Smith$Family)) # use data.frame(table()) to create a data set include all Families
colnames(Family_list)<-c("Family","Frequency") # change columns name
Family_list

mean_mass_family<-data.frame() # create an empty data frame for saving loop output
for (i in Family_list$Family) { # set a for loop, i represents each family in the Family_list
  a<-subset(Smith,Smith$Family==i) # get a subset for the family "i" records
  aver_mass<-mean(a$log_mass_grams, na.rm=TRUE) # get the average body mass for the family "i", use na.rm=TRUE to let r ignore the NAs
  newrow<-c(i,aver_mass) # reserve the average body mass in newrow
  mean_mass_family<-rbind(mean_mass_family,newrow)# append the newrow to the mean_mass_family data frame
} 

colnames(mean_mass_family)<-c("Family","Mass_Mean") # change columns name
View(mean_mass_family) # check the results


# # Code version 2
getwd()
setwd("/Users/liuyue/Desktop/DSB_Lecture/lab8_exs/Q2")
source("read_mass.R") # call "read_mass.R"
Family_list<-data.frame(table(Smith$Family)) # use data.frame(table()) to create a data set include all Families
colnames(Family_list)<-c("Family","Frequency") # change columns name
Family_list

mean_mass<- function(i){ # create a function for calculate average body mass for a family "i"
  a<-subset(Smith,Smith$Family==i)
  aver_mass<-mean(a$log_mass_grams, na.rm=TRUE) # use na.rm=TRUE to let r ignore the NAs
  return(aver_mass)
}
mean_mass("Vespertilionidae") # try to run the function

mean_mass_family_1<-data.frame() # create an empty data frame for saving loop output
for (i in Family_list$Family) { # set a for loop, i represents each family in the Family_list
  aver<-function(i)
  newrow<-c(i,aver)
  # reserve the average body mass in newrow
  mean_mass_family_1<-rbind(mean_mass_family_1,newrow) # append the newrow to the mean_mass_family data frame
}
colnames(mean_mass_family_1)<-c("Family","Mass_Mean") # change columns name
View(mean_mass_family_1) # check the results


