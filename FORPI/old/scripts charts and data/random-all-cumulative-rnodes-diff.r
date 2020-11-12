#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#get all data
#alldata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-data.txt")
#alldata[1:6,]
someData <- subset(alldata, select=rpiProofsize:totalTime)
#someData[1:2,]
num <- length(someData)
num 

#Function to make lines
makeLineData <- function(xVals, yVals){
    out <- cbind(xVals, yVals)
    yValsLen <- length(yVals)
    for(i in 2:yValsLen){
        out[i,2] <- out[i-1,2] + out[i,2]
    }
    return(out)
}


#Get the data
#RPI
sizeRPI = "rpiNumRes" #or rpiNumRes
cSizeRPI = "rpiNumResCompressed" #or "rpiNumResCompressed"
lengthRPI <- someData[,sizeRPI]
compressedLengthRPI <- someData[,cSizeRPI]
numFOSubsRPI <- someData[,"rpiCFO"]
compressedLengthFinalRPI <- compressedLengthRPI#(compressedLengthRPI  - numFOSubsRPI )
###---
cleanDataPoints <- cbind(lengthRPI,compressedLengthFinalRPI)
cleanDataPointsLen <- length(cleanDataPoints[,1])
indexVector <- c(1:cleanDataPointsLen)  #Note: this is for ALL data sets (okay since all are on same proofs)
baseLine <- makeLineData(indexVector, lengthRPI ) #Note: this is for ALL data sets (okay since all are on same proofs)
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPoints[i,2] <- oL 
	}
    
}
compressedLengthFinalRPI <- cleanDataPoints[,2]
diffLengthsRPI <- (lengthRPI - compressedLengthFinalRPI)
rpiLine <- makeLineData(indexVector, diffLengthsRPI)
###---

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
    
	if (cL <= 0){ #If the compressed length was 0, it was an error; LU returns the original proof
		cleanDataPoints[i,2] <- oL
	}
   
}

compressedLengthFinalLU <- cleanDataPoints[,2]
diffLengthsLU <- (lengthRPI - compressedLengthFinalLU)

luLine <- makeLineData(indexVector, diffLengthsLU)
###---

#LU-RPI
sizeLURPI = "lurpiNumRes" #or lurpiNumRes
cSizeLURPI = "lurpiNumResCompressed" #or "lurpiNumResCompressed"
lengthLURPI <- someData[,sizeLURPI]
compressedLengthLURPI <- someData[,cSizeLURPI]
numFOSubsLURPI <- someData[,"lurpiCFO"]
compressedLengthFinalLURPI <- compressedLengthLURPI#(compressedLengthLURPI  - numFOSubsLURPI )
###---
cleanDataPoints <- cbind(lengthLURPI,compressedLengthFinalLURPI)
cleanDataPointsLen <- length(cleanDataPoints[,1])
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
  
	if (cL <= 0){ #If the compressed length was 0, it was an error;
		cleanDataPoints[i,2] <- oL
	}
    
}

compressedLengthFinalLURPI <- cleanDataPoints[,2]
diffLengthsLURPI <- (lengthRPI - compressedLengthFinalLURPI)

lurpiLine <- makeLineData(indexVector, diffLengthsLURPI)

###---


#RPI-LU
sizeRPILU = "rpiluNumRes" #or rpiluNumRes
cSizeRPILU = "rpiluNumResCompressed" #or "rpiluNumResCompressed"
lengthRPILU <- someData[,sizeRPILU]
compressedLengthRPILU <- someData[,cSizeRPILU]
numFOSubsRPILU <- someData[,"rpiluCFO"]
compressedLengthFinalRPILU <- compressedLengthRPILU #(compressedLengthRPILU  - numFOSubsRPILU )
###---
cleanDataPoints <- cbind(lengthRPILU,compressedLengthFinalRPILU)
cleanDataPointsLen <- length(cleanDataPoints[,1])
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]

	if (cL <= 0){ #If the compressed length was 0, it was an error;
		cleanDataPoints[i,2] <- oL
	}
  
}

compressedLengthFinalRPILU <- cleanDataPoints[,2]
diffLengthsRPILU <- (lengthRPI - compressedLengthFinalRPILU)

rpiluLine <- makeLineData(indexVector, diffLengthsRPILU)
###---


#Make the charts
#RPI
rpiXaxis <- max(rpiLine[,1])
rpiYaxis <- max(rpiLine[,2])

pdf('random-forpi-cumulative-res-nodes-diff.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiLine[,1],rpiLine[,2],type="n",  xlim=c(0,rpiXaxis), ylim=c(0,rpiYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Resolution Nodes",yaxs="i", xaxs="i")

lines(rpiLine[,1],rpiLine[,2], type='l',col='black') 

XbyVal <- 100
YbyVal <- 2000
xlabelsV <- seq(0,rpiXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,rpiXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,rpiYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=rpiXaxis)
abline(h=0)
abline(v=0)
abline(h=rpiYaxis)
dev.off()

#LU
luXaxis <- max(luLine[,1])
luYaxis <- max(luLine[,2])

pdf('random-folu-cumulative-res-nodes-diff.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(luLine[,1],luLine[,2],type="n",  xlim=c(0,luXaxis), ylim=c(0,luYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Resolution Nodes",yaxs="i", xaxs="i")

lines(luLine[,1],luLine[,2], type='l',col='black') 

XbyVal <- 100
YbyVal <- 2000
xlabelsV <- seq(0,luXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,luXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,luYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=luXaxis)
abline(h=0)
abline(v=0)
abline(h=luYaxis)
dev.off()

#LURPI
lurpiXaxis <- max(lurpiLine[,1])
lurpiYaxis <- max(lurpiLine[,2])

pdf('random-folurpi-cumulative-res-nodes-diff.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(lurpiLine[,1],lurpiLine[,2],type="n",  xlim=c(0,lurpiXaxis), ylim=c(0,lurpiYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Resolution Nodes",yaxs="i", xaxs="i")

lines(lurpiLine[,1],lurpiLine[,2], type='l',col='black') 

XbyVal <- 100
YbyVal <- 2000
xlabelsV <- seq(0,lurpiXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,lurpiXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,lurpiYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=lurpiXaxis)
abline(h=0)
abline(v=0)
abline(h=lurpiYaxis)

dev.off()
#RPILU
rpiluXaxis <- max(rpiluLine[,1])
rpiluYaxis <- max(rpiluLine[,2])

pdf('random-forpilu-cumulative-res-nodes-diff.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiluLine[,1],rpiluLine[,2],type="n",  xlim=c(0,rpiluXaxis), ylim=c(0,rpiluYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Resolution Nodes",yaxs="i", xaxs="i")

lines(rpiluLine[,1],rpiluLine[,2], type='l',col='black') 

XbyVal <- 100
YbyVal <- 2000
xlabelsV <- seq(0,rpiluXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,rpiluXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,rpiluYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=rpiluXaxis)
abline(h=0)
abline(v=0)
abline(h=rpiluYaxis)


dev.off()

#All

allXaxis <- max(rpiluXaxis,lurpiXaxis,rpiXaxis,luXaxis)
allYaxis <- max(rpiluYaxis,lurpiYaxis,rpiYaxis,luYaxis)

pdf('random-all-cumulative-res-nodes-diff.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiluLine[,1],rpiluLine[,2],type="n",  xlim=c(0,allXaxis), ylim=c(0,allYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Resolution Nodes",yaxs="i", xaxs="i")

lines(rpiLine[,1],rpiLine[,2], type='l',col='blue') 
lines(luLine[,1],luLine[,2], type='l',col='red') 
lines(rpiluLine[,1],rpiluLine[,2], type='l',col='green') 
lines(lurpiLine[,1],lurpiLine[,2], type='l',col='orange') 


XbyVal <- 100
YbyVal <- 2000
xlabelsV <- seq(0,allXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,allXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,allYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=allXaxis)
abline(h=0)
abline(v=0)
abline(h=allYaxis)
legend("topleft",c("FOLU(p)", "FORPI(p)", "FORPI(FOLU(p))", "FOLU(FORPI(p))"), lty=c(1,1,1,1), col=c("blue", "red", "green", "orange"))


dev.off()