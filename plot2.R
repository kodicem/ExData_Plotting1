plot2 <- function(){
  mydata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
  mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
  newdata <- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]
  newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))
  
  datetime <- paste(as.Date(newdata$Date), newdata$Time)
  newdata$Datetime <- as.POSIXct(datetime)
  
  plot(newdata$Global_active_power~newdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
}


