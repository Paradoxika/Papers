#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")



#Function to make lines
makeLineData <- function(xVals, yVals){
    out <- cbind(xVals, yVals)
    yValsLen <- length(yVals)
    for(i in 2:yValsLen){
        out[i,2] <- out[i-1,2] + out[i,2]
	  #cat(out[i,2])
	  #cat("\n")
    }
    return(out)
}


#Get the data
#get RPI-only data
#alldataRPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpi.txt")
#alldataRPI[1:10,]
dataRPI <- subset(alldataRPI, select=proof:numFOSub)
#dataRPI[1:10,]
num <- length(dataRPI)
#num 
compressedLengthRPI <- dataRPI[,"compressedLengthResOnly"]
numFOSubsRPI <- dataRPI[,"numFOSub"]

compressedLengthRPIFinal <- compressedLengthRPI #(compressedLengthRPI  - numFOSubsRPI )
lengthRPI <- dataRPI[,"resOnlyLength"]
###---
cleanDataPoints <- cbind(lengthRPI,compressedLengthRPIFinal)
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
compressedLengthRPIFinal <- cleanDataPoints[,2]

rpiLine <- makeLineData(indexVector, compressedLengthRPIFinal)
###---


#Get the data
#get LU-only data
#alldataLU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folu.txt")
#alldataLU[1:10,]
dataLU <- subset(alldataLU, select=proof:numFOSub)
#dataLU[1:10,]
num <- length(dataLU)
#num 
compressedLengthLU <- dataLU[,"compressedLengthResOnly"]
numFOSubsLU <- dataLU[,"numFOSub"]

compressedLengthLUFinal <- compressedLengthLU# (compressedLengthLU  - numFOSubsLU )
lengthLU <- dataLU[,"resOnlyLength"]
###---
cleanDataPoints <- cbind(lengthLU,compressedLengthLUFinal)
cleanDataPointsLen <- length(cleanDataPoints[,1])
indexVector <- c(1:cleanDataPointsLen)  #Note: this is for ALL data sets (okay since all are on same proofs)
baseLine <- makeLineData(indexVector, lengthLU ) #Note: this is for ALL data sets (okay since all are on same proofs)
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPoints[i,2] <- oL 
	}
    
}
compressedLengthLUFinal <- cleanDataPoints[,2]

luLine <- makeLineData(indexVector, compressedLengthLUFinal)
###---

#Get the data
#get LURPI-only data
#alldataLURPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi.txt")
#alldataLURPI[1:10,]
dataLURPI <- subset(alldataLURPI, select=proof:numFOSub)
#dataLURPI[1:10,]
num <- length(dataLURPI)
#num 
compressedLengthLURPI <- dataLURPI[,"compressedLengthResOnly"]
numFOSubsLURPI <- dataLURPI[,"numFOSub"]

compressedLengthLURPIFinal <- compressedLengthLURPI#(compressedLengthLURPI  - numFOSubsLURPI )
lengthLURPI <- dataLURPI[,"resOnlyLength"]
###---
cleanDataPoints <- cbind(lengthLURPI,compressedLengthLURPIFinal)
cleanDataPointsLen <- length(cleanDataPoints[,1])
indexVector <- c(1:cleanDataPointsLen)  #Note: this is for ALL data sets (okay since all are on same proofs)
baseLine <- makeLineData(indexVector, lengthLURPI ) #Note: this is for ALL data sets (okay since all are on same proofs)
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPoints[i,2] <- oL 
	}
    
}
compressedLengthLURPIFinal <- cleanDataPoints[,2]

lurpiLine <- makeLineData(indexVector, compressedLengthLURPIFinal)
###---


#Get the data
#get RPILU-only data
#alldataRPILU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu.txt")
#alldataRPILU[1:10,]
dataRPILU <- subset(alldataRPILU, select=proof:numFOSub)
#dataRPILU[1:10,]
num <- length(dataRPILU)
#num 
compressedLengthRPILU <- dataRPILU[,"compressedLengthResOnly"]
numFOSubsRPILU <- dataRPILU[,"numFOSub"]

compressedLengthRPILUFinal <- compressedLengthRPILU #(compressedLengthRPILU  - numFOSubsRPILU )
lengthRPILU <- dataRPILU[,"resOnlyLength"]
###---
cleanDataPoints <- cbind(lengthRPILU,compressedLengthRPILUFinal)
cleanDataPointsLen <- length(cleanDataPoints[,1])
indexVector <- c(1:cleanDataPointsLen)  #Note: this is for ALL data sets (okay since all are on same proofs)
baseLine <- makeLineData(indexVector, lengthRPILU ) #Note: this is for ALL data sets (okay since all are on same proofs)
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPoints[i,2] <- oL 
	}
    
}
compressedLengthRPILUFinal <- cleanDataPoints[,2]

rpiluLine <- makeLineData(indexVector, compressedLengthRPILUFinal)
###---


#Make the charts
#RPI
rpiXaxis <- max(baseLine[,1])
rpiYaxis <- max(baseLine[,2])

pdf('tptp-forpi-cumulative-rnodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiLine[,1],rpiLine[,2],type="n",  xlim=c(0,rpiXaxis), ylim=c(0,rpiYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (Resolutions)",yaxs="i", xaxs="i")

lines(rpiLine[,1],rpiLine[,2], type='l',col='blue') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 25
YbyVal <- 200
xlabelsV <- seq(0,rpiXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,rpiXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,rpiYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=rpiXaxis)
abline(h=0)
abline(v=0)
abline(h=rpiYaxis)
legend("topleft",c("Uncompressed", "FORPI(p)"), lty=c(1,1), col=c("black","blue"))
dev.off()

#Make the charts
#LU
luXaxis <- max(baseLine[,1])
luYaxis <- max(baseLine[,2])

pdf('tptp-folu-cumulative-rnodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(luLine[,1],luLine[,2],type="n",  xlim=c(0,luXaxis), ylim=c(0,luYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (Resolutions)",yaxs="i", xaxs="i")

lines(luLine[,1],luLine[,2], type='l',col='blue') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 25
YbyVal <- 200
xlabelsV <- seq(0,luXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,luXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,luYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=luXaxis)
abline(h=0)
abline(v=0)
abline(h=luYaxis)
legend("topleft",c("Uncompressed", "FOLU(p)"), lty=c(1,1), col=c("black","blue"))
dev.off()

#Make the charts
#LURPI
lurpiXaxis <- max(baseLine[,1])
lurpiYaxis <- max(baseLine[,2])

pdf('tptp-folurpi-cumulative-rnodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(lurpiLine[,1],lurpiLine[,2],type="n",  xlim=c(0,lurpiXaxis), ylim=c(0,lurpiYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (Resolutions)",yaxs="i", xaxs="i")

lines(lurpiLine[,1],lurpiLine[,2], type='l',col='blue') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 25
YbyVal <- 200
xlabelsV <- seq(0,lurpiXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,lurpiXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,lurpiYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=lurpiXaxis)
abline(h=0)
abline(v=0)
abline(h=lurpiYaxis)
legend("topleft",c("Uncompressed", "FOLU(FORPI(p))"), lty=c(1,1), col=c("black","blue"))
dev.off()

#Make the charts
#RPILU
rpiluXaxis <- max(baseLine[,1])
rpiluYaxis <- max(baseLine[,2])

pdf('tptp-forpilu-cumulative-rnodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiluLine[,1],rpiluLine[,2],type="n",  xlim=c(0,rpiluXaxis), ylim=c(0,rpiluYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (Resolutions)",yaxs="i", xaxs="i")

lines(rpiluLine[,1],rpiluLine[,2], type='l',col='blue') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 25
YbyVal <- 200
xlabelsV <- seq(0,rpiluXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,rpiluXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,rpiluYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=rpiluXaxis)
abline(h=0)
abline(v=0)
abline(h=rpiluYaxis)
legend("topleft",c("Uncompressed", "FORPI(FOLU(p))"), lty=c(1,1), col=c("black","blue"))
dev.off()


#ALL
rpiluXaxis <- max(baseLine[,1])
rpiluYaxis <- max(baseLine[,2])

pdf('tptp-all-cumulative-rnodes-all.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

plot(rpiluLine[,1],rpiluLine[,2],type="n",  xlim=c(0,rpiluXaxis), ylim=c(0,rpiluYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (Resolutions)",yaxs="i", xaxs="i")

lines(luLine[,1],luLine[,2], type='l',col='blue') 
lines(rpiLine[,1],rpiLine[,2], type='l',col='orange') 
lines(rpiluLine[,1],rpiluLine[,2], type='l',col='red') 
lines(lurpiLine[,1],lurpiLine[,2], type='l',col='green') 
lines(baseLine[,1],baseLine[,2], type='l',col='black') 

XbyVal <- 25
YbyVal <- 200
xlabelsV <- seq(0,rpiluXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,rpiluXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,rpiluYaxis, by = YbyVal)
ylabelsV = ylabelsVpos
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=rpiluXaxis)
abline(h=0)
abline(v=0)
abline(h=rpiluYaxis)
legend("topleft",c("Uncompressed", "FOLU(p)", "FORPI(p)", "FORPI(FOLU(p))", "FOLU(FORPI(p))"), lty=c(1,1), col=c("black","blue", "orange", "red", "green"))
dev.off()