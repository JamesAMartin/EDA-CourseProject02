
################################################################################
####	How have emissions from motor vehicle sources changed from 1999–2008 in
####	Baltimore City?



################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot5.png"

###	Filter down to only the Baltimore data
bem <- nei %>% filter(fips=="24510")

###	Combine the scc dataframe with the bem dataframe
scc$SCC <- as.character(scc$SCC)
bem <- inner_join( bem, scc, by = "SCC")

###	Identify all records that deal with motor vehicle sources, limited to
###	"On-Road" as that is the most common interpretation of "motor vehicle".
veh <- grep( "^Mobile - On-Road", bem$EI.Sector, ignore.case = TRUE)
bem <- bem[veh,]


###	Group the total emissions by year
em <- bem %>% group_by( year ) %>% summarise(avg=sum(Emissions))


################################################################################
####	Plot total emissions by year for Baltimore only, broken out by
####	the type of source

g <- qplot(
				x = em$year
				, y = em$avg
				, data = em
				, xlab = "Year"
				, ylab = "Tons"
		  ) + 
	
	geom_path( color = "lightblue") +
	
	labs( title="Baltimore Motor Vehicle PM2.5 by Year")

ggsave( pngFile, plot = g )














