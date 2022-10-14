# DSB lab8 Question 2-1
# Author: Yue Liu
# Date: 09-30-2022
getwd()
setwd("/Users/liuyue/Desktop/DSB_Lecture/lab8_exs/Q2")
Smith<-read.table(file="Smith2003_data.txt",header = FALSE,sep = "", fill=TRUE) # use read.table() function to input data from file.txt
Smith<-data.frame(Smith) # makes it data. frame
View(Smith)
Smith<-replace(Smith,Smith==-999,NA) # replace all -999 with NA 
colnames(Smith)<-c("Continent", "Status", "Order", "Family","Genus","Species", "log_mass_grams","Combined_mass_grams","Reference") # change column names based on the cues from the about.txt
View(Smith)

nrow(Smith) # check the number or records, the output is 5736. However, according to the "Smith2003_about.txt", the number of records should be 5731, thus i need to find 5736-5731=5 records with errors.

str(Smith) # check data structure

Smith$Continent<-as.factor(Smith$Continent) # change continent column data type to factors
levels(Smith$Continent) # get 11 levels for the "continent" variable
# according to the "Smith2003_about.txt" Continent levels includes SA, NA, EA, insular, oceanic, AUS, AF. 
# Thus i need to delete the rows with wrong Continent levels:" "154"     "16"      "31"      "4, 59" , 5 row in total, this is why we have 5 more records than the discreption in the about.txt
# also need to correct the spelling error: "Af" to "AF"
Smith<-replace(Smith,Smith=="Af","AF") # correct the spelling error in the "Continent" column
Smith<-Smith[-c(1270,1363,3252,3958,4817), ]
# i found the 5 rows with errors by sort the continent column in spreadsheet "Smith"
Smith # get the cleaned dataset
nrow(Smith)# check if the number of records match the description

# according to the about.txt" the columns "log_mass_grams", "Combined_mass_grams", and "Reference" should be numeric, thus run the following code
Smith$log_mass_grams<-suppressWarnings(as.numeric(Smith$log_mass_grams))
Smith$Combined_mass_grams<-as.numeric(Smith$Combined_mass_grams)
Smith$Reference<-as.factor(Smith$Reference)
# I saved those code as read_mass.R in my folder, but paste the code here in this combined script for your to check

