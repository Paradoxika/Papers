setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")


#Get the data
#get LURPI-only data
#alldataLURPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi.txt")
#alldataLURPI[1:10,]
dataLURPI <- subset(alldataLURPI, select=proof:numFOSub)
#dataLURPI[1:10,]
num <- length(dataLURPI)
#num 
compressedLengthLURPI <- dataLURPI[,"compressedLengthAll"]
numFOSubsLURPI <- dataLURPI[,"numFOSub"]

compressedLengthLURPIFinal <- (compressedLengthLURPI  - numFOSubsLURPI )
lengthLURPI <- dataLURPI[,"length"]


lurpiXlim <- max(unique(lengthLURPI)) + 1
lurpiYlim <- max(unique(compressedLengthLURPIFinal)) + 1



#get RPILU-only data
#alldataRPILU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu.txt")
#alldataRPILU[1:10,]
dataRPILU <- subset(alldataRPILU, select=proof:numFOSub)
#dataRPILU[1:10,]
num <- length(dataRPILU)
#num 
compressedLengthRPILU <- dataRPILU[,"compressedLengthAll"]
numFOSubsLURPI <- dataRPILU[,"numFOSub"]

compressedLengthRPILUFinal <- (compressedLengthRPILU  - numFOSubsRPILU )
lengthRPILU <- dataRPILU[,"length"]


rpiluXlim <- max(unique(lengthRPILU)) + 1
rpiluYlim <- max(unique(compressedLengthRPILUFinal)) + 1

axisLimitX = max(rpiluXlim, lurpiXlim)
axisLimitY = max(rpiluYlim, lurpiYlim)
axisLimit = max(axisLimitX, axisLimitY)

pdf('tptp-alg-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(compressedLengthRPILUFinal,compressedLengthLURPIFinal ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Compressed Length (FORPI(GFOLU(p)))", ylab="Compressed Length (GFOLU(FORPI(p)))",yaxs="i", xaxs="i")


abline(0,1)
countVal = 15
byVal = 10 # max(someData[,size]) / countVal

ylabelsV = seq(0,axisLimit, by =byVal)
axis(1, at=ylabelsV , seq(0,axisLimit, by =byVal), las=2)
ylabelsV = seq(0,axisLimit, by = byVal)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=0)
abline(v=0)
abline(h=axisLimit)

dev.off()


