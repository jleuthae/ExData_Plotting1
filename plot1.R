plot1 <- function(){
    
    #Read in the data and subset to Feb 1 and 2, 2007
    energydf <- read.table("household_power_consumption.txt", na.strings = "?"
                           , sep = ";", header = TRUE, 
                           colClasses = c("character", "character", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric"))
    dfsmall <- subset(energydf, Date == "1/2/2007" | Date == "2/2/2007")
    
    #Open png and make histogram of global active power
    png(file = "plot1.png")
    hist(dfsmall$Global_active_power, col = "red", main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")
    dev.off()
}