plot3 <- function() {
  
  ##Read in data (assuming it exists in this location)
  data <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")
  
  ##Subset relevant dates
  data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  
  ##Concatanate date and time
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  ##Convert relevant values to numeric
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  
  ##Open graphics device
  png("plot3.png")
  
  #Plot
  plot(data$Date, data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "", main="")
  lines(data$Date, data$Sub_metering_2, col = "red")
  lines(data$Date, data$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,col=c('black', 'red', 'blue'))
  
  ##Close graphics device
  dev.off()
}
