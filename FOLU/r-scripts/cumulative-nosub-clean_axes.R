alldata = read.csv("results-feb18_all_cumulative.csv")

alldata[1:10,]



widths <- rep(200, proofIndices)
widths 





#linear, top 100
pdf('cumulative_res_nodes_no_subs_top100.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))
cumulativeLengthData <- tail(alldata[,"cumulativeLength"],100)
proofIndices <- length(cumulativeLengthData )
proofIndices 
xaxislabels <- c(1:proofIndices)
cumulativeCompressedLengthData <- tail(alldata[,"cumulativeLengthCompressed"],100)

cumulativeLengthDataDiff <- (cumulativeLengthData -cumulativeCompressedLengthData )

compressedVdiff <- rbind("Compressed"=cumulativeCompressedLengthData , "Not Compressed"=cumulativeLengthDataDiff)

par(lty = 0) 

widths <- rep(200, proofIndices)
widths 
a<-barplot(compressedVdiff , pch=1, ylim=c(0,4500), width=widths,
  axes=FALSE, space = 0, xlab="Number of Proofs (sorted by input length)", ylab="Cumulative Proof Length", 
  legend = c("Compressed Proof Length","Original Proof Length"), args.legend=list(x="topleft"), col=c("grey","black"))
a
b <- c(100, a[seq(0, length(a), 10)])
b
c <- c(208, xaxislabels [seq(0, length(xaxislabels), 10)] + 208)
axis(2, at=seq(0,4500, by =500), labels=seq(0,4500, by =500)  , las=2)
axis(1, at=b, labels=c  , las=2)
dev.off()



