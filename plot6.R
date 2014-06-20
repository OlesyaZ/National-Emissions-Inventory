setwd("~/Documents/Olesya/Exploratory Data Analys /National-Emissions-Inventory")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BALT <-NEI[(NEI$fips=="24510"),]
LOS <-NEI[(NEI$fips=="06037"),]
## for Baltimore City
year <- unique(NEI$year)
xt<-xtabs(Emissions~type+year,data=BALT)
xt<-data.frame(xt)
onroad<-xt[(xt$type=="ON-ROAD"),]
## for Los Angeles

xtl<-xtabs(Emissions~type+year,data=LOS)
xtl<-data.frame(xtl)
onroadl<-xtl[(xtl$type=="ON-ROAD"),]

png(filename = "plot5.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")                           
yrange<-range(0:5000)
plot(year,onroad$Freq, ylim=yrange,ylab = "Emission",main="Emissions from motor vehicle sources in Baltimore City and Los Angeles")
model<-lm(onroad$Freq~year)
abline(model,lwd=2,col="black")
par(new=T)
plot(year,onroadl$Freq,col="red",ylab = "", xlab="",ylim=yrange)
model2<-lm(onroadl$Freq~year)
abline(model2,lwd=2,col="red")
legend(x = "topright",
       c("Baltimore City", "Los Angeles"),   
       lty=c(1, 1),   
       lwd=c(2.5, 2.5),
       col=c("black", "red"),
       bty="n")  

dev.off()