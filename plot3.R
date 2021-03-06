# This script produces a timeline plot of energy sub metering usage across
#   the two day period from 2/1/2007 - 2/2/2007

# Begin by downloading and unzipping the data from the following URL into your wd
#   URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read data into data frame
elec <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   na.strings = "?")

# Convert Date to date class and subset to the dates we're exploring
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")
subset <- elec$Date == as.Date("2007-02-01") | elec$Date == as.Date("2007-02-02")
elec.sub <- elec[subset, ]

# Combine date-time variables for easier graphing
elec.sub$date.time <- strptime(paste(elec.sub$Date, elec.sub$Time), 
                               "%Y-%m-%d %H:%M:%S")

# Create timeline plot of sub metering usage as png as save as plot3.png
png(file = "plot3.png", height = 480, width = 480)
with(elec.sub, {
  plot(x = date.time, y = Sub_metering_1,
       type = "n",
       xlab = "",
       ylab = "Energy sub metering") 
  lines(x = date.time, y = Sub_metering_1)
  par(new = T)
  lines(x = date.time, y = Sub_metering_2, col = "red")
  par(new = T)
  lines(x = date.time, y = Sub_metering_3, col = "blue")
  legend("topright", lty = c(1, 1, 1), lwd = c(2.5, 2.5, 2.5),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"))
})
dev.off()  # file will be in your working directory
