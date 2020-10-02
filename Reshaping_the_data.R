#Reshaping the data

install.packages("reshape2")
library(reshape2)
head(mtcars)

#Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt<- melt(mtcars,id=c("carname","gear","cyl"),measure.vars = c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

#Casting Data frames
cylData <- dcast(carMelt,cyl~variable)#dcast will de cast a particular data set into a dataframe
cylData
cylData <- dcast(carMelt,cyl~variable,mean)
cylData

#Averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

#Split-Apply combine
spIns=split(InsectSprays$count,InsectSprays$spray)
spIns

#Apply
sprCount=lapply(spIns, sum)
sprCount

#combine
unlist(sprCount)
sapply(spIns,sum)

#plyr Package
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

#Creating a new variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN = sum))
dim(spraySums)
head(spraySums)

