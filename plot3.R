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

#creating plot3
par(mfrow=c(1,1))
EnergyMetering<-plot(data$DateTime, data$Sub_metering_1, "l", xlab="", ylab="Energy sub metering")
EnergyMetering<- lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
EnergyMetering<-lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
EnergyMetering<-legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col=c("black","red", "blue"))

#saving png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
