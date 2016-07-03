setwd("C:/Users/rndyc/Desktop/Coursera")
system.time(power<-read.table("household_power_consumption.txt", header=TRUE, sep=";"))
power1<-power[which(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]
power1[power1$Date=="?"]<-NA
power1[power1$global_active_power=="?"]<-NA
power1$Sub_metering_1<-as.numeric(paste(power1$Sub_metering_1))
power1$Sub_metering_2<-as.numeric(paste(power1$Sub_metering_2))
power1$Sub_metering_3<-as.numeric(paste(power1$Sub_metering_3))
power1[power1$Voltage=="?"]<-NA
power1$Voltage<-as.numeric(paste(power1$Voltage))
power1$global_reactive_power<-as.numeric(paste(power1$Global_reactive_power))
power1$global_active_power<-as.numeric(paste(power1$Global_active_power))

x<-paste(power1$Date, power1$Time)
datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfcol=c(2,2))
plot(datetime, power1$global_active_power, type="l",xlab='', ylab="Global Active Power (kilowatts)")

plot(datetime,power1$Sub_metering_1, type="n",xlab='', ylab="Sub Metering")
points(datetime, power1$Sub_metering_1, type="l")
points(datetime, power1$Sub_metering_2, type="l", col="red")
points(datetime, power1$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, power1$Voltage, type="l", ylab="Voltage")
plot(datetime, power1$global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()