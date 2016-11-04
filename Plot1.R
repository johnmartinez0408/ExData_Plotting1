#Load Dataset
dataset = read.table("household_power_consumption.txt",header=TRUE, sep=";")
#Change date to be a string of characters
dataset$Date = as.character(dataset$Date)

#Subset dataset with the data for the 2 dates specified in the problem
day1data = subset(dataset, Date=="1/2/2007")
day2data = subset(dataset, Date=="2/2/2007")

#row bind the data from the 2 days
allData = rbind(day1data,day2data)

#Format Global_active_power to be used in a histogram
allData = na.omit(as.numeric(as.character(allData$Global_active_power)))

#Tell R to draw on a new png image
png(filename="plot1.png", width = 480, height = 480)

#Draw Histogram
hist(allData,col="red", xlab = "Global Acive Power (kilowatts)", main="Global Active Power",xlim = c(0,6))
title("Global Active Power")

dev.off()