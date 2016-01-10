llData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
dataOfInterest <- allData [allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
dataOfInterest$Global_active_power <- as.numeric(levels(dataOfInterest$Global_active_power))[dataOfInterest$Global_active_power]
dataOfInterest$Time = strptime(paste(as.Date(as.character(dataOfInterest$Date),format="%d/%m/%Y"),dataOfInterest$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")
dataOfInterest$Date <- as.Date(as.character(dataOfInterest$Date),format="%d/%m/%Y")
dataOfInterest$Sub_metering_1 <- as.numeric(levels(dataOfInterest$Sub_metering_1))[dataOfInterest$Sub_metering_1]
dataOfInterest$Sub_metering_2 <- as.numeric(levels(dataOfInterest$Sub_metering_2))[dataOfInterest$Sub_metering_2]
dataOfInterest$Voltage <- as.numeric(levels(dataOfInterest$Voltage))[dataOfInterest$Voltage]
dataOfInterest$Global_reactive_power <- as.numeric(levels(dataOfInterest$Global_reactive_power))[dataOfInterest$Global_reactive_power]
  
  png(filename = "./plot4.png", width = 480, height = 480, units = "px")
  par(mfrow=c(2,2))
  
  plot(c(min(dataOfInterest$Time),max(dataOfInterest$Time)+1),c(min(dataOfInterest$Global_active_power), max(dataOfInterest$Global_active_power)), type="n", xlab="", ylab="Global Active Power (kilowatts)" ) 
  lines(dataOfInterest$Time, dataOfInterest$Global_active_power) 
  
  plot(c(min(dataOfInterest$Time),max(dataOfInterest$Time)+1),c(min(dataOfInterest$Voltage), max(dataOfInterest$Voltage)), type="n", xlab="datetime", ylab = "Voltage") 
  lines(dataOfInterest$Time, dataOfInterest$Voltage) 
  
  plot(c(min(dataOfInterest$Time),max(dataOfInterest$Time)+1),
       c(min(min(dataOfInterest$Sub_metering_1), min(dataOfInterest$Sub_metering_2), min(dataOfInterest$Sub_metering_3))
         ,max(max(dataOfInterest$Sub_metering_1), max(dataOfInterest$Sub_metering_2), max(dataOfInterest$Sub_metering_3))
       ), type="n", xlab="", ylab="Energy sub metering" ) 
  lines(dataOfInterest$Time, dataOfInterest$Sub_metering_1, col="black") 
  lines(dataOfInterest$Time, dataOfInterest$Sub_metering_2, col="red") 
  lines(dataOfInterest$Time, dataOfInterest$Sub_metering_3, col="blue") 
  legend( x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=1, lty=c(1,1), bty = "n")
  
  plot(c(min(dataOfInterest$Time),max(dataOfInterest$Time)+1),c(min(dataOfInterest$Global_reactive_power), max(dataOfInterest$Global_reactive_power)), type="n", xlab="datetime", ylab = "Global_reactive_power") 
  lines(dataOfInterest$Time, dataOfInterest$Global_reactive_power) 
  dev.off()
  