	# read in data
	data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
	
	# manipulate data
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")		
	newdata <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]
	newdata$Time<- strptime(paste(newdata$Date, newdata$Time), format="%Y-%m-%d %H:%M:%S")
	glob.act.power <- as.numeric(as.character(newdata$Global_active_power))

	# make plot and save to png
	png(file = "plot1.png", width = 480, height = 480)
	hist(glob.act.power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
