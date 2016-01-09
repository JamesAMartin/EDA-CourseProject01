
################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot1.png"



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








