file <- "household_power_consumption.txt";
power <- read.table(file, header=T, sep=";")
summary(power)

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
subset_power <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
subset_power$Global_active_power <- as.numeric(as.character(subset_power$Global_active_power))
hist(subset_power$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()