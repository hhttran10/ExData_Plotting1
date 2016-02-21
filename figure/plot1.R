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


hist(as.numeric(as.character(data2$Global_active_power)), # note we used as.character and as numeric since
     # the variable is factor variable. If as.character is not used then the x axis will be in unit of 1000.
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")



