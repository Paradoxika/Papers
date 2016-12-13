#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#tptpLUbwData = read.csv("cade-folu.txt")
#tptpRPIbwData = read.csv("cade-forpi.txt")
#tptpLURPIbwData = read.csv("cade-folurpi.txt")
#tptpRPILUbwData = read.csv("cade-forpilu.txt")




lineUpPoints <- function(xLabels, dataPoints) {
    out <- c(1:length(dataPoints))
    for(i in c(1:length(dataPoints))){
        out[i] = which(xLabels == dataPoints[i])
    }
    out
}


#compression res vs. proof length (ALL)
makeBoxWhiskerRes <- function(alldata, fileName){
    compressedOnlyData <- subset(alldata, compressRatioRes > 0, select=proof:compressSpeedRes)

    

    pdf(fileName, height=5, width=5)
    par(mar=c(5.1,4.1,1,2.1))
    lengthsRaw <- alldata[,"length"]
    lengths <- unique(alldata[,"length"])  
	numLengths <- length(lengths) 
  

    sortedLengths <- sort(lengths)


    byLength <- with(compressedOnlyData, reorder(compressRatioRes, length))


    boxplot(compressRatioRes ~ length, alldata, range=0, axes=FALSE, xlab="Proof Length Before Compression", ylab="Compression Ratio (Resolutions)",xlim = c(1, numLengths))


	lengthsunique <- unique(compressedOnlyData[,"length"])
    axis(1, at=c(1:numLengths), labels=sortedLengths , cex.axis=0.75, las=2)
    axis(2, at=seq(0,0.25, by =0.05), labels=seq(0,0.25, by =0.05) , las=2)
    compressedlengths <- compressedOnlyData[,"length"]

    compressedResRatios <- compressedOnlyData[,"compressRatioRes"]
    uncompressedResRatios <- alldata[,"compressRatioRes"]

    means <- tapply(uncompressedResRatios,lengthsRaw,mean)
    points(means,col="red",pch=4)
    
    compressedMeans <- tapply(compressedResRatios , compressedlengths, mean)

    sortedUniqueCompressedLengths <- sort(unique(compressedlengths))
    compressedMeansXVals <- lineUpPoints(sortedLengths, sortedUniqueCompressedLengths)
	points(compressedMeansXVals, compressedMeans ,col="blue",pch=1)

    legend("topright",c("Mean","Mean (Compressed Only)"), pch=c(4,1), col=c("red", "blue"), bty="n")
    dev.off()
}

makeBoxWhiskerRes(tptpLUbwData,'tptp-folu-compress_ratio_res_vs_proof_length.pdf')
makeBoxWhiskerRes(tptpRPIbwData,'tptp-forpi-compress_ratio_res_vs_proof_length.pdf')
makeBoxWhiskerRes(tptpLURPIbwData,'tptp-folurpi-compress_ratio_res_vs_proof_length.pdf')
makeBoxWhiskerRes(tptpRPILUbwData,'tptp-forpilu-compress_ratio_res_vs_proof_length.pdf')