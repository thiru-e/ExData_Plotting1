# Read data and apply subset
vars <- c("character", "character", rep("numeric", 7))
db<-read.table("household_power_consumption.txt",h=1, sep=";", colClasses=vars, na.strings="?")
dbSub<-subset(db,db$Date=="1/2/2007"|db$Date=="2/2/2007")
dbSub$datetime<-as.POSIXct(paste(dbSub$Date,dbSub$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 1
hist(dbSub$Global_active_power,col="red",main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)")

#Create png file
dev.copy(png, file = "plot1.png")
dev.off()



