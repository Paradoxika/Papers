#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")
setwd("D:/Git Repositories/Papers/FORPI/scripts charts and data")

#allNCdataSepRaw = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/combined-all-nc-sep-data-dec1s-res.txt")
allNCdataSepRaw = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/combined-all-nc-sep-data-dec1s-res.txt")


yAdd <- 50


#make the combined stacked chart
#random+tptp
par(lty = 0) 

allNCdataSep <- subset(allNCdataSepRaw, select=length:tptpTotal) 
numRPILUCompressedVect <- allNCdataSep[,"numCompressedforpilu"]
numLURPICompressedVect <- allNCdataSep[,"numCompressedfolurpi"]
numLUCompressedVect <- allNCdataSep[,"numCompressedfolu"]
numRPICompressedVect <- allNCdataSep[,"numCompressedforpi"]
numNonUniqueCompressedVect <- allNCdataSep[,"numCompressedNonUnique"]
numAllCompressedVect <- allNCdataSep[,"numCompressedByAll"]

numRPILUCompressedVectTPTP <- allNCdataSep[,"tptpnumCompressedforpilu"]
numLURPICompressedVectTPTP <- allNCdataSep[,"tptpnumCompressedfolurpi"]
numLUCompressedVectTPTP <- allNCdataSep[,"tptpnumCompressedfolu"]
numRPICompressedVectTPTP <- allNCdataSep[,"tptpnumCompressedforpi"]
numNonUniqueCompressedVectTPTP <- allNCdataSep[,"tptpnumCompressedNonUnique"]
numAllCompressedVectTPTP <- allNCdataSep[,"tptpnumCompressedByAll"]


lengths <-allNCdataSep[,"length"]

binNames <-allNCdataSep[,"binDescription"]

numNotCompressedVect <- allNCdataSep[,"numNotCompressed"]
numNotCompressedVectTPTP <- allNCdataSep[,"tptpnumNotCompressed"]


allVectorsAdded <- numRPILUCompressedVect + numLURPICompressedVect + numLUCompressedVect + numRPICompressedVect + numNonUniqueCompressedVect + numAllCompressedVect + numNotCompressedVect
allVectorsAddedTPTP <- numRPILUCompressedVectTPTP + numLURPICompressedVectTPTP + numLUCompressedVectTPTP + numRPICompressedVectTPTP + numNonUniqueCompressedVectTPTP + numAllCompressedVectTPTP + numNotCompressedVectTPTP
everythingAdded <- allVectorsAdded + allVectorsAddedTPTP
yMax <- max(everythingAdded) + yAdd

allfileName <- 'combined-all-num_compressed_stacked.pdf'
compressedVnot <- rbind("Compressed (Random)"=numNonUniqueCompressedVect, "Always Compressed (Random)"=numAllCompressedVect, "Compressed (TPTP)"=numNonUniqueCompressedVectTPTP, "Always Compressed (TPTP)"=numAllCompressedVectTPTP, "Not Compressed (Random)"=numNotCompressedVect, "Not Compressed (TPTP)"=numNotCompressedVectTPTP  )
pdf(allfileName, height=6, width=6)
par(mar=c(5.1,5.1,1,2.1))

colVect <- c("springgreen", "springgreen4", "palevioletred", "palevioletred3", "slategray2", "slategray3")

a<-barplot(compressedVnot  , border=NA, 
    xlab="", ylab="Number of Proofs", xaxt="n",las=2,axes=FALSE, ylim=c(0,yMax),  col=colVect)

firstOffset <- c(50, 15, rep.int(0, 12))
percentPos <- compressedVnot[1,]+compressedVnot[2,]+30 + firstOffset 
library('scales')

totalNumProofs <- compressedVnot[1,] + compressedVnot[2,] + compressedVnot[3,] + compressedVnot[4,] + compressedVnot[5,] + compressedVnot[6,]
percentLabels <- percent(1 - (compressedVnot[5,] + compressedVnot[6,])/totalNumProofs )
text(a,percentPos ,labels=percentLabels ,cex=.8,srt = 90)

mtext("Proof Length Before Compression (Resolutions)", side=1,line=3.5)
legend("topleft", legend = rownames(compressedVnot ), fill=colVect, bty="n", border="white",cex=0.75)
axis(1, at=a, binNames, las=2,cex.axis=0.75)
axis(2, at=seq(0,425, by=25), seq(0,425,by=25), las=2)

dev.off()