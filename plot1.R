library(sqldf)
library(tcltk)

## use sqldf to filter the large dataset with the period of interest
data <- read.csv.sql('household_power_consumption.txt', ## source data file
                     sep=';', ## separator is semi-colon
					 header=T, ## with header row
                     sql='select * from file where Date="1/2/2007" or Date="2/2/2007"')

png(file='plot1.png') ## set graphic device to PNG file
hist(data$Global_active_power, ## variable of interest is Global_active_power
     col='red', ## set color of the histogram to red
	 main='Global Active Power', ## set the title of the chart
     xlab='Global Active Power (kilowatts)') ## set the X-label
dev.off() ## close graphic device
