
################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot3.png"



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








