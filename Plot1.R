#Read in the data 
housing_data <- read.table("~/Downloads/household_power_consumption.txt", sep=";", header=T)

#Subset the data
housing_data2 <- subset(housing_data, Date %in% c("1/2/2007", "2/2/2007"))

#Create the png file
png("plot1.png", width=480, height=480)

#Create a histogram based on the Global Active Power variable
housing_data2$Global_active_power <- as.numeric(housing_data2$Global_active_power)
hist(housing_data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close the png
dev.off()