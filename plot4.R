#set working directory
setwd("C:/Users/matr06596/Documents/datasciencecoursera/ExploratoryDataAnalysis")

#reading in the data
data<- read.csv("household_power_consumption.txt",
                skip=66637,
                nrows=2880,
                na.strings = "?",
                header=F,
                sep=";")

#formatting dates
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1, sep=";"))
data$DateTime <-as.POSIXct(paste(data$Date, data$Time, sep= " "),
                           format="%d/%m/%Y %H:%M:%S")
data$Date<- as.Date(data$Date, format= "%d/%m/%y")
data$Time <- strptime(data$Time, format= "%H:%M:%S")

#creating plot4
par(mfrow=c(2,2))
with(data, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

#saving png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
