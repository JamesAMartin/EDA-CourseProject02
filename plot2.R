
################################################################################
####	Have total emissions from PM2.5 decreased in the Baltimore City, 
####	Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
####	system to make a plot answering this question.



################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot2.png"

###	Filter down to only the Baltimore data
bem <- nei %>% filter(fips=="24510")

###	Group the total emissions by year
em <- bem %>% group_by( year ) %>% summarise(avg=sum(Emissions)/1000)





################################################################################
####	Plot total emissions by year for Baltimore only


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
		, ylab = "Tons (x1,000)"
		, xlab = "Year"
		, type = "o"
		, col = "blue"
		, main =  "Baltimore PM2.5 Emissions by Year"
		, ylim = c(1.75,3.5)
	)

###	Close the device
dev.off()






























