
alldata = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/Paper Writing Tools/r scripts/results-feb15_all.csv")
alldata[1:10,]
boxplot(compressTime ~ length, data = alldata)
setwd("C:/Users/Jan/Documents/Google Summer of Code 2014/Paper Writing Tools/r scripts/")

#compression time vs. proof length
compressedOnlyData <- subset(alldata, compressRatioRes > 0, select=proof:compressSpeedRes)
compressedOnlyData[1:10,]
num <- length(compressedOnlyData)
num 
compressTimeReadable <- format(compressedOnlyData[,"compressTime"], scientific=FALSE)
compressTimeMS <- (compressedOnlyData[,"compressTime"]/(10^6))
compressTimeMS 
lengths <- compressedOnlyData[,"length"]
lengths 
lengthsUnique <- unique(compressedOnlyData[,"length"])
pdf('compress_time_vs_proof_length.pdf')
boxplot(compressTimeMS ~ length, compressedOnlyData, axes=FALSE, xlab="Proof Length", ylab="Compression Time (ms)", main = "Compression Time vs. Proof Length")
axis(1, at=c(1:27), labels=lengthsUnique, las=2,cex.axis=0.8)
axis(2, at=seq(0,250, by =25), labels=seq(0,250, by =25) , las=2)
lengths <- compressedOnlyData[,"length"]
means <- tapply(compressTimeMS,lengths,mean)
points(means,col="red",pch=4)
legend("topleft",c("Mean"), pch=c(4), col=c("red"))
dev.off()

#compression time vs. proof length (res)
compressedOnlyData <- subset(alldata, compressRatioRes > 0, select=proof:compressSpeedRes)
compressedOnlyData[1:10,]
num <- length(compressedOnlyData)
num 
compressTimeReadable <- format(compressedOnlyData[,"compressTime"], scientific=FALSE)
compressTimeMS <- (compressedOnlyData[,"compressTime"]/(10^6))
compressTimeMS 
pdf('compress_time_vs_proof_length_res.pdf')
boxplot(compressTimeMS ~ resOnlyLength, compressedOnlyData, axes=FALSE,  xlab="Proof Length (Resolutions)", ylab="Compression Time (ms)", main = "Compression Time vs. Proof Length (Resolutions)")
reslengths <- sort(unique(compressedOnlyData[,"resOnlyLength"]))
reslengths 
reslengthsunique <- sort(unique(compressedOnlyData[,"resOnlyLength"]))
compressedOnlyData[,"resOnlyLength"]
axis(1, at=c(1:22), labels=reslengths , las=2)
axis(2, at=seq(0,250, by =25), labels=seq(0,250, by =25) , las=2)
lengths <- compressedOnlyData[,"resOnlyLength"]
lengths 
means <- tapply(compressTimeMS,lengths ,mean)
points(means,col="red",pch=4)
legend("topleft",c("Mean"), pch=c(4), col=c("red"))
dev.off()



#compression ratio vs. proof length
compressedOnlyData <- subset(alldata, compressRatioRes > 0, select=proof:compressSpeedRes)
compressedOnlyData[1:10,]
num <- length(compressedOnlyData)
num 
compressRatio <- compressedOnlyData[,"compressRatio"]
compressRatio 
pdf('compress_ratio_vs_proof_length.pdf')
boxplot(compressRatio ~ length, compressedOnlyData, axes=FALSE, xlab="Proof Length", ylab="Compression Ratio", main = "Compression Ratio vs. Proof Length")
lengths <- unique(compressedOnlyData[,"length"])
axis(1, at=c(1:27), labels=lengths, las=2)
axis(2, at=seq(0,-0.5, by =-0.1), labels=seq(0,-0.5, by =-0.1) , las=2)
lengths <- compressedOnlyData[,"length"]
means <- tapply(compressRatio ,lengths,mean)
points(means,col="red",pch=4)
legend("topright",c("Mean"), pch=c(4), col=c("red"))
dev.off()


#compression ratio res vs. proof length res
compressedOnlyData <- subset(alldata, compressRatioRes > 0, select=proof:compressSpeedRes)
compressedOnlyData[1:10,]
num <- length(compressedOnlyData)
num 
compressRatio <- compressedOnlyData[,"compressRatio"]
compressRatio 
pdf('compress_ratio_res_vs_proof_length_res.pdf')
boxplot(compressRatioRes ~ resOnlyLength, compressedOnlyData, axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compression Ratio (Resolutions)", main = "Compression Ratio vs. Proof Length (Resolutions)")
reslengths <- sort(unique(compressedOnlyData[,"resOnlyLength"]))
axis(1, at=c(1:22), labels=reslengths , las=2)
axis(2, at=seq(0,0.25, by =0.05), labels=seq(0,0.25, by =0.05) , las=2)
lengths <- compressedOnlyData[,"resOnlyLength"]
lengths
compressRatioResB <- compressedOnlyData[,"compressRatioRes"]
compressRatioResB 
means <- tapply(compressRatioResB ,lengths ,mean)
points(means,col="red",pch=4)
legend("topright",c("Mean"), pch=c(4), col=c("red"))
dev.off()

#compression ratio res vs. proof length
compressedOnlyData <- subset(alldata, compressRatioRes > 0, select=proof:compressSpeedRes)
compressedOnlyData[1:10,]
num <- length(compressedOnlyData)
num 
compressRatio <- compressedOnlyData[,"compressRatio"]
compressRatio 
pdf('compress_ratio_res_vs_proof_length.pdf', height=5, width=5)
boxplot(compressRatioRes ~ length, compressedOnlyData, axes=FALSE, xlab="Proof Length", ylab="Compression Ratio (Resolutions)", main = "Compression Ratio (Resolutions) vs.\n Proof Length", xaxs="i",yaxs="i")
lengths <- unique(compressedOnlyData[,"length"])
res_only_lengths <- unique(compressedOnlyData[,"length"])

zlengths <- c(0,lengths)
zlengths 
axis(1, at=c(1:27), labels=lengths , las=2)
axis(2, at=seq(0,0.25, by =0.05), labels=seq(0,0.25, by =0.05) , las=2)
lengths <- compressedOnlyData[,"length"]
lengthsB <- compressedOnlyData[,"length"]

compressRatioRes <- compressedOnlyData[,"compressRatioRes"]
compressRatioRes
means <- tapply(compressRatioRes ,lengths,mean)
means_c <- tapply(compressRatioRes ,lengths,mean)

points(means,col="red",pch=4)
legend("topright",c("Mean"), pch=c(4), col=c("red"))
dev.off()


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
#points(means_c,col="blue",pch=3)
#points(df$x, df$y,col="blue",pch=1)
t<-c(2,6,7,9,10,12,13,14,16,17,18,19,20,21,22,24,25,26,27,28,31,32,33,34,35,36,37)
points(t, means_c,col="blue",pch=1)

legend("topright",c("Mean","Mean (Compressed Only)"), pch=c(4,1), col=c("red", "blue"), bty="n")
dev.off()