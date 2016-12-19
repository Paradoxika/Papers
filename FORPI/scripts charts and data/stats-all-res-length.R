#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")
setwd("D:/Git Repositories/Papers/FORPI/scripts charts and data")

#Get the tptp data
#get RPI-only data
alldataRPI = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-forpi.txt")
#get RPILU-only data
alldataRPILU = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-forpilu.txt")
#get LURPI-only data
alldataLURPI = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-folurpi.txt")
#get LU-only data
alldataLU = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-folu.txt")


#get all data
alldata = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/random-all-data-dec1s.txt")
someData <- subset(alldata, select=rpiProofsize:totalTime)
num <- length(someData)

countOnlyCompressed <- FALSE #TRUE


rpiCompressedCount <- 0
luCompressedCount <- 0 
rpiluCompressedCount <- 0
lurpiCompressedCount <- 0

#Get the data
#RPI
sizeRPI = "rpiNumRes" 
cSizeRPI = "rpiNumResCompressed" 
lengthRPI <- someData[,sizeRPI]
compressedLengthRPI <- someData[,cSizeRPI]
compressedLengthFinalRPI <- compressedLengthRPI 
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
sizeLU = "luNumRes"
cSizeLU = "luNumResCompressed" 
lengthLU <- someData[,sizeLU]
compressedLengthLU <- someData[,cSizeLU]
compressedLengthFinalLU <- compressedLengthLU 
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
sizeLURPI = "lurpiNumRes" 
cSizeLURPI = "lurpiNumResCompressed"
lengthLURPI <- someData[,sizeLURPI]
compressedLengthLURPI <- someData[,cSizeLURPI]
compressedLengthFinalLURPI <- compressedLengthLURPI 
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
sizeRPILU = "rpiluNumRes" 
cSizeRPILU = "rpiluNumResCompressed"
lengthRPILU <- someData[,sizeRPILU]
compressedLengthRPILU <- someData[,cSizeRPILU]
compressedLengthFinalRPILU <- compressedLengthRPILU 
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


#--------------------------------------TPTP stuff


getTPTPdataVectors <- function(allDataTPTP, countOnlyCompressed) {
    
    outCount <- 0 #this will be returned
    
    dataTPTP <- allDataTPTP 
    num <- length(dataTPTP)
    compressedLengthTPTP <- dataTPTP[,"compressedLengthResOnly"]
    compressedLengthFinalTPTP <- compressedLengthTPTP 
    lengthTPTP <- dataTPTP[,"resOnlyLength"]
    ###---
    
    cleanDataPointsTPTP <- cbind(lengthTPTP,compressedLengthFinalTPTP)
    cleanDataPointsTPTPLen <- length(cleanDataPointsTPTP[,1])

    for(i in 1:cleanDataPointsTPTPLen){
        oL <- cleanDataPointsTPTP[i,1]
        cL <- cleanDataPointsTPTP[i,2]
        
        if(cL < oL & cL > 0){
            outCount <- outCount + 1
        }
    
        if (cL <= 0){ #If the compressed length was 0, it was an error;
           cleanDataPointsTPTP[i,2] <- oL 
        }
        oL <- cleanDataPointsTPTP[i,1]
        cL <- cleanDataPointsTPTP[i,2]    
        if(oL == cL & countOnlyCompressed){
               cleanDataPointsTPTP[i,2] <- 0
               cleanDataPointsTPTP[i,1] <- 0
        }          
        
    }
    if(countOnlyCompressed){
        lengthTPTP <- cleanDataPointsTPTP[,1] #this should also be returned
    }    
    compressedLengthFinalTPTP <- cleanDataPointsTPTP[,2]
    cat("outcount: ")
    cat(outCount)
    cat("\n")
    return (list(outCount, lengthTPTP, compressedLengthFinalTPTP))
}

tptpRPIList <- getTPTPdataVectors(alldataRPI, countOnlyCompressed)
tptpRPILUList <- getTPTPdataVectors(alldataRPILU, countOnlyCompressed)
tptpLURPIList <- getTPTPdataVectors(alldataLURPI, countOnlyCompressed)
tptpLUList <- getTPTPdataVectors(alldataLU, countOnlyCompressed)

tptpRPIcompressedCount <- unlist(tptpRPIList[1])
rpiCompressedCount <- rpiCompressedCount + tptpRPIcompressedCount
tptpRPILengthsFinal <- as.vector(unlist(tptpRPIList[2]))
lengthRPI <- c(lengthRPI, tptpRPILengthsFinal)
tptpRPIcompressedLengthsFinal <- as.vector(unlist(tptpRPIList[3]))
compressedLengthFinalRPI <- c(compressedLengthFinalRPI, tptpRPIcompressedLengthsFinal)

tptpLUcompressedCount <- unlist(tptpLUList[1])
rpiCompressedCount <- rpiCompressedCount + tptpLUcompressedCount
tptpLULengthsFinal <- as.vector(unlist(tptpLUList[2]))
lengthLU <- c(lengthLU, tptpLULengthsFinal)
tptpLUcompressedLengthsFinal <- as.vector(unlist(tptpLUList[3]))
compressedLengthFinalLU <- c(compressedLengthFinalLU, tptpLUcompressedLengthsFinal)

tptpLURPIcompressedCount <- unlist(tptpLURPIList[1])
rpiCompressedCount <- rpiCompressedCount + tptpLURPIcompressedCount
tptpLURPILengthsFinal <- as.vector(unlist(tptpLURPIList[3]))
lengthLURPI <- c(lengthLURPI, tptpLURPILengthsFinal)
tptpLURPIcompressedLengthsFinal <- as.vector(unlist(tptpLURPIList[3]))
compressedLengthFinalLURPI <- c(compressedLengthFinalLURPI, tptpLURPIcompressedLengthsFinal)

tptpRPILUcompressedCount <- unlist(tptpRPILUList[1])
rpiCompressedCount <- rpiCompressedCount + tptpRPILUcompressedCount
tptpRPILULengthsFinal <- as.vector(unlist(tptpRPILUList[2]))
lengthRPILU <- c(lengthRPILU, tptpRPILULengthsFinal)
tptpRPILUcompressedLengthsFinal <- as.vector(unlist(tptpRPILUList[3]))
compressedLengthFinalRPILU <- c(compressedLengthFinalRPILU, tptpRPILUcompressedLengthsFinal)



##### TPTP ends ---------------------

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

calculateAverageCompressionRatio <- function(originalLengths, compressedLengths, countCompressedOnly){
    numOlen <- length(originalLengths)
    out <- rep.int(0, numOlen)
    outCompressedOnly <- rep.int(0, numOlen)
    
    compressedCount <- 0
    for(i in 1:numOlen){
        oL <- originalLengths[i]
        cL <- compressedLengths[i]
        out[i] <- (oL - cL)/oL
        if(cL < oL){
            compressedCount <- compressedCount + 1
            outCompressedOnly[i] <- (oL - cL)/oL
        }
    }

    if(!countCompressedOnly){
        sumUncompressed <- sum(out)
  
        averageUncompressed <- sumUncompressed / numOlen
        #averageVal <- mean(out)
        #return(averageVal)
    } else {
        sumCompressed <- sum(outCompressedOnly)
      
        averageCompressed <- sumCompressed / compressedCount 
        return(averageCompressed)
    }
}


averageProofCompressionRaitioRPI <- calculateAverageCompressionRatio(lengthRPI, compressedLengthFinalRPI, FALSE)
averageProofCompressionRaitioLU <- calculateAverageCompressionRatio(lengthLU, compressedLengthFinalLU, FALSE)
averageProofCompressionRaitioLURPI <- calculateAverageCompressionRatio(lengthLURPI, compressedLengthFinalLURPI, FALSE)
averageProofCompressionRaitioRPILU <- calculateAverageCompressionRatio(lengthRPILU, compressedLengthFinalRPILU, FALSE)

averageProofCompressionRaitioRPI
averageProofCompressionRaitioLU 
averageProofCompressionRaitioLURPI 
averageProofCompressionRaitioRPILU 


averageProofCompressionRaitioRPIcOnly <- calculateAverageCompressionRatio(lengthRPI, compressedLengthFinalRPI, TRUE)
averageProofCompressionRaitioLUcOnly <- calculateAverageCompressionRatio(lengthLU, compressedLengthFinalLU, TRUE)
averageProofCompressionRaitioLURPIcOnly <- calculateAverageCompressionRatio(lengthLURPI, compressedLengthFinalLURPI, TRUE)
averageProofCompressionRaitioRPILUcOnly <- calculateAverageCompressionRatio(lengthRPILU, compressedLengthFinalRPILU, TRUE)

averageProofCompressionRaitioRPIcOnly
averageProofCompressionRaitioLUcOnly 
averageProofCompressionRaitioLURPIcOnly 
averageProofCompressionRaitioRPILUcOnly 

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

#these are OVERALL values
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

rpiCompressedCount
luCompressedCount
lurpiCompressedCount
rpiluCompressedCount

rpiPercentCompressed <- (rpiCompressedCount / rpiCount)
luPercentCompressed <- (luCompressedCount / luCount)
lurpiPercentCompressed <- (lurpiCompressedCount / lurpiCount)
rpiluPercentCompressed <- (rpiluCompressedCount / rpiluCount)

rpiPercentCompressed
luPercentCompressed 
lurpiPercentCompressed 
rpiluPercentCompressed 
 
totalNumberOfProofs <- rpiluCount  #they're all the same
totalNumberOfProofs 



