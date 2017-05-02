## read in data from saved location in working directory, generate data subset
HPC <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
HPC_subset <- subset(HPC, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

## create variables needed
datetime <- strptime(paste(HPC_subset$Date, HPC_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(as.character(HPC_subset$Global_active_power))
subMetering1 <- as.numeric(as.character(HPC_subset$Sub_metering_1))
subMetering2 <- as.numeric(as.character(HPC_subset$Sub_metering_2))
subMetering3 <- as.numeric(as.character(HPC_subset$Sub_metering_3))
Voltage <- as.numeric(as.character(HPC_subset$Voltage))
Global_reactive_power <- as.numeric(as.character(HPC_subset$Global_reactive_power))

## create plot
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, col = "red")
lines(datetime, subMetering3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
plot(datetime, Voltage, type = "l")
plot(datetime, Global_reactive_power, type = "l")
dev.off()