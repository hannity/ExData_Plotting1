plot3 <- function(){

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

	# make plot and save to png
	png(file = "plot3.png", width = 480, height = 480)

	plot(newdata$Time, sub1, type="l", col="black", ylab="Energy sub metering", xlab="")
	lines(newdata$Time, sub2, col="red")
	lines(newdata$Time, sub3, col="blue")
	legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
	dev.off()
}