setwd("~/Documents/Olesya/Exploratory Data Analys /National-Emissions-Inventory")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BALT <-NEI[(NEI$fips=="24510"),]

total_PM <- sapply(split(BALT$Emissions,BALT$year),sum)
year <- unique(NEI$year)

png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")                           

plot(year,total_PM,xlim=c(1998,2008),col="blue",cex=0.7,pch=19, main="Total emissions in the Baltimore City")
model<-lm(total_PM~year)
abline(model,lwd=2)

dev.off()