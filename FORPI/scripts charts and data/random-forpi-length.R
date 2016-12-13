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


axisLimitX = max(rpiXlim)
axisLimitY = max(rpiYlim)
axisLimit = max(axisLimitX, axisLimitY)

pdf('random-forpi-length-vs-compressed-length.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(lengthRPI,compressedLengthFinalRPI ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length", ylab="Compressed Length",yaxs="i", xaxs="i")



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

