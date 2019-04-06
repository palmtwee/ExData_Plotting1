data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings ="?")
## read data in data table in R

feb1 <- data[data$Date=="1/2/2007",]
feb2 <- data[data$Date=="2/2/2007",]
useddata <- rbind(feb1,feb2)
## filter used data
rm(data)
## remove large data to conserve memory

png(filename = "plot1.png",width = 480, height = 480, units = "px")
plot1 <- hist(useddata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main = "Global Active Power",xlim=c(0,6))
dev.off()
## Plot 1