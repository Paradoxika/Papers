#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#rpiNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpi-nc.txt")
#luNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folu-nc.txt")
#lurpiNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi-nc.txt")
#rpiluNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu-nc.txt")
#allNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-all-nc.txt")
#allNCdataSepRaw = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-all-nc-sep.txt")


makeStackedChart <- function(alldata, fileName) {
    par(lty = 0) 

    betterData <- subset(alldata, select=length:total) 
    numCompressedVect <- betterData[,"numCompressed"]

    lengths <-betterData[,"length"]
    spaceV <- rep(1,27)


    numNotCompressedVect <- betterData[,"numNotCompressed"]


    compressedVnot <- rbind("Compressed"=numCompressedVect, "Not Compressed"=numNotCompressedVect )
    pdf(fileName, height=5, width=5)
    par(mar=c(5.1,4.1,1,2.1))

    a<-barplot(compressedVnot  , border=NA, 
        xlab="Proof Length Before Compression", ylab="Number of Proofs", names.arg=lengths,xaxt="n",las=2, space=spaceV, ylim=c(0,35),  col=c("black", "grey"))
        
    legend("topright", legend = rownames(compressedVnot ), fill=c("black", "grey"), bty="n", border="white" )
    axis(1, at=a, lengths, las=2,cex.axis=0.75)
    dev.off()
}

makeStackedChart(rpiNCdata, 'tptp-forpi-num_compressed_stacked.pdf')
makeStackedChart(luNCdata, 'tptp-folu-num_compressed_stacked.pdf')
makeStackedChart(lurpiNCdata, 'tptp-folurpi-num_compressed_stacked.pdf')
makeStackedChart(rpiluNCdata, 'tptp-forpilu-num_compressed_stacked.pdf')
makeStackedChart(allNCdata, 'tptp-all-num_compressed_stacked.pdf')

#make the combined stacked chart
#tptp
par(lty = 0) 

allNCdataSep <- subset(allNCdataSepRaw, select=length:total) 
numRPILUCompressedVect <- allNCdataSep[,"numCompressedforpilu"]
numLURPICompressedVect <- allNCdataSep[,"numCompressedfolurpi"]
numLUCompressedVect <- allNCdataSep[,"numCompressedfolu"]
numRPICompressedVect <- allNCdataSep[,"numCompressedforpi"]
numNonUniqueCompressedVect <- allNCdataSep[,"numCompressedNonUnique"]
numAllCompressedVect <- allNCdataSep[,"numCompressedByAll"]


lengths <-allNCdataSep[,"length"]
spaceV <- rep(1,27)


numNotCompressedVect <- allNCdataSep[,"numNotCompressed"]

allfileName <- 'tptp-all-num_compressed_stacked-sep.pdf'
compressedVnot <- rbind("FORPI(FOLU(p)) Only"=numRPILUCompressedVect, "FOLU(FORPI(p)) Only"=numLURPICompressedVect, "RPI(p) Only"=numRPICompressedVect,"LU(p) Only"=numLUCompressedVect,"2-3 options"=numNonUniqueCompressedVect, "All 4"=numAllCompressedVect,"Not Compressed"=numNotCompressedVect )
pdf(allfileName, height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

colVect <- c("orange", "red", "blue", "purple", "yellow", "green", "grey")

a<-barplot(compressedVnot  , border=NA, 
    xlab="Proof Length Before Compression", ylab="Number of Proofs", names.arg=lengths,xaxt="n",las=2, space=spaceV, ylim=c(0,35),  col=colVect)
    
legend("topright", legend = rownames(compressedVnot ), fill=colVect, bty="n", border="white" )
axis(1, at=a, lengths, las=2,cex.axis=0.75)
dev.off()