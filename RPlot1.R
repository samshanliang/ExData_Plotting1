HPC <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

# Plot 1
HPC$Global_active_power <- as.numeric(HPC$Global_active_power)
HPC$GAP_CAT <- cut(HPC$Global_active_power / 1000, breaks = c(0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6))
plot1 <- HPC %>% group_by(GAP_CAT) %>% summarise(freq = n())
HPC$GAPK <- HPC$Global_active_power/1000
hist(HPC$GAPK, breaks = 12, freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", xlim = c(0,6))
ggplot(data = HPC, aes(x = GAPK)) + geom_histogram(fill = "red", col = "black") + ggtitle("Global Active Power") + xlab("Global Active Power (kilowatts)") + ylab("Frequency")
ggsave("Rplot2", plot = last_plot(), device = "png", width = 480, height = 480)
