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





#Set veh as dataframe
veh1 <- as.data.frame(vehicles)
write.table(veh, file = "/Users/scdavis6/Desktop/vehicles.csv")

#CREATE NEW INDEX OF DATA B/C OLD ONE HAS ROW NUMBERS, NOT THE ACTUAL SCC DATA

#Index values from SCC dataframe
veh2 <- SCC[542:2196,]
#Merged values in baltimore data.frame by remaining SCC values 
merged <- merge(Balt, SCC, allow.cartesian = TRUE, by.x = 'SCC')
#Set the order
Years <- ordered(merged$year, levels = c("1999", "2002", "2005", "2008"))
#Create plot
qplot(Years, Emissions, data = merged)

veh2 <- merge(veh1, Balt, by.x = SCC)