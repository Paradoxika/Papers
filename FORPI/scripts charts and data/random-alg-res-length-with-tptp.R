#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")
setwd("D:/Git Repositories/Papers/FORPI/scripts charts and data")

#get all data
alldata = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/random-all-data-dec1s.txt")
someData <- subset(alldata, select=rpiProofsize:totalTime)

#Get the data

#LU-RPI
sizeLURPI = "lurpiNumRes" #or lurpiNumRes
cSizeLURPI = "lurpiNumResCompressed" #or "lurpiNumResCompressed"
lengthLURPI <- someData[,sizeLURPI]
compressedLengthLURPI <- someData[,cSizeLURPI]
numFOSubsLURPI <- someData[,"lurpiCFO"]
compressedLengthFinalLURPI <- compressedLengthLURPI #(compressedLengthLURPI  - numFOSubsLURPI )
lurpiXlim <- max(unique(lengthLURPI)) + 1
lurpiYlim <- max(unique(compressedLengthFinalLURPI)) + 1

#RPI-LU
sizeRPILU = "rpiluNumRes" 
cSizeRPILU = "rpiluNumResCompressed"
lengthRPILU <- someData[,sizeRPILU]
compressedLengthRPILU <- someData[,cSizeRPILU]
numFOSubsRPILU <- someData[,"rpiluCFO"]
compressedLengthFinalRPILU <- compressedLengthRPILU #(compressedLengthRPILU  - numFOSubsRPILU )
rpiluXlim <- max(unique(lengthRPILU)) + 1
rpiluYlim <- max(unique(compressedLengthFinalRPILU)) + 1

axisLimitX = max(rpiluYlim, lurpiYlim)
axisLimitY = max(rpiluYlim, lurpiYlim)
axisLimit = max(axisLimitX, axisLimitY)

pdf('combined-alg-res.pdf', height=6, width=6)
par(mar=c(5.1,5.1,1,2.1))

plot(compressedLengthFinalRPILU,compressedLengthFinalLURPI ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Compressed Resolutions (FORPI(GFOLU(p)))", ylab="Compressed Resolutions (GFOLU(FORPI(p)))",yaxs="i", xaxs="i")


abline(0,1)
countVal = 15
byVal = 50 # max(someData[,size]) / countVal

ylabelsV = seq(0,axisLimit, by =byVal)
axis(1, at=ylabelsV , seq(0,axisLimit, by =byVal), las=2)
ylabelsV = seq(0,axisLimit, by = byVal)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=0)
abline(v=0)
abline(h=axisLimit)

#Get the data
#get LURPI-only data
alldataLURPItptp = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi.txt")
dataLURPItptp <- subset(alldataLURPItptp, select=proof:numFOSub)

compressedLengthLURPItptp <- dataLURPItptp[,"compressedLengthResOnly"]
compressedLengthLURPIFinaltptp <- compressedLengthLURPItptp
lengthLURPItptp <- dataLURPItptp[,"resOnlyLength"]

#get RPILU-only data
alldataRPILUtptp = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu.txt")
dataRPILUtptp <- subset(alldataRPILUtptp, select=proof:numFOSub)
compressedLengthRPILUtptp <- dataRPILUtptp[,"compressedLengthResOnly"]

compressedLengthRPILUFinaltptp <- compressedLengthRPILUtptp
lengthRPILUtptp <- dataRPILUtptp[,"resOnlyLength"]

tptpPoints <- cbind(compressedLengthRPILUFinaltptp,compressedLengthLURPIFinaltptp)
points(tptpPoints,col="red",pch=3)

legend("topleft",c("TPTP Data", "Random Data"), pch=c(3,1), col=c("red","black"), bty="n")

dev.off()


