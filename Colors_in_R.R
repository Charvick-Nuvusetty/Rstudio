## Work with Color in R plots
# 
heat.colors()
topo.colors()

# grDevices
# colorRamp(takes 0-1), colorRampPalette
pal <- colorRamp(c("red", "blue"))

pal(0) #it gives a matrix for RGB since we chose red and blue we will get max for red

pal(1) # max for blue

pal(0.5) #gives a color between red and blue

pal(seq(0, 1, len = 10)) #generates a sequence in red and blue wita length of 10

pal <- colorRampPalette(c("red", "yellow"))

pal(2)#it gives a character vector represnted in hexa decimal, pal(2) gives the colors we chose which are red and yellow

pal(10)# the first elemt is going to be red and the last element will be yellow and in the middle the colors are interpolation of red and yellow

# 3 types of palettes: sequential(low to high), diverging, qualitative

library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20)) # 20 colors are going to be interpolated with the blue green package

# The smoothScatter
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)

## rgb function, transparency - alpha parameter
library(colorspace)
x <- rnorm(1000)
y <- rnorm(1000)
plot(x, y, col = rgb(0, 0, 0, 0.2), pch = 19)#here 0.2 is used for transparency
plot(x, y, col = rgb(0, 0, 0, 0.5), pch = 19)#here 0.5 is less transparent compared to 0.2
