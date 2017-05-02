## download data to location of your working directory, read in data
HPC <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## subset data for necessary dates
HPC_subset <- subset(HPC, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

for(i in c(3:ncol(HPC_subset))) {
  HPC_subset[,i] <- as.numeric(as.character(HPC_subset[,i]))
}
png("plot1.png", width = 480, height = 480)
hist(HPC_subset$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()