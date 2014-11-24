#Question 5  
#Load data
NEI <- readRDS("/Users/scdavis6/Graphics/summarySCC_PM25.rds")
SCC <- readRDS("/Users/scdavis6/Graphics/Source_Classification_Code.rds")
#Set year as factor 
NEI$year <- ordered(NEI$year, levels = c("1999", "2002", "2005", "2008"))
#subset data of Baltimore
Balt <- NEI[(NEI$fips == "24510"),]
#Index values in El.Sector with vehicle in name

SCC <- as.character(SCC[grep("Vehicle", SCC$SCC.Level.Two), "SCC"])

#Save as data.frame
SCC_vehicles<- as.data.frame(SCC)

#Merge dataframes - done
SCCLB1 <- merge(SCC_vehicles, Balt, by.x = "SCC", by.y = "SCC")


#Plot
png('plot5.png')
a <- ggplot(SCCLB1, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") +
    ggtitle('Vehicle Emissions of Baltimore') + xlab("Year") + guides(fill = F) +
    theme(legend.position = "none")  
print(a)
dev.off()
