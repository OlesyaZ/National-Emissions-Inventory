setwd("~/Documents/Olesya/Exploratory Data Analys /National-Emissions-Inventory")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BALT <-NEI[(NEI$fips=="24510"),]

xt<-xtabs(Emissions~type+year,data=BALT)
xt<-data.frame(xt)
onroad<-xt[(xt$type=="ON-ROAD"),]
year <- unique(NEI$year)


png(filename = "plot5.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")                           

plot(year,onroad$Freq,xlim=c(1998,2008),col="red",cex=2,pch=19,
     ylab = "Emission",main="Emissions in the Baltimore City from motor vehicle sources")
model<-lm(onroad$Freq~year)
abline(model,lwd=2,col="red")


dev.off()