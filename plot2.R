plot2 <- function() {
  
  ##Read in data (assuming it exists in this location)
  data <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")
  
  ##Subset relevant dates
  data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  
  ##Concatanate date and time
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  ##Convert relevant values to numeric
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  
  ##Open graphics device
  png("plot2.png")
  
  ##Plot
  plot(data$Date, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "", main="")
  
  ##Close graphics device
  dev.off()
}
