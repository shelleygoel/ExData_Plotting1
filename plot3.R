# Reading data
power_data <- read.table("household_power_consumption.txt",
                         sep=";",na.strings=c("?"),
                         colClasses = c(c("character"),c("character"),rep("numeric",7)),
                         header=T)

# Converting to usable date format
power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y") 

# Reading data for relevant dates
two_day_data <- subset(power_data,Date>="2007-02-01" 
                       & Date<="2007-02-02")

two_day_data$Time<-strptime(paste(two_day_data$Date,two_day_data$Time),"%Y-%m-%d %H:%M:%S")

png("plot3.png",width=520,height=520,units="px")

with(two_day_data,plot(Time,Sub_metering_1,type="n",
                        ylab="Energy sub metering",xlab=""))
with(two_day_data,lines(Time,Sub_metering_1,col="black"))
with(two_day_data,lines(Time,Sub_metering_2,col="red"))
with(two_day_data,lines(Time,Sub_metering_3,col="blue"))
legend("topright",pch=46,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()