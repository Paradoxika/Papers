

data = read.csv("3-1--11-3.csv")
data[1:3,]

filteredData <- subset(data, NDcLength > -1, select=Goal:NDcCore)
filteredData[1:3,]

scatter <- function(file, x, y, xlabel, ylabel, xmax, ymax){
  pdf('LengthScatter.pdf')
  print(plot(x, y, xlab=xlabel, ylab=ylabel, xlim=c(0,xmax), ylim=c(0,ymax), xaxs="i", yaxs="i"))
  abline(0,1)
  abline(h=xmax)
  abline(v=ymax)
  abline(v=0)
  abline(h=0)
  axis(1, at=c(0:xmax), labels=c(0:xmax), las=2)
  axis(2, at=c(0:ymax), labels=c(0:ymax), las=2)
  dev.off()
  return 0
}

scatter("CoreScatter.pdf", filteredData[,"NDCore"], filteredData[,"NDcCore"], "bla", "bli", 10, 10)

# Length Scatter

pdf('LengthScatter.pdf')
plot(NDcLength ~ NDLength, filteredData, axes=FALSE, xlab="ND Length", ylab="NDc Length", main = "Length", xlim=c(0,20), ylim=c(0,20), xaxs="i", yaxs="i")
abline(0,1)
abline(h=20)
abline(v=20)
abline(v=0)
abline(h=0)
axis(1, at=c(0:20), labels=c(0:20), las=2)
ylabelsV = seq(0,20, by =1)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
dev.off()


# Height Scatter

pdf('HeightScatter.pdf')
plot(NDcHeight ~ NDHeight, filteredData, axes=FALSE, xlab="ND Height", ylab="NDc Height", main = "Height", xlim=c(0,15), ylim=c(0,15), xaxs="i", yaxs="i",col=rgb(0,100,0,50,maxColorValue=255), pch=16)
abline(0,1)
abline(h=15)
abline(v=15)
abline(v=0)
abline(h=0)
axis(1, at=c(0:15), labels=c(0:15), las=2)
ylabelsV = seq(0,15, by =1)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
dev.off()


# High Density Scatterplot with Binning

pdf('HexBins.pdf')
library(hexbin) x <- rnorm(1000) y <- rnorm(1000) bin<-hexbin(x, y, xbins=50)  plot(bin, main="Hexagonal Binning")
dev.off()

pdf('HexBins.pdf')
library(hexbin)
nd <- subset(filteredData,select=NDLength)
ndc <- subset(filteredData,select=NDcLength)
bin<-hexbin(nd, ndc, ndbins=2) 
plot(bin, main="Hexagonal Binning")
dev.off()
