# Assignment: DSB Lab13
# Author: Yue Liu (graduate)
# Date: 2022-10-12

# set work path and import data sets.
getwd()
setwd("/Users/liuyue/Desktop/DSB_Lecture/lab13")
library(ggplot2) # load packages
library(tidyverse)

# 8.8 Exercise I----------------------------------------

# Question 1: Explore the data set snow and plot the Perc_snowcover versus Week_snowmelt. Choose an appropriate geom.
snow<-read_tsv("snow.csv") # import dataset
head(snow) # check data structure, Perc_snowcover and Week_snowmelt are number variable, chose scatter plot
pl <- ggplot(data = snow)+
      aes(x = Week_snowmelt, y = Perc_snowcover, colour = Herd) +
      geom_point()# make a scatter plot 
pl 


# Question 2: For each year, compute the average Perc_snowcover and average Week_snowmelt and create a scatter plot.
Percsnow_year <- snow %>% group_by(Year) %>% summarise(aver_perc_snowcover = mean(Perc_snowcover))
head(Percsnow_year)
dim(Percsnow_year)
View(Percsnow_year)
Weeksnowmelt_year <- snow %>% group_by(Year) %>% summarise(aver_Week_snowmelt = mean(Week_snowmelt))
head(Weeksnowmelt_year)
dim(Weeksnowmelt_year)
PerSnow_Weekmelt_year <- inner_join(Percsnow_year, Weeksnowmelt_year)
head(PerSnow_Weekmelt_year)
pl_2 <- ggplot(data = PerSnow_Weekmelt_year) +
  aes(x = aver_perc_snowcover, y = aver_Week_snowmelt) +
  geom_point()
pl_2


# Question 3: Produce a box plot of the Pop_Size for each Herd from popsize dataset.
popsize <- read_tsv("pop_size.csv")
head(popsize)
pl_3 <- ggplot(data = popsize) + aes(x = Herd, y = Pop_Size, fill = Herd)+ 
  geom_boxplot()

pl_3


# Question 4: Create a scatter plot showing the average population size (taken across all herds) including standard deviation, for the years 2008 through 2014.
head(popsize)
avePopsize_08_14 <- popsize %>% filter(Year > 2007 & Year < 2015) %>% group_by(Year) %>% summarise(aver_popsize = mean(Pop_Size), SD = sd(Pop_Size))
head(avePopsize_08_14)
dim(avePopsize_08_14)

pl_4 <- ggplot(data = avePopsize_08_14) + 
    aes(x = Year, y = aver_popsize, colour = Year)+ 
    geom_point()+
    geom_errorbar(aes(ymax = aver_popsize + SD, ymin = aver_popsize - SD), width = 0.3)

pl_4
