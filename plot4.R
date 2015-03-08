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
png("plot4.png")
par(mfrow = c(2,2))
par(mar = c(4, 4, 2, 2))
plot(
    subset[,10], subset[,3],
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
)

plot(
    subset[,10], subset[,5],
    type = "l",
    xlab = "datetime",
    ylab = "Voltage"
)
plot(
    subset[,10], subset[,7],
    type = "l",
    xlab = "",
    ylab = "Energy sub metering"
)

points(subset[,10], subset[,8], type = "l", col = "red")
points(subset[,10], subset[,9], type = "l", col = "blue")
legend("topright",
       names(subset[,7:9]),
       lty = c(1,1,1),
       col = c("black", "red", "blue"),
       bty = "n"
)
plot(
    subset[,10], subset[,4],
    type = "l",
    xlab = "datetime",
    ylab = "Global_reactive_power"
)
dev.off()