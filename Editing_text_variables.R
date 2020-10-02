#Editing Text Variables 

if(!file.exists("./data")){dir.create("./data")}
fileURL<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile="./data/cameras.csv",method="curl")
camData<-read.csv("./data/cameras.csv")
names(camData)
tolower(names(camData))

#Fixing characters using
#1)splitting the strings
splitNames=strsplit(names(camData),"\\.") #\\. we are removing the . from the data elements
splitNames[[5]]
splitNames[[6]]

#lists
mylist<-list(letters=c("A","B","C"),numbers=1:3,matrix(1:25,ncol=5))
head(mylist)

#2) Using sapply()
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)

#3) using gsub()
test<-"This_is_a_test"
sub("_","",test)
gsub("_","",test)

#Finding Values 
#grep()
grep("Alameda",camData$intersection)
table(grepl("Alameda",camData$intersection))
camData2<-camData[!grepl("Alameda",camData$intersection),]#can be used to create a subset
camData2

#String Functions
install.packages("stringr")
nchar("Keanu Reeves")
substr("Keanu Reeves",1,7)
paste("Keanu","Reeves")
paste0("Keanu","Reeves")#pastes strings without any space in between
str_trim("Jeff ")
