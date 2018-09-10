## Read household_power_consumption Database

dataset <- read.csv("~/Particular/DataScience_Specialization/Course_4/week1/household_power_consumption.txt", sep=";")

## "dataset" has 2075259 Observations and 9 variables

## Date: Date in format dd/mm/yyyy
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
## Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
## Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

## see variables
str(dataset)
## 'data.frame':	2075259 obs. of  9 variables:
## $ Date                 : Factor w/ 1442 levels "1/1/2007","1/1/2008",..: 342 342 342 342 342 342 342 342 342 342 ...
## $ Time                 : Factor w/ 1440 levels "00:00:00","00:01:00",..: 1045 1046 1047 1048 1049 1050 1051 1052 1053 1054 ...
## $ Global_active_power  : Factor w/ 4187 levels "?","0.076","0.078",..: 2082 2654 2661 2668 1807 1734 1825 1824 1808 1805 ...
## $ Global_reactive_power: Factor w/ 533 levels "?","0.000","0.046",..: 189 198 229 231 244 241 240 240 235 235 ...
## $ Voltage              : Factor w/ 2838 levels "?","223.200",..: 992 871 837 882 1076 1010 1017 1030 907 894 ...
## $ Global_intensity     : Factor w/ 222 levels "?","0.200","0.400",..: 53 81 81 81 40 36 40 40 40 40 ...
## $ Sub_metering_1       : Factor w/ 89 levels "?","0.000","1.000",..: 2 2 2 2 2 2 2 2 2 2 ...
## $ Sub_metering_2       : Factor w/ 82 levels "?","0.000","1.000",..: 3 3 14 3 3 14 3 3 3 14 ...
## $ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

## Format Variable Data and create a small database "datasetf"
library(dplyr)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
datasetf <- filter(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
## "datasetf" has 2880 observations and 9 variables

## Format Variable "Time" as POSIXct with the same date as variable "Date"
datasetf$Time <- as.POSIXct(strptime (paste(datasetf$Date,datasetf$Time,sep=" "), "%Y-%m-%d %H:%M:%S"))


## Format variable "Global_active_pwer" as numeric
datasetf$Global_active_power <- as.numeric(levels(datasetf$Global_active_power))[datasetf$Global_active_power]

## Open device and do the plot - X lables are in Portuguese
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")

with(datasetf, plot(Time,Global_active_power, type = "l", col="black", bg = "white",xlab = "", ylab = ""))
title(xlab = "", ylab = "Global Active Power (killowatts)")

## close device
dev.off()

