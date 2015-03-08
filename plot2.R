# set path to data file, assuming it's in working directory
url <- "./household_power_consumption.txt"

# load data
power <- read.table(url, header = TRUE, sep = ";", na.strings = "?")

# subset only data from 1/2/2007 and 2/2/2007
subset <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# create a Datetime vector by pasting and converting Date and Time
Datetime <- paste(subset[,1], subset[,2])
Datetime <- strptime(Datetime, format = "%d/%m/%Y %H:%M:%S")

# cbind Datetime with subset
subset <- cbind(subset, Datetime)

# plot options
png("plot2.png")
plot(
    subset[,10], subset[,3],
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
    )
dev.off()