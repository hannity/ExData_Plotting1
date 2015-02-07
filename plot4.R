plot4 <- function(){

	# read in data
	data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
	
	# manipulate data
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")		
	newdata <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]
	newdata$Time<- strptime(paste(newdata$Date, newdata$Time), format="%Y-%m-%d %H:%M:%S")
	glob.act.power <- as.numeric(as.character(newdata$Global_active_power))
	sub1 <- as.numeric(as.character(newdata$Sub_metering_1))
	sub2 <- as.numeric(as.character(newdata$Sub_metering_2))
	sub3 <- as.numeric(as.character(newdata$Sub_metering_3))
	voltage <- as.numeric(as.character(newdata$Voltage))
	glob.react.power <- as.numeric(as.character(newdata$Global_reactive_power))




	# make plot and save to png
	png(file = "plot4.png", width = 480, height = 480)

	par(mfrow = c(2,2))
	
	# plot 1
	plot(newdata$Time, glob.act.power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

	#plot 2

	plot(newdata$Time, voltage, type="l", xlab="datetime", ylab="Voltage")

	#plot 3
	
	plot(newdata$Time, sub1, type="l", col="black", ylab="Energy sub metering", xlab="")
	lines(newdata$Time, sub2, col="red")
	lines(newdata$Time, sub3, col="blue")
	legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
	
	#plot 4

	plot(newdata$Time, glob.react.power, type="l", xlab="datetime", ylab="Global_reactive_power")

	dev.off()
}