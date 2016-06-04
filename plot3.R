plot3 <- function(){
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
    png(file = "plot3.png")
    
    #Make plot
    plot(dfsmall$DateTime, dfsmall$Sub_metering_1, type = "n", 
         xlab = "", ylab = "Energy sub metering")
    lines(dfsmall$DateTime, dfsmall$Sub_metering_1, col = "black")
    lines(dfsmall$DateTime, dfsmall$Sub_metering_2, col = "red")
    lines(dfsmall$DateTime, dfsmall$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           col = c("black","red","blue"))
    
    dev.off()
    
}