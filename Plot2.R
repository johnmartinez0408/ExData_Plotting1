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
png(filename="plot2.png", width = 480, height = 480)

#Draw Plot
plot(allData$DateTime, allData$Global_active_power, pch=".", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(allData$DateTime, allData$Global_active_power)

dev.off()
