
################################################################################
####	Compare emissions from motor vehicle sources in Baltimore City with
####	emissions from motor vehicle sources in Los Angeles County, California
####	(fips == "06037"). Which city has seen greater changes over time in
####	motor vehicle emissions?



################################################################################
####	Prepare the data and environment before plotting
source("./prepareData.R")
prepareData()
pngFile <- "./plot6.png"

###	Filter down to only the Baltimore and LA data
blem <- nei %>% filter(fips=="24510" | fips == "06037")

###	Combine the scc dataframe with the bem dataframe
scc$SCC <- as.character(scc$SCC)
blem <- inner_join( blem, scc, by = "SCC")

###	Add column indicating the city name
isLA <- blem$fips == "06037"
blem$City[isLA] <- "Los Angeles"
blem$City[!isLA] <- "Baltimore"

###	Identify all records that deal with motor vehicle sources, limited to
###	"On-Road" as that is the most common interpretation of "motor vehicle".
veh <- grep( "^Mobile - On-Road", blem$EI.Sector, ignore.case = TRUE)
blem <- blem[veh,]


###	Group the total emissions by year
em <- blem %>% group_by( City, year ) %>% summarise(avg=sum(Emissions))



################################################################################
####	Plot total emissions by year for Baltimore only, broken out by
####	the type of source

###	Open device for plotting
png( 
		filename = pngFile
		, width = 480
		, height = 480
	)

g <- qplot(
				x = year
				, y = avg
				, data = em
				, xlab = "Year"
				, ylab = "Tons"
				, geom = "line"
				, color = City
		  ) + 
	
		guides(fill=guide_legend(title="City")) +
		
		geom_point() +
		
		labs( title="Motor Vehicle PM2.5" )

#ggsave( pngFile, plot = g )
print(g)

###	Close the device
dev.off()












































