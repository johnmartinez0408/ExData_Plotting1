#Load Dataset
dataset = read.table("household_power_consumption.txt",header=TRUE, sep=";")
#Change date to be of type date
dataset$Date = as.Date(dataset$Date[], format="%d/%m/%Y")

#Subset dataset with the data for the 2 dates specified in the problem
day1data = subset(dataset,Date==as.Date("2007-02-01"))
day2data = subset(dataset,Date==as.Date("2007-02-02"))

#row bind the data from the 2 days
allData = rbind(day1data,day2data)

#Add a datetime field using the date and the time fields
allData$DateTime = as.POSIXct(paste(as.character(allData$Date), as.character(allData$Time)), format("%Y%m%d %H%M%S"))

#Tell R to draw on a new png image
png(filename="plot4.png", width = 480, height = 480)


#Draw plots
#Set number of graphs and margins
par(mfrow=c(2,2))
par(mar=c(4,4,1,1))
#Top left plot
plot(allData$DateTime, allData$Global_active_power, pch=".", xlab = "", ylab = "Global Active Power (kilowatts)", mar=c(0,4,0,0))
lines(allData$DateTime, allData$Global_active_power)
#Top right plot
plot(allData$DateTime, allData$Voltage, pch=".", xlab = "datetime", ylab = "Voltage")
lines(allData$DateTime, allData$Voltage)
#Bottom left plot
plot( allData$DateTime, allData$Sub_metering_1, xlab="", ylab="Energy sub meetering", pch=".", type="n", ylim=c(0,40))
points(allData$DateTime,as.numeric(as.character(allData$Sub_metering_1)), pch=".")
lines(allData$DateTime,as.numeric(as.character(allData$Sub_metering_1)))
points(allData$DateTime,as.numeric(as.character(allData$Sub_metering_2)), col="red", pch=".")
lines(allData$DateTime,as.numeric(as.character(allData$Sub_metering_2)), col="red")
points(allData$DateTime,as.numeric(as.character(allData$Sub_metering_3)), col="blue", pch=".")
lines(allData$DateTime,as.numeric(as.character(allData$Sub_metering_3)), col="blue")
#Bottom right plot
plot(allData$DateTime, allData$Global_reactive_power, pch=".", xlab = "datetime", ylab = "Global_reactive_power")
lines(allData$DateTime, allData$Global_reactive_power)

dev.off()
