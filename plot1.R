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


# Plotting Histogram
png("plot1.png",width=520,height=520,units="px")

hist(two_day_data$Global_active_power,col="red",
     main="Global Active power",
     xlab="Global Active Power(killowatts)")
dev.off()