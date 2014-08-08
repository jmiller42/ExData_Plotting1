plot1 <- function() {

  ##Read in data (assuming it exists in this location)  
  data <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")
  
  ##Concatanate date and time
  data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  
  ##Convert relevant values to numeric
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  
  ##Open Graphics Device
  png("plot1.png")
  
  ##Plot
  hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  
  ##Close Graphics Device
  dev.off()
}
