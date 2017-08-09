# read data
data <- read.table("household_power_consumption/household_power_consumption.txt", 
                   sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
# only select the data we need
data1 <- data[, 3]

# make plot and copy to png
hist(data1, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()