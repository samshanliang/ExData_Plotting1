HPC <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

# Plot 4
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC1 <- subset(HPC, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
HPC1$datetime <- strptime(paste(HPC1$Date, HPC1$Time), "%Y-%m-%d %H:%M:%S")
HPC1$datetime <- as.POSIXct(HPC1$datetime)

par(mfrow = c(2, 2))
plot(HPC1$Global_active_power ~ HPC1$datetime, type = "l", ylab = "Global Active Power", xlab = "")
plot(HPC1$Voltage ~ HPC1$datetime, type = "l", xlab="datetime", ylab="Voltage")
plot(HPC1$Sub_metering_1 ~ HPC1$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(HPC1$Sub_metering_2 ~ HPC1$datetime, col="red")
lines(HPC1$Sub_metering_3 ~ HPC1$datetime, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
plot(HPC1$Global_reactive_power ~ HPC1$datetime, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="Rplot4.png", height=480, width=480)