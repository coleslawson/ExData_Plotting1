#Load and subset data to just the required dates
setwd("~/DataScience/ExploratoryDataAnalysis")
Data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
usefulData <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")

subMetering1 <- as.numeric(usefulData$Sub_metering_1)
subMetering2 <- as.numeric(usefulData$Sub_metering_2)
subMetering3 <- as.numeric(usefulData$Sub_metering_3)
activePower <- as.numeric(usefulData$Global_active_power)
voltage <- as.numeric(usefulData$Voltage)

Date_Time <- paste(usefulData$Date, usefulData$Time, sep = " ")
Date_Time <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#Plot 1
plot(Date_Time, activePower, ylab = "Global Active Power", xlab = "", type = "l")

#Plot 2
plot(Date_Time, subMetering1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(Date_Time, subMetering2, col = "red")
lines(Date_Time, subMetering3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1.5, bty = "n")

#Plot 3
plot(Date_Time, voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#Plot 4
plot(Date_Time, reactivePower, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
