#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#rpiNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-forpi-nc-data-dec1.txt")
#luNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-folu-nc-data-dec1.txt")
#lurpiNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-folurpi-nc-data-dec1.txt")
#rpiluNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-forpilu-nc-data-dec1.txt")
#allNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-nc-data-dec1.txt")
#allNCdataSepRaw = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-nc-sep-data-dec1.txt")


yAdd <- 50

makeStackedChart <- function(alldata, fileName) {
    par(lty = 0) 

    betterData <- subset(alldata, select=length:binDescription) 
    numCompressedVect <- betterData[,"numCompressed"]

    lengths <-betterData[,"length"]

    binNames <- betterData[,"binDescription"]
    numNotCompressedVect <- betterData[,"numNotCompressed"]

    totalVector <- numCompressedVect + numNotCompressedVect
    yMax <- max(totalVector) + yAdd

    compressedVnot <- rbind("Compressed"=numCompressedVect, "Not Compressed"=numNotCompressedVect )
    pdf(fileName, height=5, width=5)
    par(mar=c(5.1,4.1,1,2.1))

    a<-barplot(compressedVnot  , border=NA, 
        xlab="Proof Length Before Compression", ylab="Number of Proofs", names.arg=lengths,xaxt="n",las=2, ylim=c(0,yMax),  col=c("black", "grey"))
        
    legend("topright", legend = rownames(compressedVnot ), fill=c("black", "grey"), bty="n", border="white" )
    axis(1, at=a, binNames , las=2,cex.axis=0.75)
    dev.off()
}

makeStackedChart(rpiNCdata, 'random-forpi-num_compressed_stacked.pdf')
makeStackedChart(luNCdata, 'random-folu-num_compressed_stacked.pdf')
makeStackedChart(lurpiNCdata, 'random-folurpi-num_compressed_stacked.pdf')
makeStackedChart(rpiluNCdata, 'random-forpilu-num_compressed_stacked.pdf')

makeStackedChart(allNCdata, 'random-all-num_compressed_stacked.pdf')

#make the combined stacked chart
#random
par(lty = 0) 

allNCdataSep <- subset(allNCdataSepRaw, select=length:binDescription) 
numRPILUCompressedVect <- allNCdataSep[,"numCompressedforpilu"]
numLURPICompressedVect <- allNCdataSep[,"numCompressedfolurpi"]
numLUCompressedVect <- allNCdataSep[,"numCompressedfolu"]
numRPICompressedVect <- allNCdataSep[,"numCompressedforpi"]
numNonUniqueCompressedVect <- allNCdataSep[,"numCompressedNonUnique"]
numAllCompressedVect <- allNCdataSep[,"numCompressedByAll"]


lengths <-allNCdataSep[,"length"]

binNames <-allNCdataSep[,"binDescription"]

numNotCompressedVect <- allNCdataSep[,"numNotCompressed"]

allVectorsAdded <- numRPILUCompressedVect + numLURPICompressedVect + numLUCompressedVect + numRPICompressedVect + numNonUniqueCompressedVect + numAllCompressedVect + numNotCompressedVect
yMax <- max(allVectorsAdded) + yAdd

allfileName <- 'random-all-num_compressed_stacked-sep.pdf'
compressedVnot <- rbind("FORPI(FOLU(p)) Only"=numRPILUCompressedVect, "FOLU(FORPI(p)) Only"=numLURPICompressedVect, "RPI(p) Only"=numRPICompressedVect,"LU(p) Only"=numLUCompressedVect,"2-3 options"=numNonUniqueCompressedVect, "All 4"=numAllCompressedVect,"Not Compressed"=numNotCompressedVect )
pdf(allfileName, height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

colVect <- c("orange", "red", "blue", "purple", "yellow", "green", "grey")

a<-barplot(compressedVnot  , border=NA, 
    xlab="Proof Length Before Compression", ylab="Number of Proofs", xaxt="n",las=2, ylim=c(0,yMax),  col=colVect)
    
legend("topleft", legend = rownames(compressedVnot ), fill=colVect, bty="n", border="white" )
axis(1, at=a, binNames, las=2,cex.axis=0.75)
dev.off()