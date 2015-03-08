# set path to data file, assuming it's in working directory
url <- "./household_power_consumption.txt"

# load data
power <- read.table(url, header = TRUE, sep = ";", na.strings = "?")

# subset only data from 1/2/2007 and 2/2/2007
subset <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# plotting options
png("plot1.png")
hist(subset[,3],
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
     )
dev.off()