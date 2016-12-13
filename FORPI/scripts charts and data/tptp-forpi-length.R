#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#Note: looks like a straight line because we often just swap a resolution for a contraction

#get RPI-only data
#alldataRPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpi.txt")
alldataRPI[1:10,]
dataRPI <- subset(alldataRPI, select=proof:numFOSub)
dataRPI[1:10,]
num <- length(dataRPI)
num 
compressedLengthRPI <- dataRPI[,"compressedLengthAll"]
numFOSubsRPI <- dataRPI[,"numFOSub"]

compressedLengthRPIFinal <- (compressedLengthRPI  - numFOSubsRPI )

axisLimitX = max(unique(dataRPI[,"compressedLengthAll"])) + 1
axisLimitY = max(unique(dataRPI[,"length"])) + 1
axisLimit = max(axisLimitX, axisLimitY)

pdf('tptp-forpi-length-vs-compress-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(dataRPI[,"length"],compressedLengthRPIFinal ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length", ylab="Compressed Length",yaxs="i", xaxs="i")

abline(0,1)
lengths <- sort(unique(dataRPI[,"length"]))
ylabelsV = seq(0,axisLimit, by =2)
axis(1, at=ylabelsV , seq(0,axisLimit, by =2), las=2)
ylabelsV = seq(0,axisLimit, by =2)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=axisLimit)

dev.off()