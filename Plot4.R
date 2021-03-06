#Explorative data analysis
rm(list=ls())
getwd()
setwd("C:/Users/Fredrik.Augustsson/Documents/1.Analys/4.Coursera/1. Data Science/4. Exploratory Data Analysis")
getwd()
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
d1$t<- strptime(paste(d1$Date, d1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#d1<- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
#d3<-filter(d, Date=="1/2/2007"| Date=="2/2/2007")
d1$Sub_metering_1<-as.numeric(d1$Sub_metering_1)
d1$Sub_metering_2<-as.numeric(d1$Sub_metering_2)
d1$Sub_metering_3<-as.numeric(d1$Sub_metering_3)
class(d1$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(d1, plot(t, Global_active_power, type="l", ylab = "Global Active Powe"))
with(d1, plot(t, Voltage, type="l", xlab="datetime", ylab= "Volyage"))
with(d1, plot(t, Sub_metering_1, type="n",  ylab = "Energy Sub Metering"))  
with(d1, points(t, Sub_metering_1, type="l"))
with(d1, points(t, Sub_metering_2, type="l", col="red"))
with(d1, points(t, Sub_metering_3, type="l", col="blue"))
with(d1, plot(t, Global_active_power, type="l", ylab="Global Active Powe", xlab="datetime"))
dev.off()
