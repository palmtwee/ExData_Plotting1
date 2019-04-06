data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings ="?")
## read data in data table in R

feb1 <- data[data$Date=="1/2/2007",]
feb2 <- data[data$Date=="2/2/2007",]
useddata <- rbind(feb1,feb2)
## filter used data
rm(data)
## remove large data to conserve memory

datetime <- as.POSIXct(paste(useddata$Date, useddata$Time), format="%d/%m/%Y %H:%M:%S")
## create datetime object
rawdata <- cbind(datetime, useddata[ ,c(-1,-2)])
## create data with datetime

png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(rawdata$datetime, rawdata$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
plot(rawdata$datetime, rawdata$Voltage, ylab="Voltage", xlab="datetime", type="l")
plot(rawdata$datetime, rawdata$Sub_metering_1, ylab="Energy Sub Metering", xlab="", type="l", ylim=c(0,40))
lines(rawdata$datetime, rawdata$Sub_metering_2, col="red")
lines(rawdata$datetime, rawdata$Sub_metering_3, col="blue")
## create overlaying plots
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1:2, cex=0.8)
## create legend
plot(rawdata$datetime, rawdata$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()
#Plot 4