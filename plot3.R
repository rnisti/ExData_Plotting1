#read source
power_consup <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

#preapared data.frame
power_consup$DateTime <- as.POSIXct(paste(power_consup$Date, power_consup$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")
power_consup$Date <- as.Date(power_consup$Date, format = "%d/%m/%Y")
power_consup$Time <- as.POSIXct(power_consup$Time, "%H:%M:%S", tz = "")
power_consup$Global_active_power <- as.numeric(power_consup$Global_active_power)
power_consup$Global_reactive_power <- as.numeric(power_consup$Global_reactive_power)
power_consup$Voltage <- as.numeric(power_consup$Voltage)
power_consup$Global_intensity <- as.numeric(power_consup$Global_intensity)
power_consup$Sub_metering_1 <- as.numeric(power_consup$Sub_metering_1)
power_consup$Sub_metering_2 <- as.numeric(power_consup$Sub_metering_2)
power_consup$Sub_metering_3 <- as.numeric(power_consup$Sub_metering_3)

#subset data
subpower_consup <- subset(power_consup, power_consup$Date <= "2007-02-02")
subpower_consup <- subset(subpower_consup, subpower_consup$Date >= "2007-02-01")


#plot3
par(mfrow = c(1,1))
plot(subpower_consup$DateTime, subpower_consup$Sub_metering_1, type = "l", ylab = "Energy sub metering")
points(subpower_consup$DateTime, subpower_consup$Sub_metering_2, type = "l", col = "red", ylab = "")
points(subpower_consup$DateTime, subpower_consup$Sub_metering_3, type = "l", col = "blue", ylab = "")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(2,4), bty="n", cex = 0.5)
dev.copy(png, file = "plot3.png")
dev.off()
