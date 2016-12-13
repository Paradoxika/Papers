#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#get all data
#alldata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-data.txt")
#alldata[1:6,]
someData <- subset(alldata, select=luProofsize:totalTime)
#someData[1:2,]
num <- length(someData)
num 

#Get the data
#LU
sizeLU = "luNumRes" #or luNumRes
cSizeLU = "luNumResCompressed" #or "luNumResCompressed"
lengthLU <- someData[,sizeLU]
compressedLengthLU <- someData[,cSizeLU]
numFOSubsLU <- someData[,"luCFO"]
compressedLengthFinalLU <- compressedLengthLU #(compressedLengthLU  - numFOSubsLU )
###---
cleanDataPoints <- cbind(lengthLU,compressedLengthFinalLU)
cleanDataPointsLen <- length(cleanDataPoints[,1])
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
	if (cL < 0){ #If the compressed length was 0, it was an error; LU returns the original proof
		cleanDataPoints[i,2] <- oL
	}
}
compressedLengthFinalLU <- cleanDataPoints[,2]
###---
luXlim <- max(unique(lengthLU)) + 1
luYlim <- max(unique(compressedLengthFinalLU)) + 1


axisLimitX = max(luXlim)
axisLimitY = max(luYlim)
axisLimit = max(axisLimitX, axisLimitY)

pdf('random-folu-res-length-vs-compressed-res-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(lengthLU,compressedLengthFinalLU ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)",yaxs="i", xaxs="i")



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
		cat("Bad compression found (LU-res).\n")
		cat("i: ") 
		cat(i) 
		cat(" ") 
		cat(dataPoints[i,1]) 
		cat(" ")
		cat(dataPoints[i,2]) 
		cat("\n")
	}
}

