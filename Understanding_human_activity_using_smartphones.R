#Understanding human activity with smartphones

load("data/samsungData.rda")
names(samsungData)[1:12]
table(samsungData$activity)

#Plotting average acceleration for the first subject
par(mfrow=c(1,2),mar=c(5,4,1,1))
samsungData<- transform(samsungData,activity=factor(activity))
sub1 <- subset(samsungData,subject==1)
plot(sub1[ ,1],col=sub1$activity,ylab=names(sub1)[1]) #body acceleration in x direction 
plot(sub1[ ,2],col=sub1$activity,ylab=names(sub1)[2]) #body acceleration in y direction
legend("bottomright",legend = unique(sub1$activity),col=unique(sub1$activity),pch=1)

#Using hierarchial clustering
source("myplclust.R")
distanceMatrix <- dist(sub1[, 1:3])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col=unclass(sub1$activity))

#max acceleration
par(mfrow=c(1,2))
plot(sub1[,10],pch = 19, col = sub1$activity,ylab=names(sub1)[10])
plot(sub1[,11],pch = 19, col = sub1$activity,ylab=names(sub1)[11])

legend("bottomright",legend = unique(sub1$activity),col=unique(sub1$activity),pch=1)

#clustering based on max acceleration
source("myplclust.R")
distanceMatrix<- dist(sub1[,10:12 ])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering,lab.col = unclass(sub1$activity))

#Singular Value Decomposition
svd1 = svd(scale(sub1[, -c(562,563)]))
par(mfrow = c(1,2))
plot(svd1$u[,1],col=sub1$activity,pch=19)
plot(svd1$u[,2],col=sub1$activity,pch=19)

#Find maximum contributor
plot(svd1$v[,2],pch=19)

#New clustering with maximum contributor
maxContrib <- which.max(svd1$v[,2])
distanceMatrix <- dist(sub1[, c(10:12,maxContrib)])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering,lab.col = unclass(sub1$activity))
names(samsungData)[maxContrib]

#K-means Clustering
#first try
kClust <- kmeans(sub1[, -c(562,563)],centers=6)
table(kClust$cluster,sub1$activity)

#second try
kClust <- kmeans(sub1[, -c(562,563)],centers=6,nstart=1)
table(kClust$cluster,sub1$activity)

#100 diferent staring values for the first try
kClust <- kmeans(sub1[, -c(562,563)],centers=6,nstart=100)
table(kClust$cluster,sub1$activity)

#100 different starting values for the second try
kClust <- kmeans(sub1[, -c(562,563)],centers=6,nstart=100)
table(kClust$cluster,sub1$activity)

#cluster 1 Variable Centers (Laying)
plot(kClust$center[1,1:10],pch=19,ylab="Cluster Center",xlab="")

#cluster 2 Variable Centers (Walking)
plot(kClust$center[4,1:10],pch=19,ylab="Cluster Center",xlab="")

