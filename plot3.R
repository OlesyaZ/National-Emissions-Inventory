setwd("~/Documents/Olesya/Exploratory Data Analys /National-Emissions-Inventory")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BALT <-NEI[(NEI$fips=="24510"),]

## Cross tabs  
xt<-xtabs(Emissions~type+year,data=BALT)
xt<-data.frame(xt)

png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")         
library(ggplot2)                  
g<-ggplot(xt,aes(year,Freq))
g+geom_point()+facet_grid(.~type)+geom_smooth(method="lm",aes(group = 1))

dev.off()