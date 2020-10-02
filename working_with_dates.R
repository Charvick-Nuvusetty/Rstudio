#working with dates

d1=date()
d1

d2=Sys.Date()
d2
class(d2)

#formatting data
format(d2,"%a %b %d")

#creating dates
x=c("1jan1960","2Jan1960","30Mar1985");z=as.Date(x,"%d%b%Y")  #%d represents the numeric date,%b represents the month and %Y represents the year
x
z
z[1]-z[2]
as.numeric(z[1]-z[2])
weekdays(d2)
months(d2)
julian(d2)

#using lubridate library
library(lubridate);ymd("20140108")
mdy("12022000")
ymd_hms("20110803 10:15:03")
ymd_hms("20110803 10:15:03",tz="Asia/Calcutta")

x=dmy(c("1jan1960","2Jan1960","30Mar1985"))
wday(x[1],label=TRUE)