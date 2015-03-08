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
png("plot3.png")
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
       col = c("black", "red", "blue")
    )
dev.off()

