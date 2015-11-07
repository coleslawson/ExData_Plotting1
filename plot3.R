#Load and subset data to just the required dates
setwd("~/DataScience/ExploratoryDataAnalysis")
Data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
usefulData <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")

subMetering1 <- as.numeric(usefulData$Sub_metering_1)
subMetering2 <- as.numeric(usefulData$Sub_metering_2)
subMetering3 <- as.numeric(usefulData$Sub_metering_3)

Date_Time <- paste(usefulData$Date, usefulData$Time, sep = " ")
Date_Time <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(Date_Time, subMetering1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(Date_Time, subMetering2, col = "red")
lines(Date_Time, subMetering3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1.5)
dev.off()