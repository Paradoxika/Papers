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
sizeRPI = "rpiProofsize" #or rpiNumRes
cSizeRPI = "rpiCompressedSize" #or "rpiNumResCompressed"
lengthRPI <- someData[,sizeRPI]
compressedLengthRPI <- someData[,cSizeRPI]
numFOSubsRPI <- someData[,"rpiCFO"]
compressedLengthFinalRPI <- (compressedLengthRPI  - numFOSubsRPI )
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

rpiLine <- makeLineData(indexVector, compressedLengthFinalRPI)
###---

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

luLine <- makeLineData(indexVector, compressedLengthFinalLU)
###---

#LU-RPI
sizeLURPI = "lurpiProofsize" #or lurpiNumRes
cSizeLURPI = "lurpiCompressedSize" #or "lurpiNumResCompressed"
lengthLURPI <- someData[,sizeLURPI]
compressedLengthLURPI <- someData[,cSizeLURPI]
numFOSubsLURPI <- someData[,"lurpiCFO"]
compressedLengthFinalLURPI <- (compressedLengthLURPI  - numFOSubsLURPI )
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

lurpiLine <- makeLineData(indexVector, compressedLengthFinalLURPI)

###---


#RPI-LU
sizeRPILU = "rpiluProofsize" #or luNumRes
cSizeRPILU = "rpiluCompressedSize" #or "luNumResCompressed"
lengthRPILU <- someData[,sizeRPILU]
compressedLengthRPILU <- someData[,cSizeRPILU]
numFOSubsRPILU <- someData[,"rpiluCFO"]
compressedLengthFinalRPILU <- (compressedLengthRPILU  - numFOSubsRPILU )
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

rpiluLine <- makeLineData(indexVector, compressedLengthFinalRPILU)
###---


#Make the charts
#RPI
rpiXaxis <- max(baseLine[,1])
rpiYaxis <- max(baseLine[,2])

pdf('random-forpi-cumulative-nodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiLine[,1],rpiLine[,2],type="n",  xlim=c(0,rpiXaxis), ylim=c(0,rpiYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (x10^4)",yaxs="i", xaxs="i")

lines(rpiLine[,1],rpiLine[,2], type='l',col='blue') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 100
YbyVal <- 50000
xlabelsV <- seq(0,rpiXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,rpiXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,rpiYaxis, by = YbyVal)
ylabelsV = ylabelsVpos/10000
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=rpiXaxis)
abline(h=0)
abline(v=0)
abline(h=rpiYaxis)
legend("topleft",c("Uncompressed", "FORPI(p)"), lty=c(1,1), col=c("black","blue"))
dev.off()

#LU
luXaxis <- max(baseLine[,1])
luYaxis <- max(baseLine[,2])

pdf('random-folu-cumulative-nodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(luLine[,1],luLine[,2],type="n",  xlim=c(0,luXaxis), ylim=c(0,luYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (x10^4)",yaxs="i", xaxs="i")

lines(luLine[,1],luLine[,2], type='l',col='blue') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 100
YbyVal <- 50000
xlabelsV <- seq(0,luXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,luXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,luYaxis, by = YbyVal)
ylabelsV = ylabelsVpos/10000
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=luXaxis)
abline(h=0)
abline(v=0)
abline(h=luYaxis)
legend("topleft",c("Uncompressed", "FOLU(p)"), lty=c(1,1), col=c("black","blue"))
dev.off()

#LURPI
lurpiXaxis <- max(baseLine[,1])
lurpiYaxis <- max(baseLine[,2])

pdf('random-folurpi-cumulative-nodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(lurpiLine[,1],lurpiLine[,2],type="n",  xlim=c(0,lurpiXaxis), ylim=c(0,lurpiYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (x10^4)",yaxs="i", xaxs="i")

lines(lurpiLine[,1],lurpiLine[,2], type='l',col='blue') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 100
YbyVal <- 50000
xlabelsV <- seq(0,lurpiXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,lurpiXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,lurpiYaxis, by = YbyVal)
ylabelsV = ylabelsVpos/10000
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=lurpiXaxis)
abline(h=0)
abline(v=0)
abline(h=lurpiYaxis)
legend("topleft",c("Uncompressed", "FOLU(RPI(p))"), lty=c(1,1), col=c("black","blue"))

dev.off()
#RPILU
rpiluXaxis <- max(baseLine[,1])
rpiluYaxis <- max(baseLine[,2])

pdf('random-forpilu-cumulative-nodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiluLine[,1],rpiluLine[,2],type="n",  xlim=c(0,rpiluXaxis), ylim=c(0,rpiluYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (x10^4)",yaxs="i", xaxs="i")

lines(rpiluLine[,1],rpiluLine[,2], type='l',col='blue') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 100
YbyVal <- 50000
xlabelsV <- seq(0,rpiluXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,rpiluXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,rpiluYaxis, by = YbyVal)
ylabelsV = ylabelsVpos/10000
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=rpiluXaxis)
abline(h=0)
abline(v=0)
abline(h=rpiluYaxis)
legend("topleft",c("Uncompressed", "FORPI(FOLU(p))"), lty=c(1,1), col=c("black","blue"))


dev.off()

#All

allXaxis <- max(baseLine[,1])
allYaxis <- max(baseLine[,2])

pdf('random-all-cumulative-nodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiluLine[,1],rpiluLine[,2],type="n",  xlim=c(0,allXaxis), ylim=c(0,allYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (x10^4)",yaxs="i", xaxs="i")

lines(baseLine[,1],baseLine[,2], type='l',col='black') 
lines(rpiLine[,1],rpiLine[,2], type='l',col='blue') 
lines(luLine[,1],luLine[,2], type='l',col='red') 
lines(rpiluLine[,1],rpiluLine[,2], type='l',col='green') 
lines(lurpiLine[,1],lurpiLine[,2], type='l',col='orange') 


XbyVal <- 100
YbyVal <- 50000
xlabelsV <- seq(0,allXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,allXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,allYaxis, by = YbyVal)
ylabelsV = ylabelsVpos/10000
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=allXaxis)
abline(h=0)
abline(v=0)
abline(h=allYaxis)
legend("topleft",c("Uncompressed", "FOLU(p)", "FORPI(p)", "FORPI(FOLU(p))", "FOLU(FORPI(p))"), lty=c(1,1,1,1,1), col=c("black","blue", "red", "green", "orange"))


dev.off()