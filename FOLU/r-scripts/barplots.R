alldata = read.csv("numCompressedB.txt")

alldata[1:10,]

par(lty = 0) 

betterData <- subset(alldata, select=length:total)
betterData 
numCompressedVect <- betterData[,"numCompressed"]
numCompressedVect 

lengths <-betterData[,"length"]
lengths 
spaceV <- rep(1,27)
spaceV 


numNotCompressedVect <- betterData[,"numNotCompressed"]
numNotCompressedVect 
numCompressedVect
length(numCompressedVect)
length(numNotCompressedVect )

betterData 
compressedVnot <- rbind("Compressed"=numCompressedVect, "Not Compressed"=numNotCompressedVect )
compressedVnot 
pdf('num_compressed_stacked.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

a<-barplot(compressedVnot  , border=NA, 
  	xlab="Proof Length Before Compression", ylab="Number of Proofs", names.arg=lengths,xaxt="n",las=2, space=spaceV, ylim=c(0,35),  col=c("black", "grey"))
a
legend("topright", legend = rownames(compressedVnot ), fill=c("black", "grey"), bty="n", border="white" )
axis(1, at=a, lengths, las=2,cex.axis=0.75)
dev.off()
