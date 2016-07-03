setwd("C:/Users/rndyc/Desktop/Coursera")
system.time(power<-read.table("household_power_consumption.txt", header=TRUE, sep=";"))

power$global_active_power<-as.numeric(power$Global_active_power)
power1<-power[which(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]
power1[power1$Date=="?"]<-NA
power1[power1$global_active_power=="?"]<-NA
power1$global_active_power<-as.numeric(paste(power1$Global_active_power))

x<-paste(power1$Date, power1$Time)
datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")

png(file="plot2.png")
plot(datetime, power1$global_active_power, type="l",xlab='', ylab="Global Active Power (kilowatts)")
dev.off()