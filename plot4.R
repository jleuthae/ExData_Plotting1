plot4 <- function(){
    #Read in the data and subset to Feb 1 and 2, 2007
    energydf <- read.table("household_power_consumption.txt", na.strings = "?"
                           , sep = ";", header = TRUE, 
                           colClasses = c("character", "character", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric"))
    dfsmall <- subset(energydf, Date == "1/2/2007" | Date == "2/2/2007")
    
    #Create new DateTime variable which has the date/time format
    dfsmall$DateTime <- as.POSIXct(paste(dfsmall$Date, dfsmall$Time),
                                   format = "%d/%m/%Y %H:%M:%S")
    
    #Open png
    png(file = "plot4.png")
    
    #Set par values
    par(mfrow = c(2,2))
    
    #Make plot 1
    plot(dfsmall$DateTime, dfsmall$Global_active_power, type = "n", 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(dfsmall$DateTime, dfsmall$Global_active_power)
    
    #Make plot 2
    plot(dfsmall$DateTime, dfsmall$Voltage, xlab = "datetime", 
         ylab = "Voltage", type = "n")
    lines(dfsmall$DateTime, dfsmall$Voltage)
    
    #Make plot 3
    plot(dfsmall$DateTime, dfsmall$Sub_metering_1, type = "n", 
         xlab = "", ylab = "Energy sub metering")
    lines(dfsmall$DateTime, dfsmall$Sub_metering_1, col = "black")
    lines(dfsmall$DateTime, dfsmall$Sub_metering_2, col = "red")
    lines(dfsmall$DateTime, dfsmall$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           col = c("black","red","blue"))
    
    #Make plot 4
    plot(dfsmall$DateTime, dfsmall$Global_reactive_power, 
         xlab = "datetime", ylab = "Global_reactive_power", type = "n")
    lines(dfsmall$DateTime, dfsmall$Global_reactive_power)
    
    dev.off()
    
}