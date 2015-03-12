plot3 <- function(){
  mydata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
  mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
  newdata <- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]
  newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))
  
  datetime <- paste(as.Date(newdata$Date), newdata$Time)
  newdata$Datetime <- as.POSIXct(datetime)
  
  newdata$Sub_metering_1 <- as.numeric(as.character(newdata$Sub_metering_1))
  newdata$Sub_metering_2 <- as.numeric(as.character(newdata$Sub_metering_2))
  newdata$Sub_metering_3 <- as.numeric(as.character(newdata$Sub_metering_3))
  
  plot(newdata$Datetime,newdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(newdata$Datetime,newdata$Sub_metering_2,col="red")
  lines(newdata$Datetime,newdata$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
}
