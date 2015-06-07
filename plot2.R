# This script produces a timeline plot of global active power usage across
#   the two day period from 2/1/2007 - 2/2/2007

# Begin by downloading and unzipping the data from the following URL into your wd
#   URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read data into data frame
elec <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   na.strings = "?")

# Convert Date to date class and subset to identify the dates we're exploring
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")
subset <- elec$Date == as.Date("2007-02-01") | elec$Date == as.Date("2007-02-02")

# Combine date-time variables for easier graphing
elec$date.time <- strptime(paste(elec$Date, elec$Time), "%Y-%m-%d %H:%M:%S")

# Create timeline plot of global active power usage as png as save as plot2.png
png(file = "plot2.png", height = 480, width = 480)
plot(x = elec$date.time[subset], y = elec$Global_active_power[subset],
     type = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)") + 
  lines(x = elec$date.time[subset], y = elec$Global_active_power[subset])
dev.off()  # file will be in your working directory
