alldata = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/Paper Writing Tools/r scripts/results-feb15_all.csv")
alldata[1:10,]
setwd("C:/Users/Jan/Documents/Google Summer of Code 2014/Paper Writing Tools/r scripts/")

#res length (x-axis) vs. compressed res length
compressedOnlyData <- subset(alldata, compressRatioRes > 0, select=proof:compressSpeedRes)
compressedOnlyData[1:10,]
num <- length(compressedOnlyData)
num 
compressLengthResOnly <- compressedOnlyData[,"compressedLengthResOnly"]
compressLengthResOnly 
pdf('res_length_vs_compress_res_length.pdf')
plot(compressLengthResOnly ~ resOnlyLength, compressedOnlyData, axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)", main = "Compressed Resolution Length vs.\n Proof Resolution Length", xlim=c(0,28), ylim=c(0,28), xaxs="i", yaxs="i")
abline(0,1)
abline(h=28)
abline(v=28)
abline(v=0)
abline(h=0)
lengths <- sort(unique(compressedOnlyData[,"resOnlyLength"]))
axis(1, at=c(0:29), labels=c(0:29), las=2)
ylabelsV = seq(0,29, by =1)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
dev.off()

res length (x-axis) vs. compressed res length (all)
compressedOnlyData <- subset(alldata, compressRatioRes > -1, select=proof:compressSpeedRes)
compressedOnlyData[1:10,]
num <- length(compressedOnlyData)
num 
compressLengthResOnly <- compressedOnlyData[,"compressedLengthResOnly"]
compressLengthResOnly 
pdf('res_length_vs_compress_res_length_all_proofs.pdf')
plot(compressLengthResOnly ~ resOnlyLength, compressedOnlyData, axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)", main = "Compressed Resolution Length vs.\n Proof Resolution Length\nIncluding Uncompressed Proofs")
abline(0,1)
lengths <- sort(unique(compressedOnlyData[,"resOnlyLength"]))
axis(1, at=c(0:40), labels=c(0:40), las=2)
ylabelsV = seq(0,40, by =1)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
dev.off()