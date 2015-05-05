alldata = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/Paper Writing Tools/r scripts/results-feb18_all_cumulative.csv")
alldata[1:10,]
setwd("C:/Users/Jan/Documents/Google Summer of Code 2014/Paper Writing Tools/r scripts/")


pdf('cumulative_res_nodes_no_subs.pdf')

cumulativeLengthData <- alldata[,"cumulativeLength"]
proofIndices <- length(cumulativeLengthData )
proofIndices 
xaxislabels <- c(1:proofIndices)
#plot(xaxislabels ,cumulativeLengthData , pch=1, ylim=c(0,2100))
cumulativeCompressedLengthData <- alldata[,"cumulativeLengthCompressed"]

cumulativeLengthDataDiff <- (cumulativeLengthData -cumulativeCompressedLengthData )

compressedVdiff <- rbind("Compressed"=cumulativeCompressedLengthData , "Not Compressed"=cumulativeLengthDataDiff)

#par(lty = 0, pin=c(5,2)) 
par(lty = 0) 

widths <- rep(200, proofIndices)
widths 
#names.arg=xaxislabels 
a<-barplot(compressedVdiff ,xaxislabels , pch=1, ylim=c(0,4500), width=widths,
  axes=FALSE, space = 0, xlab="Proof (sorted by input length)", ylab="Cumulative Proof Length", 
  main="Cumulative Number of Proof Nodes", 
  legend = c("Compressed Proof Length (No FOSubs)","Original Proof Length"), args.legend=list(x="topleft"))
a
b <- a[seq(1, length(a), 10)]
#c <- xaxislabels [seq(1, length(xaxislabels), 10)]
axis(2, at=seq(0,4500, by =250), labels=seq(0,4500, by =250)  , las=2)
#axis(1, at=b, labels=c  , las=2)
#c
dev.off()




#linear, top 100
pdf('cumulative_res_nodes_no_subs_top100.pdf')

cumulativeLengthData <- tail(alldata[,"cumulativeLength"],100)
proofIndices <- length(cumulativeLengthData )
proofIndices 
xaxislabels <- c(1:proofIndices)
#plot(xaxislabels ,cumulativeLengthData , pch=1, ylim=c(0,2100))
cumulativeCompressedLengthData <- tail(alldata[,"cumulativeLengthCompressed"],100)

cumulativeLengthDataDiff <- (cumulativeLengthData - cumulativeCompressedLengthData )

compressedVdiff <- rbind("Compressed"=cumulativeCompressedLengthData , "Not Compressed"=cumulativeLengthDataDiff)

#par(lty = 0, pin=c(5,2)) 
par(lty = 0) 

widths <- rep(200, proofIndices)
widths 
#names.arg=xaxislabels 
a<-barplot(compressedVdiff ,xaxislabels , pch=1, ylim=c(0,4500), width=widths,
  axes=FALSE, space = 0, xlab="Proof (sorted by input length)", ylab="Cumulative Proof Length", 
  main="Cumulative Number of Proof Nodes", 
  legend = c("Compressed Proof Length (No FOSubs)","Original Proof Length"), args.legend=list(x="topleft"))
a
b <- a[seq(1, length(a), 10)]
#c <- xaxislabels [seq(1, length(xaxislabels), 10)]
axis(2, at=seq(0,4500, by =250), labels=seq(0,4500, by =250)  , las=2)
#axis(1, at=b, labels=c  , las=2)
#c
dev.off()






#log variant, all
#pdf('cumulative_res_nodes_no_subs_log.pdf')

cumulativeLengthData <- alldata[,"cumulativeLength"]
proofIndices <- length(cumulativeLengthData )
proofIndices 
xaxislabels <- c(1:proofIndices)
#plot(xaxislabels ,cumulativeLengthData , pch=1, ylim=c(0,2100))
cumulativeCompressedLengthData <- alldata[,"cumulativeLengthCompressed"]

cumulativeLengthDataDiff <- (cumulativeLengthData -cumulativeCompressedLengthData )
cumulativeCompressedLengthDataLog <- log(cumulativeCompressedLengthData )
cumulativeLengthDataDiffLog<-log(cumulativeLengthDataDiff)

shortHeight <- cumulativeCompressedLengthData 
tallHeight <- cumulativeCompressedLengthData + cumulativeLengthDataDiff 
shortHeight 
tallHeight 

shortLog <- log(shortHeight)
tallLog <- log(tallHeight)
shortLog
tallLog
logDiff <- tallLog-shortLog
logDiff 

cumulativeCompressedLengthDataLog 
cumulativeLengthDataDiff
cumulativeLengthDataDiffLog

compressedVdiff <- rbind("Compressed"=cumulativeCompressedLengthData , "Not Compressed"=cumulativeLengthDataDiff)
compressedVdiffLog <- rbind("Compressed"=cumulativeCompressedLengthDataLog , "Not Compressed"=cumulativeLengthDataDiffLog)
compressedVdiffLog 

compressedVdiffLogB <- rbind("Compressed"=shortLog, "Not Compressed"=logDiff )
compressedVdiffLogB 

emptyNames <- rep(" ", proofIndices)
emptyNames 

#par(lty = 0, pin=c(5,2)) 
par(lty = 0) 

widths <- rep(200, proofIndices)
widths 
#names.arg=xaxislabels 
a<-barplot(compressedVdiffLogB ,xaxislabels , pch=1, width=widths,
  axes=FALSE, space = 0, xlab="Proof (sorted by input length)", ylab="Cumulative Proof Length", 
  main="Cumulative Number of Proof Nodes", 
  legend = c("Compressed Proof Length (No FOSubs)","Original Proof Length"), args.legend=list(x="topleft"))
a
b <- a[seq(1, length(a), 10)]
xaxislabels
#c <- xaxislabels [seq(1, length(xaxislabels), 10)]
axis(2, at=seq(0,9, by =0.5), labels=seq(0,9, by =0.5)  , las=2)
#axis(1, at=b, labels=c  , las=2)
#c
#dev.off()

