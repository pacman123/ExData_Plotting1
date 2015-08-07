file <- "household_power_consumption.txt";
power <- read.table(file, header=T, sep=";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
subset_power <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
subset_power <- transform(subset_power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subset_power$Global_active_power <- as.numeric(as.character(subset_power$Global_active_power))

plot(subset_power$timestamp,subset_power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset_power$timestamp,subset_power$Sub_metering_2,col="red")
lines(subset_power$timestamp,subset_power$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),cex=0.6, lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()  