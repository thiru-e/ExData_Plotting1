# Read data and apply subset
vars <- c("character", "character", rep("numeric", 7))
db<-read.table("household_power_consumption.txt",h=1, sep=";", colClasses=vars, na.strings="?")
dbSub<-subset(db,db$Date=="1/2/2007"|db$Date=="2/2/2007")
dbSub$datetime<-as.POSIXct(paste(dbSub$Date,dbSub$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 3
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(dbSub$datetime,dbSub$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(dbSub$Sub_metering_1~dbSub$datetime,type="l", col="gray")
lines(dbSub$Sub_metering_2~dbSub$datetime,type="l", col="red")
lines(dbSub$Sub_metering_3~dbSub$datetime,type="l", col="blue")
legend("topright", lty = 1, col = c("gray","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Create png file
dev.off()

