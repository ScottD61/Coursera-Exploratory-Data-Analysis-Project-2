#Question 2
#Load data
NEI <- readRDS("/Users/scdavis6/Graphics/summarySCC_PM25.rds")
#subset data
Balt <- NEI[(NEI$fips == "24510"),]
#Set the order
ordyearB <- ordered(Balt$year, levels = c("1999", "2002", "2005", "2008"))
#plot data 
png('plot2.png')
plot(ordyearB, Balt$Emissions, main = "Total Emissions By Year", 
     xlab = "Year", Ylab = "", mtext(text = "Emissions", side = 2, line = 3),
     ylim = c(0, 1500))
dev.off()


