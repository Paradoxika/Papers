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

includeTPTP <- FALSE
includeRandom <- TRUE

rpiCompressedCount <- 0
luCompressedCount <- 0 
rpiluCompressedCount <- 0
lurpiCompressedCount <- 0

if(includeRandom){
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

}
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

if(includeTPTP){
    tptpRPIList <- getTPTPdataVectors(alldataRPI, countOnlyCompressed)
    tptpRPILUList <- getTPTPdataVectors(alldataRPILU, countOnlyCompressed)
    tptpLURPIList <- getTPTPdataVectors(alldataLURPI, countOnlyCompressed)
    tptpLUList <- getTPTPdataVectors(alldataLU, countOnlyCompressed)

    tptpRPIcompressedCount <- unlist(tptpRPIList[1])
    if(includeRandom){
        rpiCompressedCount <- rpiCompressedCount + tptpRPIcompressedCount
    } else {
        rpiCompressedCount <- tptpRPIcompressedCount
    }
    tptpRPILengthsFinal <- as.vector(unlist(tptpRPIList[2]))
    if(includeRandom){
        lengthRPI <- c(lengthRPI, tptpRPILengthsFinal)
    } else {
        lengthRPI <- tptpRPILengthsFinal
    }
    tptpRPIcompressedLengthsFinal <- as.vector(unlist(tptpRPIList[3]))
    if(includeRandom){    
        compressedLengthFinalRPI <- c(compressedLengthFinalRPI, tptpRPIcompressedLengthsFinal)
    } else {
        compressedLengthFinalRPI <- tptpRPIcompressedLengthsFinal
    }

    tptpLUcompressedCount <- unlist(tptpLUList[1])
    if(includeRandom){    
        luCompressedCount <- luCompressedCount + tptpLUcompressedCount
    } else {
        luCompressedCount <- tptpLUcompressedCount
    }
    tptpLULengthsFinal <- as.vector(unlist(tptpLUList[2]))
    if(includeRandom){    
        lengthLU <- c(lengthLU, tptpLULengthsFinal)
    } else {
        lengthLU <- tptpLULengthsFinal
    }
    tptpLUcompressedLengthsFinal <- as.vector(unlist(tptpLUList[3]))
    if(includeRandom){        
        compressedLengthFinalLU <- c(compressedLengthFinalLU, tptpLUcompressedLengthsFinal)
    } else {
        compressedLengthFinalLU <- tptpLUcompressedLengthsFinal
    }

    tptpLURPIcompressedCount <- unlist(tptpLURPIList[1])
    if(includeRandom){    
        lurpiCompressedCount <- lurpiCompressedCount + tptpLURPIcompressedCount
    } else {
        lurpiCompressedCount <- tptpLURPIcompressedCount
    }
    tptpLURPILengthsFinal <- as.vector(unlist(tptpLURPIList[3]))
    if(includeRandom){    
        lengthLURPI <- c(lengthRPI, tptpLURPILengthsFinal)
    } else {
        lengthLURPI <- tptpRPILengthsFinal
    }
    tptpLURPIcompressedLengthsFinal <- pmin(as.vector(unlist(tptpLURPIList[3])),tptpRPIcompressedLengthsFinal)
    if(includeRandom){        
        compressedLengthFinalLURPI <- c(compressedLengthFinalLURPI, tptpLURPIcompressedLengthsFinal)
    } else {
        compressedLengthFinalLURPI <- tptpLURPIcompressedLengthsFinal
    }
    
    tptpRPILUcompressedCount <- unlist(tptpRPILUList[1])
    if(includeRandom){    
        rpiluCompressedCount <- rpiluCompressedCount + tptpRPILUcompressedCount
    } else {
        rpiluCompressedCount <- tptpRPILUcompressedCount
    }
    tptpRPILULengthsFinal <- as.vector(unlist(tptpRPILUList[2]))
    if(includeRandom){    
        lengthRPILU <- c(lengthRPILU, tptpRPILULengthsFinal)
    } else {
        lengthRPILU <- tptpRPILULengthsFinal
    }
    tptpRPILUcompressedLengthsFinal <- pmin(as.vector(unlist(tptpRPILUList[3])),tptpLUcompressedLengthsFinal)
    if(includeRandom){        
        compressedLengthFinalRPILU <- c(compressedLengthFinalRPILU, tptpRPILUcompressedLengthsFinal)
    } else {
        compressedLengthFinalRPILU <- tptpRPILUcompressedLengthsFinal
    }
}


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

calculateAverageCompressionRatioMedian <- function(originalLengths, compressedLengths, countCompressedOnly){
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
        medianAverage <- median(out)
        return(medianAverage)
    } else {
        outCompressedOnlySorted <- sort(outCompressedOnly, decreasing=TRUE)
        firstZero <- min(which(outCompressedOnlySorted == 0))
        outCompressedNonZeroes <- outCompressedOnlySorted[1:firstZero]
        compressedMedian <- median(outCompressedNonZeroes)
        return(compressedMedian)
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
        return(averageUncompressed)
        #averageVal <- mean(out)
        #return(averageVal)
    } else {
        sumCompressed <- sum(outCompressedOnly)
      
        averageCompressed <- sumCompressed / compressedCount 
        return(averageCompressed)
    }
}

bestData <- pmin(compressedLengthFinalLURPI, compressedLengthFinalRPILU)


lengthBase <- length(lengthRPI)
bestCount <- 0
for(i in 1: lengthBase){
    oL <- lengthRPI[i]
    aL <- compressedLengthFinalLURPI[i]
    bL <- compressedLengthFinalRPILU[i]
    if(aL < oL | bL < oL){
        bestCount <- bestCount + 1
    }
}

bestCount


averageProofCompressionRaitioRPI <- calculateAverageCompressionRatio(lengthRPI, compressedLengthFinalRPI, FALSE)
averageProofCompressionRaitioLU <- calculateAverageCompressionRatio(lengthLU, compressedLengthFinalLU, FALSE)
averageProofCompressionRaitioLURPI <- calculateAverageCompressionRatio(lengthLURPI, compressedLengthFinalLURPI, FALSE)
averageProofCompressionRaitioRPILU <- calculateAverageCompressionRatio(lengthRPILU, compressedLengthFinalRPILU, FALSE)
averageProofCompressionRaitioBest <- calculateAverageCompressionRatio(lengthRPILU, bestData, FALSE)

averageProofCompressionRaitioRPI
averageProofCompressionRaitioLU 
averageProofCompressionRaitioLURPI 
averageProofCompressionRaitioRPILU 
averageProofCompressionRaitioBest

averageProofCompressionRaitioRPIcOnly <- calculateAverageCompressionRatio(lengthRPI, compressedLengthFinalRPI, TRUE)
averageProofCompressionRaitioLUcOnly <- calculateAverageCompressionRatio(lengthLU, compressedLengthFinalLU, TRUE)
averageProofCompressionRaitioLURPIcOnly <- calculateAverageCompressionRatio(lengthLURPI, compressedLengthFinalLURPI, TRUE)
averageProofCompressionRaitioRPILUcOnly <- calculateAverageCompressionRatio(lengthRPILU, compressedLengthFinalRPILU, TRUE)
averageProofCompressionRaitioBestcOnly <- calculateAverageCompressionRatio(lengthRPILU, bestData, TRUE)


averageProofCompressionRaitioRPIcOnly
averageProofCompressionRaitioLUcOnly 
averageProofCompressionRaitioLURPIcOnly 
averageProofCompressionRaitioRPILUcOnly 
averageProofCompressionRaitioBestcOnly


medianProofCompressionRaitioRPI <- calculateAverageCompressionRatioMedian(lengthRPI, compressedLengthFinalRPI, FALSE)
medianProofCompressionRaitioLU <- calculateAverageCompressionRatioMedian(lengthLU, compressedLengthFinalLU, FALSE)
medianProofCompressionRaitioLURPI <- calculateAverageCompressionRatioMedian(lengthLURPI, compressedLengthFinalLURPI, FALSE)
medianProofCompressionRaitioRPILU <- calculateAverageCompressionRatioMedian(lengthRPILU, compressedLengthFinalRPILU, FALSE)
medianProofCompressionRaitioBest <- calculateAverageCompressionRatioMedian(lengthRPILU, bestData, FALSE)


medianProofCompressionRaitioRPI
medianProofCompressionRaitioLU 
medianProofCompressionRaitioLURPI 
medianProofCompressionRaitioRPILU 
medianProofCompressionRaitioBest

medianProofCompressionRaitioRPIcOnly <- calculateAverageCompressionRatioMedian(lengthRPI, compressedLengthFinalRPI, TRUE)
medianProofCompressionRaitioLUcOnly <- calculateAverageCompressionRatioMedian(lengthLU, compressedLengthFinalLU, TRUE)
medianProofCompressionRaitioLURPIcOnly <- calculateAverageCompressionRatioMedian(lengthLURPI, compressedLengthFinalLURPI, TRUE)
medianProofCompressionRaitioRPILUcOnly <- calculateAverageCompressionRatioMedian(lengthRPILU, compressedLengthFinalRPILU, TRUE)
medianProofCompressionRaitioBestcOnly <- calculateAverageCompressionRatioMedian(lengthRPILU, bestData, TRUE)

medianProofCompressionRaitioRPIcOnly
medianProofCompressionRaitioLUcOnly 
medianProofCompressionRaitioLURPIcOnly 
medianProofCompressionRaitioRPILUcOnly 
medianProofCompressionRaitioBestcOnly


numberOfNodesRPI <- sum(lengthRPI)
numberOfNodesLU <- sum(lengthLU)
numberOfNodesRPILU <- sum(lengthRPILU)
numberOfNodesLURPI <- sum(lengthRPILU)
numberOfNodesBest <- numberOfNodesRPI

numberOfNodesRPI 
numberOfNodesLU 
numberOfNodesRPILU 
numberOfNodesLURPI 
numberOfNodesBest

numberOfNodesRPIcompressed <- sum(compressedLengthFinalRPI)
numberOfNodesLUcompressed <- sum(compressedLengthFinalLU)
numberOfNodesRPILUcompressed <- sum(compressedLengthFinalRPILU)
numberOfNodesLURPIcompressed <- sum(compressedLengthFinalLURPI)
numberOfNodesBestcompressed <- sum(bestData)

numberOfNodesRPIcompressed 
numberOfNodesLUcompressed 
numberOfNodesRPILUcompressed 
numberOfNodesLURPIcompressed
numberOfNodesBestcompressed

numberOfNodesBestSaved <- numberOfNodesBest - numberOfNodesBestcompressed
numberOfNodesRPISaved <- numberOfNodesRPI - numberOfNodesRPIcompressed
numberOfNodesLUSaved <- numberOfNodesLU - numberOfNodesLUcompressed
numberOfNodesRPILUSaved <- numberOfNodesRPILU - numberOfNodesRPILUcompressed
numberOfNodesLURPISaved <- numberOfNodesLURPI - numberOfNodesLURPIcompressed

numberOfNodesBestSaved 
numberOfNodesRPISaved 
numberOfNodesLUSaved 
numberOfNodesRPILUSaved 
numberOfNodesLURPISaved 


#these are OVERALL values
rpiCompressRatio <- 1-(numberOfNodesRPIcompressed / numberOfNodesRPI)
luCompressRatio <-  1-(numberOfNodesLUcompressed / numberOfNodesLU)
rpiluCompressRatio <-  1-(numberOfNodesRPILUcompressed / numberOfNodesRPILU)
lurpiCompressRatio <-  1-(numberOfNodesLURPIcompressed / numberOfNodesLURPI)
bestCompressRatio <-  1-(numberOfNodesBestcompressed / numberOfNodesBest)


rpiCompressRatio 
luCompressRatio
rpiluCompressRatio 
lurpiCompressRatio 
bestCompressRatio

rpiCompressRatioToCompare <- 1 - rpiCompressRatio
luCompressRatioToCompare <- 1 - luCompressRatio
rpiluCompressRatioToCompare <- 1 - rpiluCompressRatio
lurpiCompressRatioToCompare <- 1 - lurpiCompressRatio
bestCompressRatioToCompare <- 1 - bestCompressRatio

rpiCompressRatioToCompare
luCompressRatioToCompare
rpiluCompressRatioToCompare 
lurpiCompressRatioToCompare
bestCompressRatioToCompare

#Should only be used when countOnlyCompressed is false
rpiCount <- length(lengthRPI)
luCount <- length(lengthLU) 
rpiluCount <- length(lengthRPILU)
lurpiCount <- length(lengthLURPI)

rpiCompressedCount
luCompressedCount
lurpiCompressedCount
rpiluCompressedCount
bestCount

rpiPercentCompressed <- (rpiCompressedCount / rpiCount)
luPercentCompressed <- (luCompressedCount / luCount)
lurpiPercentCompressed <- (lurpiCompressedCount / lurpiCount)
rpiluPercentCompressed <- (rpiluCompressedCount / rpiluCount)
bestPercentComprssed <- (bestCount / rpiCount)

rpiPercentCompressed
luPercentCompressed 
lurpiPercentCompressed 
rpiluPercentCompressed 
bestPercentComprssed
 
totalNumberOfProofs <- rpiluCount  #they're all the same
totalNumberOfProofs 



