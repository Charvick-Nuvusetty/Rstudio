#Structure of Data Analysis
#Subsampling our data set

#Predicting the spam emails
#Anything with more than 6.6% dollar signs are classified as spam

library(kernlab)
data(spam)
#perform subsampling
set.seed(3435)
trainIndicator=rbinom(4601,size=1,prob = 0.5)
table(trainIndicator)

trainSpam <- spam[trainIndicator==1,]
testSpam <- spam[trainIndicator==0,]

names(trainSpam)
head(trainSpam)

#Getting the total number of spam mails
table(trainSpam$type)

#Plotting
plot(trainSpam$capitalAve~trainSpam$type)
#log transformation
plot(log10(trainSpam$capitalAve+1)~trainSpam$type)
#Here the spam emails have more amount of capital letters compared to non spam emails

#Relationship between predictors
plot(log10(trainSpam[, 1:4]+1))

#Clustering
hcluster=hclust(dist(t(trainSpam[,1:57])))
plot(hcluster)

#New Clustering
hclusterupdated = hclust(dist(t(log10(trainSpam[,1:55]+1))))
plot(hclusterupdated)

#Statistic prediction/modeling
trainSpam$numType=as.numeric(trainSpam$type)-1
costFunction = function(x,y) sum(x !=(y>0.5))
cvError =rep(NA,55)
library(boot)
for(i in 1:55){
  lmFormula=reformulate(names(trainSpam)[i],response = "numType")
  glmfit=glm(lmFormula,family="binomial",data=trainSpam)
  cvError[i]=cv.glm(trainSpam,glmfit, costFunction,2)$delta[2]
}

#WHich predictor has the minimum cross validated error
names(trainSpam)[which.min(cvError)]
#charDollar has the min error, it indicates how many times $ is present in the mail

##Get a measure of uncertainity

#We are using logistic regression
#use the best model from the group
predictionModel=glm(numType ~ charDollar,family="binomial",data=trainSpam)

#GEt predictions on the test set
predictionTest = predict(predictionModel,testSpam)
predictedSpam= rep("nonspam",dim(testSpam)[1])

#Classify as "Spam" for those with prob > 0.5
predictedSpam[predictionModel$fitted >0.5]="spam"

#Classification Table
table(predictedSpam,testSpam$type)

#Calculating the error rate
(61+458)/(1346+458+61+449) #Error rate is about 22 percent
