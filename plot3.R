allData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
dataOfInterest <- allData [allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
dataOfInterest$Sub_metering_1 <- as.numeric(levels(dataOfInterest$Sub_metering_1))[dataOfInterest$Sub_metering_1]
dataOfInterest$Sub_metering_2 <- as.numeric(levels(dataOfInterest$Sub_metering_2))[dataOfInterest$Sub_metering_2]
dataOfInterest$Time = strptime(paste(as.Date(as.character(dataOfInterest$Date),format="%d/%m/%Y"),dataOfInterest$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")
dataOfInterest$Date <- as.Date(as.character(dataOfInterest$Date),format="%d/%m/%Y")

png(filename = "./plot3.png", width = 480, height = 480, units = "px")
plot(c(min(dataOfInterest$Time),max(dataOfInterest$Time)+1),
  c(min(min(dataOfInterest$Sub_metering_1), min(dataOfInterest$Sub_metering_2), min(dataOfInterest$Sub_metering_3))
  ,max(max(dataOfInterest$Sub_metering_1), max(dataOfInterest$Sub_metering_2), max(dataOfInterest$Sub_metering_3))
  ), type="n", xlab="", ylab="Energy sub metering" ) 
lines(dataOfInterest$Time, dataOfInterest$Sub_metering_1, col="black") 
lines(dataOfInterest$Time, dataOfInterest$Sub_metering_2, col="red") 
lines(dataOfInterest$Time, dataOfInterest$Sub_metering_3, col="blue") 
legend( x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=1, lty=c(1,1))
dev.off()