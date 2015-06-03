plot3<-function() {
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
    png("plot3.png")

    #temporary changing locale to have weekdays in english 
    tmp_locale<-Sys.getlocale("LC_TIME")
    Sys.setlocale("LC_TIME", "C")

    # ploting
    with(hpcDF, {
        plot(y=Sub_metering_1,x=datetime, ylab="Energy sub metering",type="l", xlab="" )
        lines(y=Sub_metering_2,x=datetime, col="red" )
        lines(y=Sub_metering_3,x=datetime, col="blue" )
    })
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black","red","blue"),)

    #closing device
    dev.off()
    
    #restoring locale
    Sys.setlocale("LC_TIME", tmp_locale)

    print("plot 3 DONE")
}