plot1 <- function(){
  mydata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
  mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
  newdata <- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]
  newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))

  hist(newdata$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}