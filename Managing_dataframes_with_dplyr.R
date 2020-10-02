#Managing Data Frames with dplyr

library(dplyr)

if(!file.exists("./data")){
  dir.create("./data")
}

# 3. make handle
fileURL <- "https://github.com/DataScienceSpecialization/courses/blob/master/03_GettingData/dplyr/chicago.rds?raw=true"

# 4. download data
download.file(fileURL, destfile = "./data/chicago.rds", method = "curl", extra='-L')

#read the data
chicago <- readRDS("./data/chicago.rds")

#read the dimensions of the data frame
dim(chicago)

str(chicago)

names(chicago)

#Looking for cities with end dptp
head(select(chicago,city:dptp))

head(select(chicago,-(city:dptp)))#look for the objects other than cit and dptp

chic.f<-filter(chicago,pm25tmean2>30)
head(chic.f,10)

chic.f<-filter(chicago,pm25tmean2>30 & tmp>80)
head(chic.f)

#Arrange Function

chicago<-arrange(chicago,date)
head(chicago)


chicago<-arrange(chicago,desc(date))
head(chicago)

#Rename Function
chicago<-rename(chicago,pm25=pm25tmean2,dewpoint=dptp)
head(chicago)

#mutate Function
chicago<-mutate(chicago,pm25detrend=pm25-mean(pm25,na.rm = TRUE))
head(select(chicago,pm25,pm25detrend))

#GroupBy Function
chicago<-mutate(chicago,tempcat=factor(1*(tmpd>80),labels=c("cold","hot")))
hotcold<-group_by(chicago,tempcat)
hotcold

summarize(hotcold,pm25=mean(pm25),o3=max(o3tmean2),no2=median(no2tmean2))


summarize(hotcold,pm25=mean(pm25,na.rm=TRUE),o3=max(o3tmean2),no2=median(no2tmean2))

chicago<-mutate(chicago,year=as.POSIXlt(date)$year+1900)
years<-group_by(chicago,year)
summarize(years,pm25=mean(pm25,na.rm = TRUE),o3=max(o3tmean2),no2=median(no2tmean2))

#chaining operations together using dplyr package
#pipeline operator
chicago %% mutate(month = as.POSIXlt(date)$mon+1)%%group_by(month)%%summarize(pm25=mean(pm25,na.rm=TRUE), o3=max(o3tmean2),no2=median(no2tmean2))
