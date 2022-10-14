# DSB Lab8 Q4

## Question 4
# Q4-1
getwd()
setwd("/Users/liuyue/Desktop/DSB_Lecture/lab8_exs/Q4")
Cita<-read.csv("Letchford2015_data.csv") 
Cita_2010<-subset(Cita,Cita$year==2010) # E extract 2010 data
View(Cita_2010) # view the subset
Cita_2010$rank_title<-rank(Cita_2010$title_length)
Cita_2010$rank_cit<-rank(Cita_2010$cites)
View(Cita_2010)
as.numeric(Cita_2010$rank_title)
as.numeric(Cita_2010$rank_cit)
res<-cor.test(Cita_2010$rank_title,Cita_2010$rank_cit, method="kendall")
res

# Q4-2
table(Cita$journal) 
jour_list<-data.frame(table(Cita$journal))
View(jour_list)
jour_list$journal_code<-c(1:length(jour_list$Var1)) # add a column with code for each journal
colnames(jour_list)<-c("JournalName","NumberofPaper","JournalCode")
View(jour_list)# create a journal list data set with the code of each different journal

table(Cita$year)
year_list<-data.frame(table(Cita$year))
colnames(year_list)<-c("Year","PaperNumber")
View(year_list) # create a list publish years

Journ_year<- function (i,j) {
  for (i in jour_list$JournalCode) {
    for (j in year_list$PaperNumber) {
      res_jour_year<-cor.test(Cita$title_length[Cita$journal==i & year_list$Var1==j],
                              Cita$cites[Cita$journal==i & year_list$Var1==j],
                              method="kendall")
      print(res)
    }
  }
}# create a function which can be used to calculate kendall's correlation for a specific year and a specific journal
Cita$year<-as.factor(Cita$year)
levels(Cita$year)
# or
Journ_year<- function (i,j) {
  a=subset(Cita,(Cita$journal==i & Cita$year==j))
  res_jour_year<-cor.test(a$title_length,a$cites,method="kendall")
  print(res_jour_year)
}

class(Cita$year)
levels()
# find the code for the journals: "Nature", "Science", "The Lancet", and "New Eng J Med"
jour_list$JournalCode[jour_list$JournalName=="Nature"] # get code 4005
jour_list$JournalCode[jour_list$JournalName=="Science"] # get code 4772
jour_list$JournalCode[jour_list$JournalName=="The Lancet"] # get code 5043
jour_list$JournalCode[jour_list$JournalName=="New Eng J Med"] # get code 4115
# run the function for each journal-year combination
Journ_year("Nature","2007")
Journ_year("Nature","2008")
Journ_year("Nature","2009")
Journ_year("Nature","2010")
Journ_year("Nature","2011")
Journ_year("Nature","2012")
Journ_year("Nature","2013")

Journ_year("Science","2007")
Journ_year("Science","2008")
Journ_year("Science","2009")
Journ_year("Science","2010")
Journ_year("Science","2011")
Journ_year("Science","2012")
Journ_year("Science","2013")

Journ_year("The Lancet","2007")
Journ_year("The Lancet","2008")
Journ_year("The Lancet","2009")
Journ_year("The Lancet","2010")
Journ_year("The Lancet","2011")
Journ_year("The Lancet","2012")
Journ_year("The Lancet","2013")

Journ_year("New Eng J Med","2007")
Journ_year("New Eng J Med","2008")
Journ_year("New Eng J Med","2009")
Journ_year("New Eng J Med","2010")
Journ_year("New Eng J Med","2011")
Journ_year("New Eng J Med","2012")
Journ_year("New Eng J Med","2013")



a=subset(Cita,(Cita$journal=="Nature" & Cita$year==2009))
res_jour_year<-cor.test(a$title_length,a$cites,
                        method="kendall")




