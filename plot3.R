setwd("C:/Users/rndyc/Desktop/Coursera")
system.time(power<-read.table("household_power_consumption.txt", header=TRUE, sep=";"))

power$global_active_power<-as.numeric(power$Global_active_power)
power[power$Date=="?"]<-NA


power$global_reactive_power<-as.numeric(power$Global_reactive_power)
power1<-power[which(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]
power1[power1$global_active_power=="?"]<-NA
power1$Sub_metering_1<-as.numeric(paste(power1$Sub_metering_1))
power1$Sub_metering_2<-as.numeric(paste(power1$Sub_metering_2))
power1$Sub_metering_3<-as.numeric(paste(power1$Sub_metering_3))

x<-paste(power1$Date, power1$Time)
datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")

png(file="plot3.png")
plot(datetime,power1$Sub_metering_1, type="n",xlab='', ylab="Sub Metering")
points(datetime, power1$Sub_metering_1, type="l")
points(datetime, power1$Sub_metering_2, type="l", col="red")
points(datetime, power1$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()