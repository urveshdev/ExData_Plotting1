dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power<- as.numeric(reqData$Global_active_power)
datePOSIX <- strptime(paste(reqData$Date, reqData$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(datePOSIX, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()