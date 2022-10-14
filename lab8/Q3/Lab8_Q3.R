getwd()
setwd("/Users/liuyue/Desktop/DSB_Lecture/lab8_exs/Q3")
source("getArea.R") # need install a package called "EBImage"
install.packages("EBImage") # need update R version
R.version # check my R version

# try those code to install the package
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("EBImage")
a
library("EBImage")


source("getArea.R") # open "getArea.R" within current shell
getArea("t1_B21m.JPG", file_dir = ".")
list.files(pattern = “.JPG”)
levels()
