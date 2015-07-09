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


#Creating plot 1
par(mfrow=c(1,1))
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

#saving png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
