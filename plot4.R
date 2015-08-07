file <- "household_power_consumption.txt";
power <- read.table(file, header=T, sep=";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
subset_power <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
subset_power <- transform(subset_power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subset_power$Global_active_power <- as.numeric(as.character(subset_power$Global_active_power))

par(mfrow=c(2,2))

##PLOT 1
plot(subset_power$timestamp,subset_power$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##PLOT 2
plot(subset_power$timestamp,subset_power$Voltage, type="l", xlab="datetime", ylab="Voltage")

##PLOT 3
plot(subset_power$timestamp,subset_power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset_power$timestamp,subset_power$Sub_metering_2,col="red")
lines(subset_power$timestamp,subset_power$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), ltw=c(1,1), bty="y", cex=.9) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#PLOT 4
plot(subset_power$timestamp,subset_power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()  