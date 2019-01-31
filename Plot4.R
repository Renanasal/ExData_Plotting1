data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
Timedata <- paste(as.Date(data1$Date),data1$Time)

data1$Datetime <-as.POSIXct(Timedata)

par(mfrow= c(2,2), mar =c(4,4,2,1),oma=c(0,0,2,0))
with(data1, {
     plot(Datetime,Global_active_power, type="l", ylab = "Global Active Power", xlab ="")

     plot(Datetime,Voltage, type="l", ylab = "Voltage", xlab ="datetime")
    
     plot(Datetime,Sub_metering_1,type = "l",ylab = "Energy sub meeting", xlab="")
     lines(Datetime,Sub_metering_2,type="l", col= "red")
     lines(Datetime,Sub_metering_3,type="l", col= "blue")
     legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2,
         col=c("black","red","blue"), bty = "n")
    
     plot(Datetime,Global_reactive_power, type ="l", ylab="Global_reactive_power", xlab = "datetime",
          
          )
})

dev.print(png, "plot4.png", width =480, height =480)
