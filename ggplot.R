##ggplot2
#An implementation of Grammar of Graphics

#1
library(ggplot2)
qplot(displ,hwy,data=mpg) #displ is x co ordinate and hwy is the y coordinate

qplot(displ,hwy,data=mpg,color=drv) #coloring based on the based on type of vehicle like front wheel drive etc
#adding a geom
qplot(displ,hwy,data=mpg,geom=c("point","smooth"))
#histograms using ggplot2
qplot(hwy,data=mpg,color=drv)
#filling the plots
qplot(hwy,data=mpg,fill=drv)

#Facets
#Facets are used to plot many plots at once indicated by a factor variable(like a subplot)
qplot(displ,hwy,data = mpg,facets = .~drv) #.~drv is used to produce the rows or colums of a plot
qplot(hwy,data=mpg, facets = drv~.,binwidth=2)#histogram 

#example 
qplot(logpm25,NocturnalSypmt,data=maacs,facets=.~bmicat,geom=c("point","smooth"),method="lm")

#Axis limit
testdat<-data.frame(x=1:100,y=rnorm(100))
testdat[50,2]<-100 
plot(testdat$x,testdat$y,type="1",ylim = c(-3,3))
g<-ggplot(testdat,aes(x=x,y=y))
g+geom_line()
#applying axis limits
g+geom_line() +ylim(-3,3)

g+geom_line()+coord_cartesian(ylim=c(-3,3))

