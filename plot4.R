#Question 4 
#Load data
NEI <- readRDS("/Users/scdavis6/Graphics/summarySCC_PM25.rds")
SCC <- readRDS("/Users/scdavis6/Graphics/Source_Classification_Code.rds")
#Set year as factor 
NEI$year <- ordered(NEI$year, levels = c("1999", "2002", "2005", "2008"))
#Index values in El.Sector with coal in name
SCC <- as.character(SCC[grep("Coal", SCC$EI.Sector), "SCC"])

coal1 <- as.data.frame(SCC)

#Merge datasets by matching 
mergec <- merge(coal1, NEI, by.x = "SCC", by.y = "SCC")

#plot data 
png('plot4.png')
s <- ggplot(mergec, aes(x = year, y = Emissions )) + geom_bar(aes(fill = year), stat = "identity") +
    ggtitle(expression("Total Emissions of Coal in United States")) + guides(fill = F) + 
    theme(legend.position = "none")
print(s) 
dev.off()