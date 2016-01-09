
################################################################################
####	Libraries needed
library( lubridate )




################################################################################
####	Verify if the data has already been downloaded.  If not, prepare the
####	data folder, download the file, and load data into R.

###	File and URL settings
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
zipFile <- "./data/hpc.zip"
dataFile <- "./data/household_power_consumption.txt"
pngFile <- "./plot1.png"

###	Create the data folder if it does not exist
if (!file.exists("data"))
{
    dir.create("data")
}

###	Download the data and unzip it, if it has not already been done
if( !file.exists( zipFile ) )
{
	##	Download and unzip the file
	download.file( 
					url = fileUrl
					, destfile = zipFile
					, mode = "wb"
				 )
	
	unzip(
			"./data/hpc.zip"
			, exdir = "./data"
		 )
}

###	If the hpc dataframe is not already loaded, load it now.
if( !exists("hpc") )
{
	##	Load data into R and tweak any fields needed
	hpc <- read.csv( dataFile, sep = ";", na.strings = "?", row.names = NULL )
	hpc$Date <- dmy( hpc$Date )
	hpc$Time <- hms( hpc$Time )
	hpc <- hpc[hpc$Date == ymd("2007-02-01") | hpc$Date == ymd("2007-02-02"), ]
}


################################################################################
####	Plot the data in histogram format

###	Open device for plotting
png( 
		filename = pngFile
		, width = 480
		, height = 480
	)

###	Draw the diagram
hist( 
		hpc$Global_active_power
		, col = "red"
		, main = "Global Active Power"
		, xlab = "Global Active Power (kilowatts)" 
		, breaks = 12
		, xlim = 
	)

###	Close the device
dev.off()








