data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
Timedata <- paste(as.Date(data1$Date),data1$Time)

data1$Datetime <-as.POSIXct(Timedata)

plot(data1$Datetime,data1$Sub_metering_1,type = "l",ylab = "Energy sub meeting", xlab="")

lines(data1$Datetime,data1$Sub_metering_2,type="l", col= "red")
lines(data1$Datetime,data1$Sub_metering_3,type="l", col= "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
      col=c("black","red","blue"),lty=1)

dev.print(png, "plot3.png", width =480, height =480)
