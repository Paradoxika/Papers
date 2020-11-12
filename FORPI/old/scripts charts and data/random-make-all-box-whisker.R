#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")
setwd("D:/Git Repositories/Papers/FORPI/scripts charts and data")

allRandomDataBW = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/random-all-bw-data-dec1s.txt")


lineUpPoints <- function(xLabels, dataPoints) {
    out <- c(1:length(dataPoints))
    for(i in c(1:length(dataPoints))){
        out[i] = which(xLabels == dataPoints[i])
    }
    out
}


#compression res vs. proof length (ALL)
makeBoxWhiskerRes <- function(alldata, fileName, lenCol, ratioCol){

    #necessary because we can't use variables in the subset call....
    if(identical(ratioCol,'luCompResRatio')){
    compressedOnlyData <- subset(alldata, luCompResRatio > 0.0)
    } else if (identical(ratioCol, 'rpiCompResRatio')){
    compressedOnlyData <- subset(alldata, rpiCompResRatio > 0.0)
    } else if (identical(ratioCol, 'rpiluCompResRatio')){
    compressedOnlyData <- subset(alldata, rpiluCompResRatio > 0.0)
    } else if (identical(ratioCol, 'lurpiCompResRatio')){
    compressedOnlyData <- subset(alldata, lurpiCompResRatio > 0.0)
    }
    binNames <- sort(unique(alldata[,'binDescription']))

    pdf(fileName, height=6, width=6)
    par(mar=c(5.1,5.1,1,2.1))
    lengthsRaw <- alldata[,lenCol]
    lengths <- unique(alldata[,lenCol])  
	numLengths <- length(lengths) 
  

    sortedLengths <- sort(lengths)
  
	compressedResRatios <- alldata[,ratioCol]
	yMax <- max(max(unique(compressedResRatios)),0.25)

    boxplot(compressedResRatios ~ lengthsRaw, alldata, range=0, axes=FALSE, xlab="", ylab="Compression Ratio (Resolutions)",xlim = c(1, numLengths), ylim=c(0,yMax))
	mtext("Proof Length Before Compression", side=1, line=3.5)

	lengthsunique <- unique(compressedOnlyData[,lenCol])
    axis(1, at=c(1:numLengths), labels=binNames , cex.axis=0.75, las=2)
    axis(2, at=seq(0,yMax, by =0.05), labels=seq(0,yMax, by =0.05) , las=2)
    compressedlengths <- compressedOnlyData[,lenCol]

    compressedResRatios <- compressedOnlyData[,ratioCol]


    uncompressedResRatios <- alldata[,ratioCol]

    means <- tapply(uncompressedResRatios,lengthsRaw,mean)
    points(means,col="red",pch=4)
    
    compressedMeans <- tapply(compressedResRatios , compressedlengths, mean)

    sortedUniqueCompressedLengths <- sort(unique(compressedlengths))
    compressedMeansXVals <- lineUpPoints(sortedLengths, sortedUniqueCompressedLengths)
    points(compressedMeansXVals, compressedMeans ,col="blue",pch=1)

    legend("topright",c("Mean","Mean (Compressed Only)"), pch=c(4,1), col=c("red", "blue"), bty="n")
    dev.off()
}

makeBoxWhiskerRes(allRandomDataBW,'random-folu-compress_ratio_res_vs_proof_res_length.pdf','bin','luCompResRatio')
makeBoxWhiskerRes(allRandomDataBW,'final-random-forpi-compress_ratio_res_vs_proof_res_length.pdf','bin','rpiCompResRatio')
makeBoxWhiskerRes(allRandomDataBW,'random-folurpi-compress_ratio_res_vs_proof_res_length.pdf','bin','lurpiCompResRatio')
makeBoxWhiskerRes(allRandomDataBW,'random-forpilu-compress_ratio_res_vs_proof_res_length.pdf','bin','rpiluCompResRatio')