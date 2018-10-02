HPC <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

# Plot 3
HPC1 <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]

HPC_date <- strptime(paste(subHPC$Date, subHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subHPC$Global_active_power)
subMetering1 <- as.numeric(subHPC$Sub_metering_1)
subMetering2 <- as.numeric(subHPC$Sub_metering_2)
subMetering3 <- as.numeric(subHPC$Sub_metering_3)

plot(HPC_date, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(HPC_date, subMetering2, type="l", col="red")
lines(HPC_date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file="Rplot3.png", height=480, width=480)
