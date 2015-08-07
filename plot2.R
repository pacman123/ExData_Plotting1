file <- "household_power_consumption.txt";
power <- read.table(file, header=T, sep=";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
subset_power <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
subset_power <- transform(subset_power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subset_power$Global_active_power <- as.numeric(as.character(subset_power$Global_active_power))
plot(subset_power$timestamp,subset_power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()