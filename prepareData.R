
################################################################################
####	Libraries needed
library( lubridate )


################################################################################
####	File and URL settings
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
zipFile <- "./data/hpc.zip"
dataFile <- "./data/household_power_consumption.txt"
	

################################################################################
####	Verify if the data has already been downloaded.  If not, prepare the
####	data folder, download the file, and load data into R.
prepareData <- function()
{
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
		hpc <<- read.csv(
								dataFile
								, sep = ";"
								, na.strings = "?"
								, row.names = NULL
								, header = FALSE
								, skip = 66637
								, nrows = 2880
								, stringsAsFactors = FALSE
						)
		names(hpc) <<- unlist(header)
		
		##	Convert date and time using lubridate functions
		hpc$Date <<- dmy( hpc$Date )
		hpc$Time <<- hms( hpc$Time )
	}
	
	
}

