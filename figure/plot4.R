rm(list=ls())
getwd()


data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

names(data) # Check column names

head(data)  # Check first 6 rows

sapply(data,class) # Check column data class

data$DateTime<-paste(data$Date, data$Time)  ## Create a new variable/ column by concatenate Date and Time

data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S") ## Convert data frormat into yyyy-mm-dd hh:mm:ss
## Note if the order of %d/%m/%Y is changed, the function no longer works


start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-data[start:end,]


par(mfcol=c(2,2))

plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)),
     type='l',ylab="Global Active Power", xlab="") ## Create top left plot


plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', xlab="",ylab ="Energy sub metering")
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red')
lines(data2$DateTime, data2$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue")) ## Create bottom left plot


plot(data2$DateTime, as.numeric(as.character(data2$Voltage)),type='l', 
     ylab="Voltage",xlab="datetime" )  ## Create top right plot


plot(data2$DateTime, as.numeric(as.character(data2$Global_reactive_power)),type='l', 
     ylab="Global_reactive_power",xlab="datetime" ) ## Create bottom right plot



