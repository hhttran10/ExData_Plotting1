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


plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="") ## Create a base plot of Sub_metering_1 
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red') ## Add a red line
## representing Sub_metering_2 into the plot

lines(data2$DateTime, data2$Sub_metering_3,type='l', col="blue") ## Add a blue line
## representing Sub_metering_3 into the plot


legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1)
       ,col=c("black","red","blue")) ## Create a legend on top right of the box, lines type = 1




