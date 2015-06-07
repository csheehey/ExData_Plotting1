# This script produces a histogram of global active power usage for the days 2/1/2007 -
#   2/2/2007 from the UC Irvine's electric power consumption data set

# Begin by downloading and unzipping the data from the following URL into your wd
#   URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read data into data frame
elec <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   na.strings = "?")

# Convert Date to date class and subset to identify the dates we're exploring
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")
subset <- elec$Date == as.Date("2007-02-01") | elec$Date == as.Date("2007-02-02")

# Create and save histogram of global active power usage as png file
png(file = "plot1.png", height = 480, width = 480)
hist(x = elec$Global_active_power[subset],
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()  # file will be in your working directory, titled "plot1.png"

