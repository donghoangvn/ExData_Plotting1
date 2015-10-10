# set your directory that includes the data file
# reading the data
data<-read.table("household_power_consumption.txt", skip = grep("31/1/2007;23:59:00",  readLines("household_power_consumption.txt")), nrows=2880, sep=";",  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3"), header=FALSE)
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)
data$datetime<-paste(data$Date, data$Time, sep = "-")
data$datetime<-strptime(data$datetime,"%d/%m/%Y-%H:%M:%S")
# making the plot
png("plot3.png",width = 480, height = 480, units = "px")
plot(data$datetime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type = "l",col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l",col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"),lty=c(1,1,1), cex = 0.7)
dev.off()
# check your directory to see your png file