plot2 <- function(){
    
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
    png(file = "plot2.png")
    
    #Make plot
    plot(dfsmall$DateTime, dfsmall$Global_active_power, type = "n", 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(dfsmall$DateTime, dfsmall$Global_active_power)
    
    dev.off()
}