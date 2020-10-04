#simple Histogram 
library(datasets)
hist(airquality$Ozone)

#scatter plot
library(datasets)
with(airquality,plot(Wind,Ozone))

#boxplot
library(datasets)
aq<- transform(airquality,Month=factor(Month))
boxplot(Ozone ~Month, airquality,xlab = "Month",ylab = "Ozone(ppb")

#base plot with annotations
library(datasets)
with(airquality,plot(Wind,Ozone))
title(main = "Ozone and Wind in NEw York City") 
with(airquality,plot(Wind,Ozone,main="Ozone and Wind in NEw York City"))
with(subset(airquality,Month == 5),points(Wind,Ozone,col=blue))

with(airquality,plot(Wind,Ozone,main = "Ozone and Wind in New York City",type="n" ))
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
with(subset(airquality,Month!=5),points(Wind,Ozone,col="red"))
legend("topright",pch=1,col = c("blue","red"),legend = c("May","Other Months"))

#adding a regression line
with(airquality,plot(Wind,Ozone, main="Ozone and Wind in New York city",pch=20))
model<-lm(Ozone~Wind,airquality)
abline(model,lwd=2)

#plotting multiple base plots
#2 graphs
par(mfrow=c(1,2))
with(airquality,{
  plot(Wind,Ozone,main="Ozone and Wind")
  plot(Solar.R,Ozone,main="Ozone and Solar Radiation")
})

#3 Graphs
par(mfrow=c(1,3),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(airquality,{
  plot(Wind,Ozone,main="Ozone and Wind")
  plot(Solar.R,Ozone,main="Ozone and Solar Radiation")
  plot(Temp,Ozone,main="Ozone and Solar Radiation")
  mtext("Ozone and Weather in New Your city",outer=TRUE)
})



