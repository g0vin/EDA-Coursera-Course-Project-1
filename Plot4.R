#Read in the data 
housing_data <- read.table("~/Downloads/household_power_consumption.txt", sep=";", header=T)

#Subset the data
housing_data2 <- subset(housing_data, Date %in% c("1/2/2007", "2/2/2007"))

#Create a new date format in a variable called days_of_week
days_of_week <- strptime(paste(housing_data2$Date, housing_data2$Time), format="%d/%m/%Y %H:%M:%S")

#Convert the appropriate variables to numeric type
housing_data2$Global_active_power <- as.numeric(housing_data2$Global_active_power)
housing_data2$Voltage <- as.numeric(housing_data2$Voltage)
housing_data2$Sub_metering_1 <- as.numeric(housing_data2$Sub_metering_1)
housing_data2$Sub_metering_2 <- as.numeric(housing_data2$Sub_metering_2)
housing_data2$Sub_metering_3 <- as.numeric(housing_data2$Sub_metering_3)
housing_data2$Global_reactive_power <- as.numeric(housing_data2$Global_reactive_power)

#Create the png file
png("plot4.png", width=480, height=480)

#2x2 matrix of plots
par(mfrow=c(2,2))

#Create the Global Active Power line plot
plot(days_of_week, housing_data2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Create the Voltage line plot
plot(days_of_week, housing_data2$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Create the Sub_metering line plots
plot(days_of_week, housing_data2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(days_of_week, housing_data2$Sub_metering_2, type="l", col="red")
lines(days_of_week, housing_data2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#Create the Global_reactive_power line plot
plot(days_of_week, housing_data2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Close the png
dev.off()