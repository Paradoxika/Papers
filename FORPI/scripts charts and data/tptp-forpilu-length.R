#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#Note: looks like a straight line because we often just swap a resolution for a contraction

#get RPILU-only data
#alldataRPILU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu.txt")
alldataRPILU[1:10,]
dataRPILU <- subset(alldataRPILU, select=proof:numFOSub)
dataRPILU[1:10,]
num <- length(dataRPILU)
num 
compressedLengthRPILU <- dataRPILU[,"compressedLengthAll"]
numFOSubsRPILU <- dataRPILU[,"numFOSub"]

compressedLengthRPILUFinal <- (compressedLengthRPILU  - numFOSubsRPILU )

axisLimitX = max(unique(dataRPILU[,"compressedLengthAll"])) + 1
axisLimitY = max(unique(dataRPILU[,"length"])) + 1
axisLimit = max(axisLimitX, axisLimitY)

pdf('tptp-forpilu-length-vs-compress-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(dataRPILU[,"length"],compressedLengthRPILUFinal ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length", ylab="Compressed Length",yaxs="i", xaxs="i")

abline(0,1)
lengths <- sort(unique(dataRPILU[,"length"]))
ylabelsV = seq(0,axisLimit, by =2)
axis(1, at=ylabelsV , seq(0,axisLimit, by =2), las=2)
ylabelsV = seq(0,axisLimit, by =2)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=axisLimit)

dev.off()