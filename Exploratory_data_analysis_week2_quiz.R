#1
library(nlme)
library(lattice)

plot <- xyplot(weight ~ Time | Diet,BodyWeight)
class(plot)

#2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)
 
#Answer: A set of 3 panels showing the relationship between weight and time for each diet.

#4
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

#Answer: The object 'p' has not yet been printed with the appropriate print method.

