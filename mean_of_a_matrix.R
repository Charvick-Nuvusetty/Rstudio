
columnmean<- function(y,remoneNA=TRUE){
  nc<-ncol(y)
  means<-numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(y[,i])
  }
  means
}