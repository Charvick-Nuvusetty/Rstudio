#variables

#reading the data
if(!file.exists("./data")){dir.create("./data")}
fileURL<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile="./data/restaurants.csv",method="curl")
restData<-read.csv("./data/restaurants.csv")

#creating sequences
s1<-seq(1,10,by=2);s1
s2<-seq(1,10,length=3);s2
x<-c(1,3,8,25,100);seq(along=x)

#subsetting variables
restData$nearMe=restData$neighborhood %in% c("Roland Park","Homeland")
table(restData$nearMe)

#creating Binary Variables
restData$zipWrong = ifelse(restData$zipCode < 0,TRUE,FALSE)
table(restData$zipWrong,restData$zipCode<0)

#create categorical variables
restData$zipGroups = cut(restData$zipCode,breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode)

#Easier Cutting
install.packages("Hmisc")
library(Hmisc)
restData$zipGroups=cut2(restData$zipCode,g=4)
table(restData$zipGroups)

#creating new factor variables
restData$zcf<- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

#levels of factor variables
yesno <- sample(c("Yes","no"),size=10,replace=TRUE)
yesnofac = factor(yesno,levels=c("Yes","no"))
relevel(yesnofac,ref="Yes")
as.numeric((yesnofac))

#cutting produces factor variables
library(Hmisc)
restData$zipGroups=cut2(restData$zipCode,g=4)
table(restData$zipGroups)

#using the mutate function
library(Hmisc);library(plyr)
restData2= mutate(restData,zipGroups=cut2(zipCode,g=4)) #creating a new data frame using mutate function
table(restData2$zipGroups)

