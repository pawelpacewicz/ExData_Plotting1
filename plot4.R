plot4<-function() {
    # PREPARING DATA
    # ==============

    # read file
#    temp <- tempfile()
#    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#    hpcDF <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
#    unlink(temp)
    hpcDF<-hpcDF_test

    # subset dates 2007-02-01 - 2007-02-02
    hpcDF <- hpcDF[hpcDF$Date=="1/2/2007" | hpcDF$Date=="2/2/2007",]

    # converting Date and Time into new column with Date and Time
    hpcDF$datetime<-strptime(paste(hpcDF$Date,hpcDF$Time),"%d/%m/%Y %X")

    
    # MAKING PLOT
    # ===========

    # openining device
    png("plot4.png")
    
    #temporary changing locale to have weekdays in english 
    tmp_locale<-Sys.getlocale("LC_TIME")
    Sys.setlocale("LC_TIME", "C")

    #preparing space for 4 plots
    par(mfrow=c(2,2))

    # ploting
    with(hpcDF, {
        # 1st graph
        plot(y=Global_active_power,x=datetime, ylab="Global Active Power",type="l", xlab="")

        # 2nd graph
        plot(y=Voltage,x=datetime, type="l")
        
        # 2rd graph
        plot(y=Sub_metering_1,x=datetime, ylab="Energy sub metering",type="l", xlab="" )
        lines(y=Sub_metering_2,x=datetime, col="red" )
        lines(y=Sub_metering_3,x=datetime, col="blue" )
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black","red","blue"), bty="n")
        
        # 4th graph
        plot(y=Global_reactive_power,x=datetime, type="l")        
    })

    #closing device
    dev.off()
    
    #restoring locale
    Sys.setlocale("LC_TIME", tmp_locale)

    print("plot 4 DONE")
}