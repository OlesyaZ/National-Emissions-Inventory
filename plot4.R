setwd("~/Documents/Olesya/Exploratory Data Analys /National-Emissions-Inventory")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## In Source_Classification_Code.rds choose SCC with EI.Sector which contain "Coal"
coal<-grep("Comb.*Coal|Coal.*Comb", SCC$EI.Sector, ignore.case = FALSE)
SCC_num<-SCC$SCC[coal]
SCC_num<-as.character(SCC_num)
SCC_num<-as.numeric(SCC_num)

## Subset data 

Combation <-NEI[NEI$SCC %in% SCC_num,]
total_PM <- sapply(split(Combation$Emissions,Combation$year),sum)
year <- unique(NEI$year)

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")                           

plot(year,total_PM,xlim=c(1998,2008),col="red",cex=2,pch=4,
     ylab = "Emission",main ="Coal Combustion-related Sources across USA")
model<-lm(total_PM~year)
abline(model,lwd=2)

dev.off()