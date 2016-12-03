#Explorative data analysis
rm(list=ls())
library(dplyr)
library(lubridate)
library(reshape2)
library(data.table)
list.files()
d<-data.table(read.csv2("household_power_consumption.txt", header=TRUE, stringsAsFactors = FALSE,  dec=".", sep=";"))
str(d1)
head(d)
tail(d)
class(d$Global_active_power)

d1<-filter(d, Date %in% c("1/2/2007","2/2/2007"))
d1$Global_active_power<-as.numeric(d1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(d1$Global_active_power, col="red", xlab="Global Active Power (kilowatts", main = "Global Active Power")
dev.off()


#d1<- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
#d3<-filter(d, Date=="1/2/2007"| Date=="2/2/2007")