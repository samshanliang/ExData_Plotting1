HPC <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

# Plot 2
HPC <- HPC
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC1 <- subset(HPC, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
HPC1$datetime <- strptime(paste(HPC1$Date, HPC1$Time), "%Y-%m-%d %H:%M:%S")
hist(HPC1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="Rplot2.png", height=480, width=480)