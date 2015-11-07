#Load and subset data to just the required dates
setwd("~/DataScience/ExploratoryDataAnalysis")
Data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
usefulData <- subset(Data, Data$Date == "1/2/2007" | Data$Date == "2/2/2007")

#Change Global_active_power from chr to numberic
activePower <- as.numeric(usefulData$Global_active_power)

#Set dimensions for png file and then plot hist
png("plot1.png", width = 480, height = 480)
hist(activePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()