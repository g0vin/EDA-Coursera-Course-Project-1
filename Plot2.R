#Read in the data
housing_data <- read.table("~/Downloads/household_power_consumption.txt", sep=";", header=T)

#Subset the data
housing_data2 <- subset(housing_data, Date %in% c("1/2/2007", "2/2/2007"))

#Create a new date format in a variable called days_of_week
days_of_week <- strptime(paste(housing_data2$Date, housing_data2$Time), format="%d/%m/%Y %H:%M:%S")

#Change to numeric type
housing_data2$Global_active_power <- as.numeric(housing_data2$Global_active_power)

#Create the png file
png("plot2.png", width=480, height=480)

#Create a line plot for Global Active Power 
plot(days_of_week, housing_data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close the png
dev.off()