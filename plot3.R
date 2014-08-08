library(sqldf)
library(tcltk)

## use sqldf to filter the large dataset with the period of interest
data <- read.csv.sql('household_power_consumption.txt', ## source data file
                     sep=';', ## separator is semi-colon
					 header=T, ## with header row
                     sql='select * from file where Date="1/2/2007" or Date="2/2/2007"')
					 
## add a column to combine Date and Time together
data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

png(file='plot3.png') ## set graphic device to PNG file

## first chart
with(data, plot(DateTime, ## X is DateTime
                Sub_metering_1, ## Y is Sub_metering_1
				type='l', ## set chart type to line
				col='black', ## set color to black
				xlab='', ## clear the X-label
				ylab='Energy sub metering') ## set the Y-label
	)

## second chart
with(data, lines(DateTime, ## X is DateTime
                 Sub_metering_2, ## Y is Sub_metering_2
				 col='red') ## set color to red
	)

## third chart
with(data, lines(DateTime, ## X is DateTime
                 Sub_metering_3, ## Y is Sub_metering_3
		         col='blue') ## set color to blue
	)

## create legend for the third chart
legend('topright', ## set legend to affix to the top right corner of the chart
       lty=1, ## set line type to solid
	   lwd=1, ## set line width
	   col=c('black', 'red', 'blue'), ## set color of the legends
	   legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') ## set caption of legends
	  )

dev.off() ## close graphic device
