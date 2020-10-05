#Lattice Plotting
library(lattice)
library(datasets)
xyplot(Ozone ~ Wind,data = airquality)

#2
library(datasets)
library(lattice)
#convert Month in to a factor variable
airquality<-transform(airquality,Month=factor(Month))
xyplot(Ozone ~Wind | Month, data=airquality,layout=c(5,3))

#3
x<- xyplot(Ozone ~ Wind,data=airquality)
x

##Lattice Panel Function
#4
set.seed(10)
x<-rnorm(100)
f<-rep(0:1,each=50)
y<-x+f-f*x+rnorm(100,sd=0.5)
f<- factor(f,labels = c("Group 1","Group 2"))
xyplot(y~x|f,layout=c(2,1)) #plot with 2 panels

#Custom panel function
#1
xyplot(y ~ x|f,panel = function(x,y, ...){
  panel.xyplot(x,y, ...) #first call the default panel for xyplot
  panel.abline(h=median(y),lty=2) #Add a horizontal like at the media
})

#2
xyplot(y ~ x|f,panel = function(x,y, ...){
  panel.xyplot(x,y, ...) #first call the default panel for xyplot
  panel.lmline(x,y,col=2) #Overlay a simple linear regression line
})


