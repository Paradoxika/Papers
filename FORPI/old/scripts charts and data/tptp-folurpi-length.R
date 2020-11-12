#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#Note: looks like a straight line because we often just swap a resolution for a contraction

#get LURPI-only data
#alldataLURPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi.txt")
alldataLURPI[1:10,]
dataLURPI <- subset(alldataLURPI, select=proof:numFOSub)
dataLURPI[1:10,]
num <- length(dataLURPI)
num 
compressedLengthLURPI <- dataLURPI[,"compressedLengthAll"]
numFOSubsLURPI <- dataLURPI[,"numFOSub"]

compressedLengthLURPIFinal <- (compressedLengthLURPI  - numFOSubsLURPI )

axisLimitX = max(unique(dataLURPI[,"compressedLengthAll"])) + 1
axisLimitY = max(unique(dataLURPI[,"length"])) + 1
axisLimit = max(axisLimitX, axisLimitY)

pdf('tptp-folurpi-length-vs-compress-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(dataLURPI[,"length"],compressedLengthLURPIFinal ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length", ylab="Compressed Length",yaxs="i", xaxs="i")

abline(0,1)
lengths <- sort(unique(dataLURPI[,"length"]))
ylabelsV = seq(0,axisLimit, by =2)
axis(1, at=ylabelsV , seq(0,axisLimit, by =2), las=2)
ylabelsV = seq(0,axisLimit, by =2)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=axisLimit)

dev.off()