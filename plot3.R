# read data
data <- read.table("household_power_consumption/household_power_consumption.txt", 
                   sep = ";", na.strings = "?", skip = 66637, nrows = 2880)

# only select the data we need
data1 <- data[, c(1,2,7,8,9)]
colnames(data1) <- c("Date", "Time", "Sub_metering_1","Sub_metering_2","Sub_metering_3")

# change the Date from factor to Date format, 
# and then into POSIXct which calculates in seconds
data1$TimeinSec <- as.Date(data1$Date, format="%d/%m/%Y") %>% 
        paste(data1$Time) %>%
        as.POSIXct

with(data1, {
     plot(TimeinSec, Sub_metering_1, type="l",
          ylab="Energy sub metering", xlab="", col="black")
     lines(TimeinSec, Sub_metering_2, col="red")
     lines(TimeinSec, Sub_metering_3, col="blue")
     })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex=0.8,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()