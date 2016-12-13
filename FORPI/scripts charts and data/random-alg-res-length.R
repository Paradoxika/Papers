#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#get all data
#alldata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-data.txt")
#alldata[1:6,]
someData <- subset(alldata, select=rpiProofsize:totalTime)
#someData[1:2,]
num <- length(someData)
num 

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

pdf('random-alg-res.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

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

dev.off()


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
    #if(cL > 200){
    #    cat("Some point is greater than 200")
    #}
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
    #if(cL > 200){
    #    cat("Some point is greater than 200")
    #}
}