#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#get all data
#alldata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-data.txt")
#alldata[1:6,]
someData <- subset(alldata, select=rpiProofsize:totalTime)
#someData[1:2,]
num <- length(someData)
num 

#Get the data
#RPI
sizeRPI = "rpiProofsize" #or rpiNumRes
cSizeRPI = "rpiCompressedSize" #or "rpiNumResCompressed"
lengthRPI <- someData[,sizeRPI]
compressedLengthRPI <- someData[,cSizeRPI]
numFOSubsRPI <- someData[,"rpiCFO"]
compressedLengthFinalRPI <- (compressedLengthRPI  - numFOSubsRPI )
rpiXlim <- max(unique(lengthRPI)) + 1
rpiYlim <- max(unique(compressedLengthFinalRPI)) + 1


#LU
sizeLU = "luProofsize" #or luNumRes
cSizeLU = "luCompressedSize" #or "luNumResCompressed"
lengthLU <- someData[,sizeLU]
compressedLengthLU <- someData[,cSizeLU]
numFOSubsLU <- someData[,"luCFO"]
compressedLengthFinalLU <- (compressedLengthLU  - numFOSubsLU )
###---
cleanDataPoints <- cbind(lengthLU,compressedLengthFinalLU)
cleanDataPointsLen <- length(cleanDataPoints[,1])
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
	if (cL <= 0){ #If the compressed length was 0, it was an error; LU returns the original proof
		cleanDataPoints[i,2] <- oL
	}
}
compressedLengthFinalLU <- cleanDataPoints[,2]
###---
luXlim <- max(unique(lengthLU)) + 1
luYlim <- max(unique(compressedLengthFinalLU)) + 1

#LU-RPI
sizeLURPI = "lurpiProofsize" #or lurpiNumRes
cSizeLURPI = "lurpiCompressedSize" #or "lurpiNumResCompressed"
lengthLURPI <- someData[,sizeLURPI]
compressedLengthLURPI <- someData[,cSizeLURPI]
numFOSubsLURPI <- someData[,"lurpiCFO"]
compressedLengthFinalLURPI <- (compressedLengthLURPI  - numFOSubsLURPI )
lurpiXlim <- max(unique(lengthLURPI)) + 1
lurpiYlim <- max(unique(compressedLengthFinalLURPI)) + 1

#RPI-LU
sizeRPILU = "rpiluProofsize" #or luNumRes
cSizeRPILU = "rpiluCompressedSize" #or "luNumResCompressed"
lengthRPILU <- someData[,sizeRPILU]
compressedLengthRPILU <- someData[,cSizeRPILU]
numFOSubsRPILU <- someData[,"rpiluCFO"]
compressedLengthFinalRPILU <- (compressedLengthRPILU  - numFOSubsRPILU )
rpiluXlim <- max(unique(lengthRPILU)) + 1
rpiluYlim <- max(unique(compressedLengthFinalRPILU)) + 1

axisLimitX <- max(rpiXlim, luXlim, rpiluXlim, lurpiXlim)
axisLimitY <- max(rpiYlim, luYlim, rpiluYlim, lurpiYlim)
axisLimit <- max(axisLimitX, axisLimitY)
axisLimitX
axisLimitY
axisLimit

pdf('random-all-length-vs-compressed-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(lengthRPI,compressedLengthFinalRPI ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length", ylab="Compressed Length",yaxs="i", xaxs="i")

luPoints <-cbind(lengthLU, compressedLengthFinalLU )
points(luPoints,col="red",pch=4)
rpiluPoints <-cbind(lengthRPILU, compressedLengthFinalRPILU )
points(rpiluPoints,col="blue",pch=2)
lurpiPoints <-cbind(lengthLURPI, compressedLengthFinalLURPI )
points(lurpiPoints,col="green",pch=3)
legend("topleft",c("FORPI(p)", "GFOLU(p)", "FORPI(GFOLU(p))", "GFOLU(FORPI(p))"), pch=c(1,4,2,3), col=c("black","red", "blue", "green"))


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

dev.off()

#RPI check
dataPoints = cbind(lengthRPI,compressedLengthFinalRPI)
checkLen = length(dataPoints[,1])
for(i in 1:checkLen){
	#cat(i)
	#cat(" ")
	#cat(dataPoints[i,1])
	#cat(" ")
	#cat(dataPoints[i,2])
	#cat("\n")
	oL <- dataPoints[i,1]
	cL <- dataPoints[i,2]
	if (cL > oL){
		cat("Bad compression found (RPI).\n")
		cat("i: ") 
		cat(i) 
		cat(" ") 
		cat(dataPoints[i,1]) 
		cat(" ")
		cat(dataPoints[i,2]) 
		cat("\n")
	}
}

#LU check
dataPoints = cbind(lengthLU,compressedLengthFinalLU)
checkLen = length(dataPoints[,1])
for(i in 1:checkLen){
	#cat(i)
	#cat(" ")
	#cat(dataPoints[i,1])
	#cat(" ")
	#cat(dataPoints[i,2])
	#cat("\n")
	oL <- dataPoints[i,1]
	cL <- dataPoints[i,2]
	if (cL > oL){
		cat("Bad compression found (LU).\n")
		cat("i: ") 
		cat(i) 
		cat(" ") 
		cat(dataPoints[i,1]) 
		cat(" ")
		cat(dataPoints[i,2]) 
		cat("\n")
	}
}

#RPILU check
dataPoints = cbind(lengthRPILU,compressedLengthFinalRPILU)
checkLen = length(dataPoints[,1])
for(i in 1:checkLen){
	#cat(i)
	#cat(" ")
	#cat(dataPoints[i,1])
	#cat(" ")
	#cat(dataPoints[i,2])
	#cat("\n")
	oL <- dataPoints[i,1]
	cL <- dataPoints[i,2]
	if (cL > oL){
		cat("Bad compression found (RPILU).\n")
		cat("i: ") 
		cat(i) 
		cat(" ") 
		cat(dataPoints[i,1]) 
		cat(" ")
		cat(dataPoints[i,2]) 
		cat("\n")
	}
}

#check LURPI
dataPoints = cbind(lengthLURPI,compressedLengthFinalLURPI)
checkLen = length(dataPoints[,1])
for(i in 1:checkLen){
	#cat(i)
	#cat(" ")
	#cat(dataPoints[i,1])
	#cat(" ")
	#cat(dataPoints[i,2])
	#cat("\n")
	oL <- dataPoints[i,1]
	cL <- dataPoints[i,2]
	if (cL > oL){
		cat("Bad compression found (LURPI).\n")
		cat("i: ") 
		cat(i) 
		cat(" ") 
		cat(dataPoints[i,1]) 
		cat(" ")
		cat(dataPoints[i,2]) 
		cat("\n")
	}
}