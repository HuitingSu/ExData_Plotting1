# read data
data <- read.table("household_power_consumption/household_power_consumption.txt", 
                   sep = ";", na.strings = "?", skip = 66637, nrows = 2880)

# Assign column names
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                     "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")

# change the Date from factor to Date format, 
# and then into POSIXct which calculates in seconds
data$TimeinSec <- as.Date(data$Date, format="%d/%m/%Y") %>% 
                  paste(data$Time) %>%
                  as.POSIXct

par(mfrow=c(2,2))

with(data, {
        plot(TimeinSec, Global_active_power, type="l", ylab="Global Active Power", xlab="")
        plot(TimeinSec, Voltage, type="l", ylab="Voltage", xlab="datetime")
        
        plot(TimeinSec, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
        lines(TimeinSec, Sub_metering_2, col="red")
        lines(TimeinSec, Sub_metering_3, col="blue")
        legend("topright", col=c("black", "red", "blue"), cex=0.7, lty=1, lwd=1, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(TimeinSec, Global_reactive_power, type="l",
             ylab="Global_reactive_power", xlab="datetime")
})


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()