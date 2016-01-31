
################################################################################
####	Have total emissions from PM2.5 decreased in the United States from 1999
####	to 2008? Using the base plotting system, make a plot showing the total
####	PM2.5 emission from all sources for each of the years 1999, 2002, 2005,
####	and 2008.



################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot1.png"

###	Group the total emissions by year
em <- nei %>% group_by( year ) %>% summarise(avg=sum(Emissions)/1000000)




################################################################################
####	Plot total emissions by year

###	Open device for plotting
png( 
		filename = pngFile
		, width = 480
		, height = 480
	)

###	Plot the totals of each year side by side
plot( 
		em$year
		, em$avg
		, pch=20
		, ylab = "Tons (x1,000,000)"
		, xlab = "Year"
		, type = "o"
		, col = "blue"
		, main =  "Total PM2.5 Emissions by Year"
	)

###	Close the device
dev.off()


