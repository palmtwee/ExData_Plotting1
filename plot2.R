data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings ="?")
## read data in data table in R

feb1 <- data[data$Date=="1/2/2007",]
feb2 <- data[data$Date=="2/2/2007",]
useddata <- rbind(feb1,feb2)
## filter used data
rm(data)
## remove large data to conserve memory

png(filename = "plot2.png",width = 480, height = 480, units = "px")
datetime <- as.POSIXct(paste(useddata$Date, useddata$Time), format="%d/%m/%Y %H:%M:%S")
## create datetime object
rawdata <- cbind(datetime, useddata[ ,c(-1,-2)])
## create data with datetime
plot(rawdata$datetime, rawdata$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
## plot line graph by date
dev.off()
## Plot 2