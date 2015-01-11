dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power<- as.numeric(reqData$Global_active_power)
Global_reactive_power<- as.numeric(reqData$Global_reactive_power)
Sub_metering_1<- as.numeric(reqData$Sub_metering_1)
Sub_metering_2<- as.numeric(reqData$Sub_metering_2)
Sub_metering_3<- as.numeric(reqData$Sub_metering_3)
Voltage<- as.numeric(reqData$Voltage)
datePOSIX <- strptime(paste(reqData$Date, reqData$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(datePOSIX, Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(datePOSIX, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datePOSIX,Sub_metering_2, type="l", col="red")
lines(datePOSIX,Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", cex=0.953, col=c("black", "red", "blue"))

plot(datePOSIX, Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(datePOSIX, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()