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

png("plot2.png",width=520,height=520,units="px")

with(two_day_data,{plot(Time,Global_active_power,type="n",
                       ylab="Global Active Power(Killowatts)")
        lines(Time,Global_active_power)
        })
dev.off()