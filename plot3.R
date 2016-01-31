
################################################################################
####	Of the four types of sources indicated by the type (point, nonpoint, 
####	onroad, nonroad) variable, which of these four sources have seen 
####	decreases in emissions from 1999–2008 for Baltimore City? Which have 
####	seen increases in emissions from 1999–2008? Use the ggplot2 plotting 
####	system to make a plot answer this question.


################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot3.png"

###	Filter down to only the Baltimore data
bem <- nei %>% filter(fips=="24510")

###	Group the total emissions by year
em <- bem %>% group_by( type, year ) %>% summarise(avg=sum(Emissions)/100)



################################################################################
####	Plot total emissions by year for Baltimore only, broken out by
####	the type of source

g <- qplot(
				x = em$year
				, y = em$avg
				, data = em
				, xlab = "Year"
				, ylab = "Tons (x100)"
		  ) + 
	
	geom_path( color = "lightblue") +
	
	facet_grid(.~type) +
	
	labs( title="Baltimore PM2.5 by Type and Year")

ggsave( pngFile, plot = g )





























