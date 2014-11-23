#Question 1 - reload data and redo plot 
#Load data
NEI <- readRDS("/Users/scdavis6/Graphics/summarySCC_PM25.rds")

#Set the order
ordyear <- ordered(NEI$year, levels = c("1999", "2002", "2005", "2008"))
#Plot first graph
png('plot1.png')
plot(ordyear, NEI$Emissions, main = "Total Emissions By Year", 
     xlab = "Year", Ylab = "", type = "l", ylim = c(0, 70000), 
     mtext(text = "Emissions", side = 2, line = 2))
dev.off()

