# ***********************************************************************
# ExData_Plotting1 - code for plot 4
# ***********************************************************************
# work with the file "household_power_consumption.txt" (in your working directory)
#
library(lubridate)
#
# reading subset of data (1/2/2007-2/2/2007)
selDate<- grep("^(1|2)/2/2007", readLines("household_power_consumption.txt"))
namesCol<- names(read.table("household_power_consumption.txt",
                            nrows=1,
                            header=T,
                            sep=";"))
hhenergy<- read.table("household_power_consumption.txt",
                      skip=(selDate[1]-1),
                      nrows=length(selDate),
                      col.names=namesCol,
                      sep=";",
                      stringsAsFactors = FALSE)
#
# convert date and time, paste in first column, delete Time column
hhenergy$Date<- dmy_hms(paste(hhenergy$Date, hhenergy$Time))
hhenergy$Time<- NULL
#
# plotting
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(hhenergy, {
      plot(Date, Global_active_power, type="l", xlab="",ylab="Global Active Power (kW)", cex.lab=0.9)
      plot(Date, Voltage, type="l", xlab="", ylab="Voltage", cex.lab=0.9)
      plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy Sub-metering", col="black", cex.lab=0.9)
      points(Date, Sub_metering_2, type="l", col="red")
      points(Date, Sub_metering_3, type="l", col="blue")
      legend("topright", lty=c(1,1,1), lwd=c(2,2,2),
             col=c("black", "red", "blue"),
             legend=c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"),
             bty="n", cex=0.8)
      plot(Date, Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power (kW)", cex.lab=0.9)
})
#
# writing to png format
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()