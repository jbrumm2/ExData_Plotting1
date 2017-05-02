## read in data from saved location in working directory, generate data subset
HPC <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
HPC_subset <- subset(HPC, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

## create variables to plot
datetime <- strptime(paste(HPC_subset$Date, HPC_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(as.character(HPC_subset$Global_active_power))

## create plot
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()