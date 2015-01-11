dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Sub_metering_1<- as.numeric(reqData$Sub_metering_1)
Sub_metering_2<- as.numeric(reqData$Sub_metering_2)
Sub_metering_3<- as.numeric(reqData$Sub_metering_3)

datePOSIX <- strptime(paste(reqData$Date, reqData$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(datePOSIX, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datePOSIX,Sub_metering_2, type="l", col="red")
lines(datePOSIX,Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()