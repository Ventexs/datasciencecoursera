# Script: plot4.R
# Author: Steven Pettipas
# Date: 15 Oct 2017
#
# Reads a .txt file of household power consumption (2,075,259 rows and 9 columns), formats
# the data, and selects the set used for this project (entries between 01FEB2007 and 02FEB2007)
# and generates a graph (PNG file) as seen in plot4.PNG

readData <- function () {
        data <-
                read.table("household_power_consumption.txt",
                           header = TRUE,
                           sep = ";",
                           na.strings = "?")
        data <-
                within(data,
                       Datetime <-
                               as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
        data$Global_active_power <- as.numeric(data$Global_active_power)
        data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
        data$Voltage <- as.numeric(data$Voltage)
        data$Global_intensity <- as.numeric(data$Global_intensity)
        data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
        data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
        data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
        
        data <-
                data[as.Date(data$Datetime) >= as.Date("2007-02-01") &
                             as.Date(data$Datetime) <= as.Date("2007-02-02"),
                     c(
                             "Datetime",
                             "Global_active_power",
                             "Global_reactive_power",
                             "Voltage",
                             "Global_intensity",
                             "Sub_metering_1",
                             "Sub_metering_2",
                             "Sub_metering_3"
                     )]
        
        data
}

data <- readData()
png("plot4.png")
par(mfcol = c(2, 2))
par(mar = c(4.1, 4.1, 2.1, 4.1))

#topleft plot
plot(
        data$Datetime,
        data$Global_active_power,
        type = "l",
        ylab = "Global Active Power",
        xlab = ""
)

#bottomleft plot
plot(
        data$Datetime,
        data$Sub_metering_1,
        type = "l",
        ylab = "Energy sub metering",
        xlab = ""
)
par(new = TRUE)
plot(
        data$Datetime,
        data$Sub_metering_2,
        type = "l",
        col = "red",
        ylab = "",
        xlab = "",
        axes = FALSE,
        ylim = c(0, 38)
)
par(new = TRUE)
plot(
        data$Datetime,
        data$Sub_metering_3,
        type = "l",
        col = "blue",
        ylab = "",
        xlab = "",
        axes = FALSE,
        ylim = c(0, 38)
)
legend(
        "topright",
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = 1,
        col = c("black", "red", "blue"),
        bty = "n"
)

#topright plot
plot(
        data$Datetime,
        data$Voltage,
        type = "l",
        xlab = "datetime",
        ylab = "Voltage"
)

#bottomright plot
plot(
        data$Datetime,
        data$Global_reactive_power,
        type = "l",
        xlab = "datetime",
        ylab = "Global_reactive_power"
)

dev.off()