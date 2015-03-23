alldata[1:10,]
alldata = read.csv("results-feb15_all.csv")



#compression ratio res vs. proof length (ALL)
compressedOnlyData <- subset(alldata, compressRatioRes > -1, select=proof:compressSpeedRes)
compressedOnlyData[1:10,]
num <- length(compressedOnlyData)
num 
compressRatio <- compressedOnlyData[,"compressRatio"]
compressRatio 
pdf('compress_ratio_res_vs_proof_length_all_proofs.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))
boxplot(compressRatioRes ~ length, compressedOnlyData,range=0, axes=FALSE, xlab="Proof Length Before Compression", ylab="Compression Ratio")
lengths <- unique(compressedOnlyData[,"length"])
lengthsunique <- unique(compressedOnlyData[,"length"])
axis(1, at=c(1:37), labels=lengths , cex.axis=0.75, las=2)
axis(2, at=seq(0,0.25, by =0.05), labels=seq(0,0.25, by =0.05) , las=2)
lengths <- compressedOnlyData[,"length"]
compressRatioRes <- compressedOnlyData[,"compressRatioRes"]
compressRatioRes
means <- tapply(compressRatioRes ,lengths,mean)
points(means,col="red",pch=4)
res_only_lengths
lengthsunique 
means_c
length(lengthsunique)
length(means_c)
df<-data.frame(x=names(means_c),y=means_c)
t<-c(2,6,7,9,10,12,13,14,16,17,18,19,20,21,22,24,25,26,27,28,31,32,33,34,35,36,37)
points(t, means_c,col="blue",pch=1)

legend("topright",c("Mean","Mean (Compressed Only)"), pch=c(4,1), col=c("red", "blue"), bty="n")
dev.off()