#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#get RPILU-only data
#alldataRPILU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu.txt")
alldataRPILU[1:10,]
dataRPILU <- subset(alldataRPILU, select=proof:numFOSub)
dataRPILU[1:10,]
num <- length(dataRPILU)
num 
compressedLengthResOnlyRPILU <- dataRPILU[,"compressedLengthResOnly"]
compressedLengthResOnlyRPILU 
initialResLengthsRPILU <- dataRPILU[,"resOnlyLength"]

axisLimit = max(unique(dataRPILU[,"resOnlyLength"])) + 1
axisLimit 

pdf('tptp-forpilu-res-length-vs-compress-res-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(dataRPILU[,"resOnlyLength"],compressedLengthResOnlyRPILU ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)",yaxs="i", xaxs="i")

abline(0,1)
lengths <- sort(unique(dataRPILU[,"resOnlyLength"]))
ylabelsV = seq(0,axisLimit, by =2)
axis(1, at=ylabelsV , seq(0,axisLimit, by =2), las=2)
ylabelsV = seq(0,axisLimit, by =2)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=axisLimit)

dev.off()