##Set Working Directory
setwd("C:\\Users\\rahul.sharma\\Desktop\\Reading Material\\EDA\\Project 1")
##Import and subset data
complete.data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
required.data <- subset(complete.data,{Date == "1/2/2007" | Date == "2/2/2007"})
rm(complete.data)
##Convert date and time into proper datatype
required.data$Date <- as.Date(required.data$Date, "%d/%m/%Y")
required.data$Time <- as.POSIXct(paste(required.data$Date, required.data$Time), format = "%Y-%m-%d %H:%M:%S")
##create plot
png("plot2.png", width = 480, height = 480)
with(required.data, plot(Time, Global_active_power, xlab = "", ylab = "Global Active Power(Kilowatts)", type = "n"))
with(required.data, lines(Time, Global_active_power))
dev.off()