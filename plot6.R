#Question 6 
library(ggplot2)
#Load data
NEI <- readRDS("/Users/scdavis6/Graphics/summarySCC_PM25.rds")
SCC <- readRDS("/Users/scdavis6/Graphics/Source_Classification_Code.rds")
#Set year as factor 
NEI$year <- ordered(NEI$year, levels = c("1999", "2002", "2005", "2008"))
#Subset data of Los Angeles and Baltimore fips
SubLB <- subset(NEI, fips == "06037" | fips == "24510")

#Index values in El.Sector with vehicle in name

SCC <- as.character(SCC[grep("Vehicle", SCC$EI.Sector), "SCC"])
#Save as data.frame
SCC_vehicles<- as.data.frame(SCC)

#Merge dataframes - done
SCCLB <- merge(SCC_vehicles, SubLB, by.x = "SCC", by.y = "SCC")

#plot data 
png('plot6.png')
g <- ggplot(SCCLB, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") +
    ggtitle('Emissions of Baltimore and Los Angeles') + xlab("Year") + guides(fill = F) +
    theme(legend.position = "none") + facet_grid(. ~ fips) 
print(g)
dev.off()
