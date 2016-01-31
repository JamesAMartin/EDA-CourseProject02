
################################################################################
####	Libraries needed
library(dplyr)
library(ggplot2)


################################################################################
####	Verify if the data has already been downloaded.  If not, prepare the
####	data folder, download the file(s), and load data into R.
prepareData <- function()
{

	###	File and URL settings
	fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/NEI_data.zip"
	zipFile <- "./data/nei.zip"
	neiData <- "./data/summarySCC_PM25.rds"
	sccData <- "./data/Source_Classification_Code.rds"
	
	
	
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
				zipFile
				, exdir = "./data"
			 )
	}
	
	###	If the nei dataframe is not already loaded, load now.
	if( !exists("nei") )
	{
		##	Read the NEI data
		nei <<- readRDS( neiData )
	}
	
	###	If the scc dataframe is not already loaded, load now.
	if( !exists("scc") )
	{
		##	read the SCC data
		scc <<- readRDS( sccData )
	}
	
	
}































