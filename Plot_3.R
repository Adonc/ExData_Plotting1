##EDA Week 1
#plotting systems in R
# This line reads the data that has been asked for, not the whole data in the file
data<-read.table(file = "household_power_consumption.txt",header = F,sep=";",skip = grep("1/2/2007",readLines("household_power_consumption.txt")),nrows = 2879)
#This line introduces the column names, as the subseting used skipped them
colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Convert the date variable into date class, by combining both the date and time
x <- paste(data[,1], data[,2])
x<-strptime(x, "%d/%m/%Y %H:%M:%S")
## Add the new variable to the data frame
data$timestamp<-x
##Draw a plot of three variables (Energy submettering over time)
plot(data$timestamp,data$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "Datetime")
#add submetering data from variable 2 and color accordingly
lines(data$timestamp,data$Sub_metering_2,col="red")
#add submetering data from variable 2 and color accordingly
lines(data$timestamp,data$Sub_metering_3,col="blue")
#add a legend
legend("topright",legend = c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1),lwd = c(1,1),col = c("black","blue","red"),cex = .75)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
