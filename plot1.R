setwd("~/Documents/Olesya/Exploratory Data Analys /National-Emissions-Inventory")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_PM <- sapply(split(NEI$Emissions,NEI$year),sum)
year <- unique(NEI$year)

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")                           

plot(year,total_PM,xlim=c(1998,2008),col="red",cex=0.7,pch=19,main="Total emissions in USA")
model<-lm(total_PM~year)
abline(model,lwd=2)

dev.off()