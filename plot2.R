#Load and subset data to just the required dates
setwd("~/DataScience/ExploratoryDataAnalysis")
Data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
usefulData <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")

#Change Global_active_power from chr to numberic
activePower <- as.numeric(usefulData$Global_active_power)

Date_Time <- paste(usefulData$Date, usefulData$Time, sep = " ")
Date_Time <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(Date_Time, activePower, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()
