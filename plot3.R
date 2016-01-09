
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
pngFile <- "./plot3.png"

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

###	If the hpc dataframe is not already loaded, load it now.  Pull only rows
###	we care about for performance
if( !exists("hpc") )
{
	##	Read headers from file
	header <- read.csv(
							dataFile
							, sep = ";"
							, header = FALSE
							, nrows = 1
							, stringsAsFactors = FALSE
					  )
	
	##	Load data from file and apply headers
	hpc <- read.csv(
							dataFile
							, sep = ";"
							, na.strings = "?"
							, row.names = NULL
							, header = FALSE
							, skip = 66637
							, nrows = 2880
							, stringsAsFactors = FALSE
					)
	names(hpc) <- unlist(header)
	
	##	Convert date and time using lubridate functions
	hpc$Date <- dmy( hpc$Date )
	hpc$Time <- hms( hpc$Time )
}



################################################################################
####	Plot the data in kilowatts by day

###	Open device for plotting
png( 
		filename = pngFile
		, width = 480
		, height = 480
	)



###	Draw the diagram

##	Main initial plot
plot( 
		hpc$Date + hpc$Time
		, hpc$Sub_metering_1
		, type = "l"
		, xlab = ""
		, ylab = "Energy sub metering"
		, col = "black"
	)

##	Add second line plot
lines( hpc$Date + hpc$Time, hpc$Sub_metering_2, col = "red" )

##	Add third line plot
lines( hpc$Date + hpc$Time, hpc$Sub_metering_3, col = "blue" )

##	Add the legend
legend( "topright", lty = c(1,1), col = c( "black", "red", "blue" ), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )


###	Close the device
dev.off()








