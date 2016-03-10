# ***********************************************************************
# ExData_Plotting1 - code for plot 3
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
with(hhenergy, {
      plot(Date, Sub_metering_1, type="l", xlab="",ylab="Energy Sub-metering", col="black")
      points(Date, Sub_metering_2, type="l", col="red")
      points(Date, Sub_metering_3, type="l", col="blue")
      legend("topright", lty=c(1,1,1), lwd=c(2,2,2),
             col=c("black", "red", "blue"),
             legend=c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"))
})
#
# writing to png format
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()