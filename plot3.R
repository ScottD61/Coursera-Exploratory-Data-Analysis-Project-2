#Question 3 
library(ggplot2)
#Load data
NEI <- readRDS("/Users/scdavis6/Graphics/summarySCC_PM25.rds")
#subset baltimore data
Balt <- NEI[(NEI$fips == "24510"),]
#Set the order
Balt$year <- ordered(Balt$year, levels = c("1999", "2002", "2005", "2008"))
#plot data 
qplot(year, Emissions, data = Balt, facets = .~ type)
dev.off()