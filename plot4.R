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

png("plot4.png",width=520,height=520,units="px")
par(mfrow=c(2,2))

with(two_day_data,{plot(Time,Global_active_power,type="n",
                        ylab="Global Active Power(Killowatts)",
                        xlab="")
        lines(Time,Global_active_power)
})

with(two_day_data,{plot(Time,Voltage,type="n",
                        ylab="Voltage", xlab="datetime")
        lines(Time,Voltage)
})

with(two_day_data,{plot(Time,Sub_metering_1,type="n",
                       ylab="Energy sub metering",xlab="")
     lines(Time,Sub_metering_1,col="black")
     lines(Time,Sub_metering_2,col="red")
     lines(Time,Sub_metering_3,col="blue")
     legend("topright",pch=46,col=c("black","red","blue"),
            lty=c(1,1,1),
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     })

with(two_day_data,{plot(Time,Global_reactive_power,type="n",
                        ylab="Global_reactive_power", xlab="datetime")
        lines(Time,Global_reactive_power)
})
dev.off()