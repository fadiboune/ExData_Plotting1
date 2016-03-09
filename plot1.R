# ***********************************************************************
# ExData_Plotting1 - code for plot 1
# ***********************************************************************
# work with the file "household_power_consumption.txt" (in your working directory)
# 
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
                      sep=";")
#
# plotting
with(hhenergy, hist(Global_active_power,
                    col="red",
                    xlab="Global Active Power (kW)",
                    main="Global Active Power"))
# writing to png format
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off