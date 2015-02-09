
# Read data and apply subset
vars <- c("character", "character", rep("numeric", 7))
db<-read.table("household_power_consumption.txt",h=1, sep=";", colClasses=vars, na.strings="?")
dbSub<-subset(db,db$Date=="1/2/2007"|db$Date=="2/2/2007")
dbSub$datetime<-as.POSIXct(paste(dbSub$Date,dbSub$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 4
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(dbSub, {
  plot(dbSub$datetime,dbSub$Global_active_power,type="l", xlab="", ylab="Global Active Power")
  
  plot(dbSub$datetime,dbSub$Voltage,type="l", xlab="datetime", ylab="Voltage")
  
  plot(dbSub$datetime,dbSub$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
  lines(dbSub$Sub_metering_1~dbSub$datetime,type="l", col="gray")
  lines(dbSub$Sub_metering_2~dbSub$datetime,type="l", col="red")
  lines(dbSub$Sub_metering_3~dbSub$datetime,type="l", col="blue")
  legend("topright", lty = 1, col = c("gray","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.75)
  
  plot(dbSub$datetime,dbSub$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")
  
})

#Create png file
dev.off()