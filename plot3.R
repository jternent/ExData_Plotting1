# Assignment 1, Plot 3
# This data assumes that ONLY the two days in question are in the file 
# household_power_consumption_small.txt in the working directory.
# setwd() would need to be changed and the file name edited to actually run this in 
# another environment.
# To limit the data set, the following awk script was used:
# awk 'BEGIN {FS=";"} ; $1=="1/2/2007"||$1=="2/2/2007" {print $0}' household_power_consumption.txt  > household_power_consumption_small.txt
# 
# We should convert any NA values represented as '?' to NA using na.strings.
#
setwd('~/Documents/Data Mining/coursera/EDA/ExData_Plotting1/')
data <- read.csv ('household_power_consumption_small.txt',header=FALSE,sep=";",na.strings="?",
                  colClasses=c('character','character','numeric','numeric','numeric','numeric',
                               'numeric','numeric','numeric'), col.names=c('date','time','global_active_power',
                                                                          'global_reactive_power','voltage',
                                                                          'global_intensity','sub_meter_1',
                                                                          'sub_meter_2','sub_meter_3'))
data$timestamp <- with(data,as.POSIXct(paste(date,time),format="%d/%m/%Y %H:%M:%S"))
png(filename="plot3.png",width=480,height=480)
with(data,plot(timestamp,sub_meter_1,type="l",ylab="Energy sub metering", xlab="",col=1))
with(data,lines(timestamp,sub_meter_2,col=2))
with(data,lines(timestamp,sub_meter_3,col=4))
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c(1,2,4),lty=1)
dev.off()

