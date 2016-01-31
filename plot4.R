
################################################################################
####	Across the United States, how have emissions from coal combustion-related
####	sources changed from 1999–2008?


################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot4.png"

###	Join nei and scc datasets
scc$SCC <- as.character(scc$SCC)
emc <- inner_join( nei, scc, by = "SCC")

###	Identify all records that deal with coal combustion
coal <- grep( "coal", emc$EI.Sector, ignore.case = TRUE)
emc <- emc[coal,]

###	Group the total emissions by year
em <- emc %>% group_by( type, year ) %>% summarise(avg=sum(Emissions)/100)



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
	
	labs( title="National Coal Combustion PM2.5 by Type and Year")

ggsave( pngFile, plot = g )






































