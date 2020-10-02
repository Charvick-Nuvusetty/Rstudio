#reading the data from web and performing various operations
#dowloading the file
if(!file.exists("./data")){dir.create("./data")}
fileURL<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile="./data/restaurants.csv",method="curl")
restData<-read.csv2("./data/restaurants.csv")
#look at the data set
head(restData,n=3)
tail(restData,n=3)
summary(restData)
str(restData)
quantile(restData$councilDistrict,na.rm = True)
quantile(restData$councilDistrict,probs = c(0.5,0.75,0.9))
table(restData$zipCode,useNA = "ifany")
table(restData$councilDistrict,restData$zipCode) #creates a 2d table
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0) #checks if all the zip codes are >0
colSums(is.na(restData))
all(colSums(is.na(restData))==0)
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]
data("UCBAdmissions")
df=as.data.frame(UCBAdmissions)
summary(df)
xt<-xtabs(Freq~Gender + Admit,data=df)
xt
#flat Tables
warpbreaks$replicate <- rep(1:9,len=54)
xt= xtabs(breaks ~.,data=warpbreaks)
xt
ftable(xt) #generates a compact table
#size of data
fakeData=rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")