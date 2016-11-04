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
png(filename="plot3.png", width = 480, height = 480)

#Draw plot
plot( allData$DateTime, allData$Sub_metering_1, xlab="", ylab="Energy sub meetering", pch=".", type="n", ylim=c(0,40))
points(allData$DateTime,as.numeric(as.character(allData$Sub_metering_1)), pch=".")
lines(allData$DateTime,as.numeric(as.character(allData$Sub_metering_1)))
points(allData$DateTime,as.numeric(as.character(allData$Sub_metering_2)), col="red", pch=".")
lines(allData$DateTime,as.numeric(as.character(allData$Sub_metering_2)), col="red")
points(allData$DateTime,as.numeric(as.character(allData$Sub_metering_3)), col="blue", pch=".")
lines(allData$DateTime,as.numeric(as.character(allData$Sub_metering_3)), col="blue")

legend("topright", c("Sub_meetering_1","Sub_meetering_2", "Sub_meetering_3"),cex=1, col=c("black", "red", "blue"),lwd=c(2.5,2.5,2.5))

dev.off()
