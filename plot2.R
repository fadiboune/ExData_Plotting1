# ***********************************************************************
# ExData_Plotting1 - code for plot 2
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
with(hhenergy, plot(Date, Global_active_power,
                    type="l",
                    xlab="",
                    ylab="Global Active Power (kW)"))
#
# writing to png format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()