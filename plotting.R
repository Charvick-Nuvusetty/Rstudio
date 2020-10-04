#plotting
#base plot
library(datasets)
data(cars)
with(cars,plot(speed,dist))

#lattice plot
library(lattice)
state<-data.frame(state.x77,region=state.region)
xyplot(Life.Exp ~ Income | region,data=state,layout=c(4,1))

#ggplot2
#it has a loot of default values
#mixes elements of base and lattice
library(ggplot2)
data(mpg)
qplot(displ,hwy,data=mpg)