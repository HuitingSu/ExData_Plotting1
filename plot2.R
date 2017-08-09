# read data
data <- read.table("household_power_consumption/household_power_consumption.txt", 
                   sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
# only select the data we need
data1 <- data[, c(1:3)]
colnames(data1) <- c("Date", "Time", "Global_active_power")

# change the Date from factor to Date format, 
# and then into POSIXct which calculates in seconds
data1$TimeinSec <- as.Date(data1$Date, format="%d/%m/%Y") %>% 
                   paste(data1$Time) %>%
                   as.POSIXct

with(data1, plot(TimeinSec, Global_active_power, type="l",
                 ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()