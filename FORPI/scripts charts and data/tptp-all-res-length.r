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

#get LU-only data
#alldataLU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folu.txt")
alldataLU[1:10,]
dataLU <- subset(alldataLU, select=proof:numFOSub)
dataLU[1:10,]
num <- length(dataLU)
num 
compressedLengthResOnlyLU <- dataLU[,"compressedLengthResOnly"]
compressedLengthResOnlyLU 
initialResLengthsLU <- dataLU[,"resOnlyLength"]

axisLimit = max(unique(dataLU[,"resOnlyLength"])) + 1
axisLimit 

#get LURPI-only data
#alldataLURPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi.txt")
alldataLURPI[1:10,]
dataLURPI <- subset(alldataLURPI, select=proof:numFOSub)
dataLURPI[1:10,]
num <- length(dataLURPI)
num 
compressedLengthResOnlyLURPI <- dataLURPI[,"compressedLengthResOnly"]
compressedLengthResOnlyLURPI 
initialResLengthsLURPI <- dataLURPI[,"resOnlyLength"]

axisLimit = max(unique(dataLURPI[,"resOnlyLength"])) + 1
axisLimit 


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

pdf('tptp-all-res-length-vs-compress-res-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(dataRPI[,"resOnlyLength"],compressedLengthResOnlyRPI ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)",yaxs="i", xaxs="i")

luPoints <-cbind(dataLU[,"resOnlyLength"], compressedLengthResOnlyLU )
points(luPoints,col="red",pch=4)
rpiluPoints <-cbind(dataRPILU[,"resOnlyLength"], compressedLengthResOnlyRPILU)
points(rpiluPoints,col="blue",pch=2)
lurpiPoints <-cbind(dataLURPI[,"resOnlyLength"], compressedLengthResOnlyLURPI)
points(lurpiPoints,col="green",pch=3)
legend("topleft",c("FORPI(p)", "GFOLU(p)", "FORPI(GFOLU(p))", "GFOLU(FORPI(p))"), pch=c(1,4,2,3), col=c("black","red", "blue", "green"))

abline(0,1)
lengths <- sort(unique(dataRPI[,"resOnlyLength"]))
ylabelsV = seq(0,axisLimit, by =2)
axis(1, at=ylabelsV , seq(0,axisLimit, by =2), las=2)
ylabelsV = seq(0,axisLimit, by =2)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=axisLimit)
abline(h=axisLimit)

dev.off()