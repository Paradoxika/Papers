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


#get LU-only data
#alldataLU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folu.txt")
alldataLU[1:10,]
dataLU <- subset(alldataLU, select=proof:numFOSub)
dataLU[1:10,]
num <- length(dataLU)
num 
compressedLengthLU <- dataLU[,"compressedLengthAll"]
numFOSubsLU <- dataLU[,"numFOSub"]

compressedLengthLUFinal <- (compressedLengthLU  - numFOSubsLU )

axisLimitX = max(unique(dataLU[,"compressedLengthAll"])) + 1
axisLimitY = max(unique(dataLU[,"length"])) + 1
axisLimit = max(axisLimitX, axisLimitY)

pdf('tptp-all-length-vs-compress-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(dataRPI[,"length"],compressedLengthRPIFinal ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length", ylab="Compressed Length",yaxs="i", xaxs="i")

luPoints <-cbind(dataLU[,"length"], compressedLengthLUFinal )
points(luPoints,col="red",pch=4)
rpiluPoints <-cbind(dataRPILU[,"length"], compressedLengthRPILUFinal)
points(rpiluPoints,col="blue",pch=2)
lurpiPoints <-cbind(dataLURPI[,"length"], compressedLengthLURPIFinal)
points(lurpiPoints,col="green",pch=3)
legend("topleft",c("FORPI(p)", "GFOLU(p)", "FORPI(GFOLU(p))", "GFOLU(FORPI(p))"), pch=c(1,4,2,3), col=c("black","red", "blue", "green"))


abline(0,1)
lengths <- sort(unique(dataRPI[,"length"]))
ylabelsV = seq(0,axisLimit, by =2)
axis(1, at=ylabelsV , seq(0,axisLimit, by =2), las=2)
ylabelsV = seq(0,axisLimit, by =2)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=axisLimit)

dev.off()