#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#get RPI-only data
#alldataRPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpi.txt")
alldataRPI[1:10,]
dataRPI <- subset(alldataRPI, select=proof:numFOSub)
dataRPI[1:10,]
num <- length(dataRPI)
num 
compressedLengthResOnlyRPI <- dataRPI[,"compressedLengthResOnly"]
compressedLengthResOnlyRPI 
initialResLengthsRPI <- dataRPI[,"resOnlyLength"]

axisLimit = max(unique(dataRPI[,"resOnlyLength"])) + 1
axisLimit 

pdf('tptp-forpi-res-length-vs-compress-res-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(dataRPI[,"resOnlyLength"],compressedLengthResOnlyRPI ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)",yaxs="i", xaxs="i")

abline(0,1)
lengths <- sort(unique(dataRPI[,"resOnlyLength"]))
ylabelsV = seq(0,axisLimit, by =2)
axis(1, at=ylabelsV , seq(0,axisLimit, by =2), las=2)
ylabelsV = seq(0,axisLimit, by =2)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=axisLimit)

dev.off()