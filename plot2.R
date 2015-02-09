# Read data and apply subset
vars <- c("character", "character", rep("numeric", 7))
db<-read.table("household_power_consumption.txt",h=1, sep=";", colClasses=vars, na.strings="?")
dbSub<-subset(db,db$Date=="1/2/2007"|db$Date=="2/2/2007")
dbSub$datetime<-as.POSIXct(paste(dbSub$Date,dbSub$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 2
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(dbSub$datetime,dbSub$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Create png file
dev.off()