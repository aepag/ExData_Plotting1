allData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
dataOfInterest <- allData [allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
dataOfInterest$Global_active_power <- as.numeric(levels(dataOfInterest$Global_active_power))[dataOfInterest$Global_active_power]
dataOfInterest$Time = strptime(paste(as.Date(as.character(dataOfInterest$Date),format="%d/%m/%Y"),dataOfInterest$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")
dataOfInterest$Date <- as.Date(as.character(dataOfInterest$Date),format="%d/%m/%Y")

png(filename = "./plot1.png", width = 480, height = 480, units = "px")
hist(dataOfInterest$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()