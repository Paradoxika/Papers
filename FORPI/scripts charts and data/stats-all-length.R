setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#get all data
alldata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-data.txt")
#alldata[1:6,]
someData <- subset(alldata, select=rpiProofsize:totalTime)
#someData[1:2,]
num <- length(someData)
num 

countOnlyCompressed <- FALSE #TRUE


rpiCompressedCount <- 0
luCompressedCount <- 0 
rpiluCompressedCount <- 0
lurpiCompressedCount <- 0

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
for(i in 1:cleanDataPointsLen){
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]
    if(cL < oL & cL > 0){
        rpiCompressedCount <- rpiCompressedCount + 1
    }
    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
       cleanDataPoints[i,2] <- oL 
	}
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]    
    if(oL == cL & countOnlyCompressed){
           cleanDataPoints[i,2] <- 0
           cleanDataPoints[i,1] <- 0
    }
}
if(countOnlyCompressed){
    lengthRPI <- cleanDataPoints[,1]
}
compressedLengthFinalRPI <- cleanDataPoints[,2]
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
    if(cL < oL & cL > 0){
        luCompressedCount <- luCompressedCount + 1
    }
    
	if (cL <= 0){ #If the compressed length was 0, it was an error; LU returns the original proof
		cleanDataPoints[i,2] <- oL
	}
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]    
    if(oL == cL & countOnlyCompressed){
       cleanDataPoints[i,2] <- 0
       cleanDataPoints[i,1] <- 0
    }    
}
if(countOnlyCompressed){
    lengthLU <- cleanDataPoints[,1]
}
compressedLengthFinalLU <- cleanDataPoints[,2]
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
    if(cL < oL & cL > 0){
        lurpiCompressedCount <- lurpiCompressedCount + 1
    }    
	if (cL <= 0){ #If the compressed length was 0, it was an error;
		cleanDataPoints[i,2] <- oL
	}
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]    
    if(oL == cL & countOnlyCompressed){
           cleanDataPoints[i,2] <- 0
           cleanDataPoints[i,1] <- 0
    }    
}
if(countOnlyCompressed){
    lengthLURPI <- cleanDataPoints[,1]
}
compressedLengthFinalLURPI <- cleanDataPoints[,2]
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
    if(cL < oL & cL > 0){
        rpiluCompressedCount <- rpiluCompressedCount + 1
    }
	if (cL <= 0){ #If the compressed length was 0, it was an error;
		cleanDataPoints[i,2] <- oL
	}
	oL <- cleanDataPoints[i,1]
	cL <- cleanDataPoints[i,2]    
    if(oL == cL & countOnlyCompressed){
           cleanDataPoints[i,2] <- 0
           cleanDataPoints[i,1] <- 0
    }    
}
if(countOnlyCompressed){
    lengthRPILU <- cleanDataPoints[,1]
}
compressedLengthFinalRPILU <- cleanDataPoints[,2]
###---

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


numberOfNodesRPI <- sum(lengthRPI)
numberOfNodesLU <- sum(lengthLU)
numberOfNodesRPILU <- sum(lengthRPILU)
numberOfNodesLURPI <- sum(lengthLURPI)

numberOfNodesRPI 
numberOfNodesLU 
numberOfNodesRPILU 
numberOfNodesLURPI 

numberOfNodesRPIcompressed <- sum(compressedLengthFinalRPI)
numberOfNodesLUcompressed <- sum(compressedLengthFinalLU)
numberOfNodesRPILUcompressed <- sum(compressedLengthFinalRPILU)
numberOfNodesLURPIcompressed <- sum(compressedLengthFinalLURPI)

numberOfNodesRPIcompressed 
numberOfNodesLUcompressed 
numberOfNodesRPILUcompressed 
numberOfNodesLURPIcompressed

rpiCompressRatio <- (numberOfNodesRPIcompressed / numberOfNodesRPI)
luCompressRatio <- (numberOfNodesLUcompressed / numberOfNodesLU)
rpiluCompressRatio <- (numberOfNodesRPILUcompressed / numberOfNodesRPILU)
lurpiCompressRatio <- (numberOfNodesLURPIcompressed / numberOfNodesLURPI)

rpiCompressRatio 
luCompressRatio
rpiluCompressRatio 
lurpiCompressRatio 

#Should only be used when countOnlyCompressed is false
rpiCount <- length(lengthRPI)
luCount <- length(lengthLU) 
rpiluCount <- length(lengthRPILU)
lurpiCount <- length(lengthLURPI)

rpiPercentCompressed <- (rpiCompressedCount / rpiCount)
luPercentCompressed <- (luCompressedCount / luCount)
lurpiPercentCompressed <- (lurpiCompressedCount / lurpiCount)
rpiluPercentCompressed <- (rpiluCompressedCount / rpiluCount)

rpiPercentCompressed
luPercentCompressed 
lurpiPercentCompressed 
rpiluPercentCompressed 