alldata = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/Paper Writing Tools/r scripts/results-feb15_all_cumulative.csv")
alldata[1:10,]
setwd("C:/Users/Jan/Documents/Google Summer of Code 2014/Paper Writing Tools/r scripts/")


#pdf('cumulative_res_nodes.pdf')

cumulativeLengthResData <- alldata[,"cumulativeLengthRes"]
proofIndices <- length(cumulativeLengthResData)
proofIndices 
xaxislabels <- c(1:proofIndices)
#plot(xaxislabels ,cumulativeLengthResData, pch=1, ylim=c(0,2100))
cumulativeCompressedLengthResData <- alldata[,"cumulativeCompressedLengthRes"]

cumulativeLengthResDataDiff <- (cumulativeLengthResData -cumulativeCompressedLengthResData )

compressedVdiff <- rbind("Compressed"=cumulativeCompressedLengthResData , "Not Compressed"=cumulativeLengthResDataDiff)

#par(lty = 0, pin=c(5,2)) 
par(lty = 0) 

widths <- rep(200, proofIndices)
widths 
#names.arg=xaxislabels 
a<-barplot(compressedVdiff , pch=1, ylim=c(0,2100), width=widths,
  axes=FALSE, space = 0, xlab="Proof (sorted by input resolution length)", ylab="Cumulative Proof Length (Resolution Nodes)", 
  main="Cumulative Number of Resolution Proof Nodes", 
  legend = c("Compressed Proof Length (Resolutions)","Original Proof Length (Resolutions)"), args.legend=list(x="topleft"))
a
b <- a[seq(0, length(a), 15)]

c <- xaxislabels [seq(0, length(xaxislabels), 15)]
axis(2, at=seq(0,2100, by =250), labels=seq(0,2100, by =250)  , las=2)
axis(1, at=b, labels=c  , las=2)
#c
#dev.off()
