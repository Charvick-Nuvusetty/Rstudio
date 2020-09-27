add2<-function(x,y){
  x+y
}
above10<-function(x){
  use<-x>10
  x[use]
}
above <- function(x,n){
  use <- x>n #n is the cut off value
  x[use]
}