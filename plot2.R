library(sqldf)
library(tcltk)

## use sqldf to filter the large dataset with the period of interest
data <- read.csv.sql('household_power_consumption.txt', ## source data file
                     sep=';', ## separator is semi-colon
					 header=T, ## with header row
                     sql='select * from file where Date="1/2/2007" or Date="2/2/2007"')
					 
## add a column to combine Date and Time together
data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

png(file='plot2.png') ## set graphic device to PNG file
with(data, plot(DateTime, ## X is DateTime
                Global_active_power, ## Y is Global_active_power
                type='l', ## set chart type to line
				xlab='', ## clear the X-label
				ylab='Global Active Power (kilowatts)') ## set the Y-label
	)
dev.off() ## close graphic device
