plot1<-function() {
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
    png("plot1.png")

    # ploting
    with(hpcDF, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

    #closing device
    dev.off()

    print("plot 1 DONE")
	
}