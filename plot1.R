dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
Global_active_power<- as.numeric(reqData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()