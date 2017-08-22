setwd("D:/Research Scripts/GSoC14/August 2017b - Charts - R")
#setwd("D:/Git Repositories/Papers/FORPI/scripts charts and data")

#get all data
#alldata = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/random-all-data-dec1s.txt")
alldata = read.csv("D:/Research Scripts/GSoC14/August 2017b - Charts - R/random-all-data-aug22.txt")

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


#make BEST line
bestLen<- pmin(compressedLengthFinalRPILU, compressedLengthFinalLURPI)
diffLengthsBest <- (lengthRPI - bestLen)

bestLine <- makeLineData(indexVector, diffLengthsBest)

#--------------------------------------TPTP stuff



#Get the data
#get RPI-only data
#alldataRPI = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-forpi.txt")
alldataRPI = read.csv("D:/Research Scripts/GSoC14/August 2017b - Charts - R/cade-forpi.txt")

#alldataRPI[1:10,]
dataRPI <- subset(alldataRPI, select=proof:numFOSub)
#dataRPI[1:10,]
num <- length(dataRPI)
#num 
compressedLengthRPITPTP <- dataRPI[,"compressedLengthResOnly"]
numFOSubsRPITPTP <- dataRPI[,"numFOSub"]

compressedLengthRPIFinalTPTP <- compressedLengthRPITPTP #(compressedLengthRPI  - numFOSubsRPI )
lengthRPITPTP <- dataRPI[,"resOnlyLength"]
###---
cleanDataPoints <- cbind(lengthRPITPTP,compressedLengthRPIFinalTPTP)
cleanDataPointsLen <- length(cleanDataPoints[,1])
indexVectorTPTP <- c(1:cleanDataPointsLen)  #Note: this is for ALL data sets (okay since all are on same proofs)
baseLine <- makeLineData(indexVectorTPTP, lengthRPITPTP ) #Note: this is for ALL data sets (okay since all are on same proofs)
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPoints[i,2] <- oL 
	}
    
}
compressedLengthRPIFinalTPTP <- cleanDataPoints[,2]
diffLengthsRPITPTP <- (lengthRPITPTP - compressedLengthRPIFinalTPTP)
rpiLineTPTP <- makeLineData(indexVectorTPTP, diffLengthsRPITPTP)
###---


#Get the data
#get LU-only data
#alldataLU = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-folu.txt")
alldataLU = read.csv("D:/Research Scripts/GSoC14/August 2017b - Charts - R/cade-folu.txt")

#alldataLU[1:10,]
dataLU <- subset(alldataLU, select=proof:numFOSub)
#dataLU[1:10,]
num <- length(dataLU)
#num 
compressedLengthLUTPTP <- dataLU[,"compressedLengthResOnly"]
numFOSubsLUTPTP <- dataLU[,"numFOSub"]

compressedLengthLUFinalTPTP <- compressedLengthLUTPTP #(compressedLengthLU  - numFOSubsLU )
lengthLUTPTP <- dataLU[,"resOnlyLength"]
###---
cleanDataPoints <- cbind(lengthLUTPTP,compressedLengthLUFinalTPTP)
cleanDataPointsLen <- length(cleanDataPoints[,1])
indexVectorTPTP <- c(1:cleanDataPointsLen)  #Note: this is for ALL data sets (okay since all are on same proofs)
baseLine <- makeLineData(indexVectorTPTP, lengthLUTPTP ) #Note: this is for ALL data sets (okay since all are on same proofs)
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPoints[i,2] <- oL 
	}
    
}
compressedLengthLUFinalTPTP <- cleanDataPoints[,2]
diffLengthsLUTPTP <- (lengthLUTPTP - compressedLengthLUFinalTPTP)
luLineTPTP <- makeLineData(indexVectorTPTP, diffLengthsLUTPTP)
###---

#Get the data
#get LURPI-only data
#alldataLURPI = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-folurpi.txt")
alldataLURPI = read.csv("D:/Research Scripts/GSoC14/August 2017b - Charts - R/cade-folurpi.txt")

#alldataLURPI[1:10,]
dataLURPI <- subset(alldataLURPI, select=proof:numFOSub)
#dataLURPI[1:10,]
num <- length(dataLURPI)
#num 
compressedLengthLURPITPTP <- dataLURPI[,"compressedLengthResOnly"]
numFOSubsLURPITPTP <- dataLURPI[,"numFOSub"]

compressedLengthLURPIFinalTPTP <- compressedLengthLURPITPTP #(compressedLengthLURPI  - numFOSubsLURPI )
lengthLURPITPTP <- dataLURPI[,"resOnlyLength"]
###---
cleanDataPoints <- cbind(lengthLURPITPTP,compressedLengthLURPIFinalTPTP)
cleanDataPointsLen <- length(cleanDataPoints[,1])
indexVectorTPTP <- c(1:cleanDataPointsLen)  #Note: this is for ALL data sets (okay since all are on same proofs)
baseLine <- makeLineData(indexVectorTPTP, lengthLURPITPTP ) #Note: this is for ALL data sets (okay since all are on same proofs)
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPoints[i,2] <- oL 
	}
    
}
compressedLengthLURPIFinalTPTP <- cleanDataPoints[,2]
compressedLengthLURPIFinalTPTP <- pmin(compressedLengthLURPIFinalTPTP, compressedLengthRPIFinalTPTP)
diffLengthsLURPITPTP <- (lengthLURPITPTP - compressedLengthLURPIFinalTPTP)

lurpiLineTPTP <- makeLineData(indexVectorTPTP, diffLengthsLURPITPTP)
###---


#Get the data
#get RPILU-only data
#alldataRPILU = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-forpilu.txt")
alldataRPILU = read.csv("D:/Research Scripts/GSoC14/August 2017b - Charts - R/cade-forpilu.txt")

#alldataRPILU[1:10,]
dataRPILU <- subset(alldataRPILU, select=proof:numFOSub)
#dataRPILU[1:10,]
num <- length(dataRPILU)
#num 
compressedLengthRPILUTPTP <- dataRPILU[,"compressedLengthResOnly"]
numFOSubsRPILUTPTP <- dataRPILU[,"numFOSub"]

compressedLengthRPILUFinalTPTP <- compressedLengthRPILUTPTP #(compressedLengthRPILU  - numFOSubsRPILU )
lengthRPILUTPTP <- dataRPILU[,"resOnlyLength"]
###---
cleanDataPointsRPILU <- cbind(lengthRPILUTPTP,compressedLengthRPILUFinalTPTP)
cleanDataPointsRPILULen <- length(cleanDataPointsRPILU[,1])
indexVectorTPTP <- c(1:cleanDataPointsLen)  #Note: this is for ALL data sets (okay since all are on same proofs)
baseLine <- makeLineData(indexVectorTPTP, lengthRPILUTPTP ) #Note: this is for ALL data sets (okay since all are on same proofs)
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPointsRPILU[i,1]
	cL <- cleanDataPointsRPILU[i,2]
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPointsRPILU[i,2] <- oL 
	}
    
}
compressedLengthRPILUFinalTPTP <- cleanDataPointsRPILU[,2]
compressedLengthRPILUFinalTPTP <- pmin(compressedLengthRPILUFinalTPTP, compressedLengthLUFinalTPTP)
diffLengthsRPILUTPTP <- (lengthRPILUTPTP - compressedLengthRPILUFinalTPTP)

rpiluLineTPTP <- makeLineData(indexVectorTPTP, diffLengthsRPILUTPTP)
###---

#Get the data
#make BEST line
bestLenTPTP <- pmin(compressedLengthRPILUFinalTPTP, compressedLengthLURPIFinalTPTP)
diffLengthsBestTPTP <- (lengthRPILUTPTP - bestLenTPTP)

bestLineTPTP <- makeLineData(indexVectorTPTP, diffLengthsBestTPTP)
###---


#ALL
allXaxis <- max(max(rpiLine[,1]),max(max(luLine[,1]),max(max(rpiluLine[,1]),max(lurpiLine[,1]))))
allYaxis <- max(max(rpiLine[,2]),max(max(luLine[,2]),max(max(rpiluLine[,2]),max(lurpiLine[,2]))))


#plot(rpiluLine[,1],rpiluLine[,2],type="n",  xlim=c(0,allXaxis), ylim=c(0,allYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Nodes (Resolutions)",yaxs="i", xaxs="i")

#lines(luLine[,1],luLine[,2], type='l',col='blue') 
#lines(rpiLine[,1],rpiLine[,2], type='l',col='orange') 
#lines(rpiluLine[,1],rpiluLine[,2], type='l',col='red') 
#lines(lurpiLine[,1],lurpiLine[,2], type='l',col='green') 

#XbyVal <- 25
#YbyVal <- 10
#xlabelsV <- seq(0,allXaxis, by =XbyVal)
#axis(1, at=xlabelsV , seq(0,allXaxis, by =XbyVal), las=2)
#ylabelsVpos = seq(0,allYaxis, by = YbyVal)
#ylabelsV = ylabelsVpos
#axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
#abline(v=allXaxis)
#abline(h=0)
#abline(v=0)
#abline(h=allYaxis)
#legend("topleft",c("FOLU(p)", "FORPI(p)", "FORPI(FOLU(p))", "FOLU(FORPI(p))"), lty=c(1,1), col=c("blue", "orange", "red", "green"))
#dev.off()









#--------------------------------------TPTP stuff`





#Make the chart

#All with TPTP data

rpiluYaxis <- max(rpiluLine[,2])
lurpiYaxis <- max(lurpiLine[,2])
luYaxis <- max(luLine[,2])
rpiYaxis <- max(rpiLine[,2])
bestYaxis <- max(bestLine[,2])

allXaxis <- max(rpiluXaxis,lurpiXaxis,rpiXaxis,luXaxis)
allYaxis <- max(rpiluYaxis,lurpiYaxis,rpiYaxis,luYaxis,bestYaxis,40000)

pdf('combined-all-cumulative-res-nodes-diff.pdf', height=6, width=6)
par(mar=c(5.1,5.1,1,2.1))

plot(rpiluLine[,1],rpiluLine[,2],type="n",  xlim=c(0,allXaxis), ylim=c(0,allYaxis ),axes=FALSE, xlab="Number of Proofs", ylab="Number of Removed Resolutions (x10^3)",yaxs="i", xaxs="i")

lines(rpiLine[,1],rpiLine[,2], type='l',col='blue') 
lines(luLine[,1],luLine[,2], type='l',col='red') 
lines(rpiluLine[,1],rpiluLine[,2], type='l',col='green') 
lines(lurpiLine[,1],lurpiLine[,2], type='l',col='orange') 
lines(bestLine[,1],bestLine[,2], type='l', col='black')

XbyVal <- 100
YbyVal <- 2000
xlabelsV <- seq(0,allXaxis, by =XbyVal)
axis(1, at=xlabelsV , seq(0,allXaxis, by =XbyVal), las=2)
ylabelsVpos = seq(0,allYaxis, by = YbyVal)
ylabelsV = ylabelsVpos/1000
axis(2, at=ylabelsVpos, labels=ylabelsV  , las=2)
abline(v=allXaxis)
abline(h=0)
abline(v=0)
abline(h=allYaxis)
legend("topleft",c("FOLU(p)", "FORPI(p)", "FORPI(FOLU(p))", "FOLU(FORPI(p))", "Best"), lty=c(1,1,1,1), col=c("blue", "red", "green", "orange", "black"), bty="n")

scaleFactor <- 2 
heightOffset <- 30000
horizontalOffset <- 275
vScaleFactor <- 100

inlayXlabelPositions <- c(0,100,200,300)*scaleFactor + horizontalOffset
inlayWidth <- 308 #todo: find using data
inlayWidthScaled <- inlayWidth *scaleFactor 

axis(1, at=inlayXlabelPositions , labels=seq(0,300, by =100),las=2, pos=c(heightOffset,horizontalOffset))
rpiYinlayMax <- max(rpiLineTPTP[,2]*vScaleFactor +heightOffset)
luYinlayMax <- max(luLineTPTP[,2]*vScaleFactor +heightOffset)
rpiluYinlayMax <- max(rpiluLineTPTP[,2]*vScaleFactor +heightOffset)
lurpiYinlayMax <- max(lurpiLineTPTP[,2]*vScaleFactor +heightOffset)
bestYinlayMax <- max(bestLineTPTP[,2]*vScaleFactor +heightOffset)
inlayYmax <- max(max(max(rpiYinlayMax, luYinlayMax), max(rpiluYinlayMax, lurpiYinlayMax)), bestYinlayMax)

rpiYinlayMaxNS <- max(rpiLineTPTP[,2])
luYinlayMaxNS <- max(luLineTPTP[,2])
rpiluYinlayMaxNS <- max(rpiluLineTPTP[,2])
lurpiYinlayMaxNS <- max(lurpiLineTPTP[,2])
bestYinlayMaxNS <- max(bestLineTPTP[,2])
inlayYmaxNS <- max(max(max(rpiYinlayMaxNS, luYinlayMaxNS), max(rpiluYinlayMaxNS, lurpiYinlayMaxNS)), bestYinlayMaxNS)

inlayXmax <- max(bestLineTPTP[,1]*scaleFactor)  + horizontalOffset


#connecting lines
segments(0, 0, horizontalOffset, heightOffset,lty='dotted') #bottom left
segments(inlayWidth , 0, inlayXmax , heightOffset,lty='dotted') #bottom right
segments(0,inlayYmaxNS , horizontalOffset, inlayYmax,lty='dotted') #top left
segments(inlayWidth , inlayYmaxNS , inlayXmax , inlayYmax,lty='dotted') #top right

rect(horizontalOffset, heightOffset, inlayXmax, inlayYmax, col='white')

lines(luLineTPTP[,1]*scaleFactor + horizontalOffset,jitter(luLineTPTP[,2]*vScaleFactor +heightOffset), type='l',col='blue',lty=2) 
lines(rpiLineTPTP[,1]*scaleFactor + horizontalOffset,jitter(rpiLineTPTP[,2]*vScaleFactor +heightOffset), type='l',col='red') 
lines(rpiluLineTPTP[,1]*scaleFactor + horizontalOffset,jitter(rpiluLineTPTP[,2]*vScaleFactor +heightOffset), type='l',col='green',lty=3) 
lines(lurpiLineTPTP[,1]*scaleFactor + horizontalOffset,jitter(lurpiLineTPTP[,2]*vScaleFactor +heightOffset), type='l',col='orange',lty=4) 
lines(bestLineTPTP[,1]*scaleFactor + horizontalOffset,jitter(bestLineTPTP[,2]*vScaleFactor +heightOffset), type='l',col='black',lty=5) 




#segments(horizontalOffset, inlayYmax, horizontalOffset+inlayWidth, inlayYmax)
#segments(horizontalOffset, heightOffset, horizontalOffset+inlayWidth, heightOffset)
#segments(horizontalOffset, heightOffset, horizontalOffset, inlayYmax)
#segments(horizontalOffset+inlayWidth, heightOffset, horizontalOffset+inlayWidth, inlayYmax)



#window outline
segments(inlayWidth , 0, inlayWidth, inlayYmaxNS , lty='dotted')
segments(0 , inlayYmaxNS , inlayWidth, inlayYmaxNS , lty='dotted')


axis(2, at=c(0,30,60,90,120)*vScaleFactor + heightOffset, labels=seq(0,0.12, by =0.03),las=2, pos=c(horizontalOffset, heightOffset))
#mtext("                       Removed Resolutions", side = 2, line = -1.00)


dev.off()