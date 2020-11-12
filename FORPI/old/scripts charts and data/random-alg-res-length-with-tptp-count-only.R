#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")
setwd("D:/Git Repositories/Papers/FORPI/scripts charts and data")

#get all data
alldata = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/random-all-data-dec1s.txt")
someData <- subset(alldata, select=rpiProofsize:totalTime)

#Get the data

#LU-RPI
sizeLURPI = "lurpiNumRes" #or lurpiNumRes
cSizeLURPI = "lurpiNumResCompressed" #or "lurpiNumResCompressed"
lengthLURPI <- someData[,sizeLURPI]
compressedLengthLURPI <- someData[,cSizeLURPI]
numFOSubsLURPI <- someData[,"lurpiCFO"]
compressedLengthFinalLURPI <- compressedLengthLURPI #(compressedLengthLURPI  - numFOSubsLURPI )


#RPI-LU
sizeRPILU = "rpiluNumRes" 
cSizeRPILU = "rpiluNumResCompressed"
lengthRPILU <- someData[,sizeRPILU]
compressedLengthRPILU <- someData[,cSizeRPILU]
numFOSubsRPILU <- someData[,"rpiluCFO"]
compressedLengthFinalRPILU <- compressedLengthRPILU #(compressedLengthRPILU  - numFOSubsRPILU )

randomPoints <- cbind(compressedLengthFinalRPILU,compressedLengthFinalLURPI)

#Get the data
#get LURPI-only data
alldataLURPItptp = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi.txt")
dataLURPItptp <- subset(alldataLURPItptp, select=proof:numFOSub)

compressedLengthLURPItptp <- dataLURPItptp[,"compressedLengthResOnly"]
compressedLengthLURPIFinaltptp <- compressedLengthLURPItptp
lengthLURPItptp <- dataLURPItptp[,"resOnlyLength"]

#get RPILU-only data
alldataRPILUtptp = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu.txt")
dataRPILUtptp <- subset(alldataRPILUtptp, select=proof:numFOSub)
compressedLengthRPILUtptp <- dataRPILUtptp[,"compressedLengthResOnly"]

compressedLengthRPILUFinaltptp <- compressedLengthRPILUtptp
lengthRPILUtptp <- dataRPILUtptp[,"resOnlyLength"]

tptpPoints <- cbind(compressedLengthRPILUFinaltptp,compressedLengthLURPIFinaltptp)
checkLenTPTP <- length(tptpPoints[,1])

tptpAbove <- 0
tptpBelow <-0

for(i in 1:checkLenTPTP){
    x <- tptpPoints[i,1]
	y <- tptpPoints[i,2]
	if (x > y){
        #below the line
        tptpBelow <- tptpBelow + 1
        
    } else if (x < y){
        #above the line
        tptpAbove <- tptpAbove + 1
        
    }
}


randomPointsLenTPTP <- length(randomPoints[,1])

randomPointsAbove <- 0
randomPointsBelow <-0

for(i in 1:randomPointsLenTPTP){
    x <- randomPoints[i,1]
	y <- randomPoints[i,2]
	if (x > y){
        #below the line
        randomPointsBelow <- randomPointsBelow + 1
        
    } else if (x < y){
        #above the line
        randomPointsAbove <- randomPointsAbove + 1
        
    }
}

totalAbove <- tptpAbove + randomPointsAbove
totalBelow <- tptpBelow + randomPointsBelow

print(paste("TPTP above: ", tptpAbove))
print(paste("TPTP below: ", tptpBelow))
print(paste("Random above: ", randomPointsAbove))
print(paste("Random below: ", randomPointsBelow))
print(paste("Total above: ", totalAbove))
print(paste("Total below: ", totalBelow))


