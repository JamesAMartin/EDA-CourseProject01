
################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot2.png"



################################################################################
####	Plot the data in kilowatts by day

###	Open device for plotting
png( 
		filename = pngFile
		, width = 480
		, height = 480
	)

###	Draw the diagram
plot( 
		hpc$Date + hpc$Time
		, hpc$Global_active_power
		, type = "l"
		, xlab = ""
		, ylab = "Global Active Power (kilowatts)"
	)

###	Close the device
dev.off()








