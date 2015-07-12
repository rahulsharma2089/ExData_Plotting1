##Set Working Directory
setwd("C:\\Users\\rahul.sharma\\Desktop\\Reading Material\\EDA\\Project 1")
##Import and subset data
complete.data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
required.data <- subset(complete.data,{Date == "1/2/2007" | Date == "2/2/2007"})
rm(complete.data)
##Convert date and time into proper datatype
required.data$Date <- as.Date(required.data$Date, "%d/%m/%Y")
required.data$Time <- as.POSIXct(paste(required.data$Date, required.data$Time), format = "%Y-%m-%d %H:%M:%S")
#########################################
##CREATE PLOTS
#########################################
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1))
#top left plot
{
with(required.data, plot(Time, Global_active_power, xlab = "", ylab = "Global Active Power", type = "n"))
with(required.data, lines(Time, Global_active_power))}
#top right plot
{
with(required.data, plot(Time, Voltage, xlab = "datetime", ylab = "Voltage", type = "n"))
with(required.data, lines(Time, Voltage))}
#bottom left plot
{
with(required.data, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", type = "n"))
with(required.data, lines(Time, Sub_metering_1, col = "Black"))
with(required.data, lines(Time, Sub_metering_2, col = "Red"))
with(required.data, lines(Time, Sub_metering_3, col = "Blue"))
legend("topright", lty = 1, bty = "n", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))}
#bottom right plot
{
with(required.data, plot(Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n"))
with(required.data, lines(Time, Global_reactive_power))}
dev.off()