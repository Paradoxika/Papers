setwd("D:/Research Scripts/GSoC14/August 2017b - Charts - R")

#get all data
alldata = read.csv("D:/Research Scripts/GSoC14/August 2017b - Charts - R/random-all-data-aug22.txt")
#alldata[1:6,]
someData <- subset(alldata, select=rpiProofsize:totalTime)
#someData[1:2,]
num <- length(someData)
num 

#Get the data
#RPILU
sizeRPILU = "rpiluProofsize" #or rpiNumRes
cSizeRPILU = "rpiluCompressedSize" #or "rpiNumResCompressed"
lengthRPILU <- someData[,sizeRPILU]
compressedLengthRPILU <- someData[,cSizeRPILU]
numFOSubsRPILU <- someData[,"rpiluCFO"]
compressedLengthFinalRPILU <- (compressedLengthRPILU  - numFOSubsRPILU )


#RPI check
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
    #if(cL < 20 & oL > 200){
    #    cat("Blue dot found: ")
    #    cat(i)
	#	cat(" ") 
	#	cat(dataPoints[i,1]) 
	#	cat(" ")
	#	cat(dataPoints[i,2]) 
    #    cat("\n")
    #}
    if(cL < 1){
        cat("Negative found: ")
        cat(i)
		cat(" ") 
		cat(dataPoints[i,1]) 
		cat(" ")
		cat(dataPoints[i,2]) 
        cat("\n")
    }    
}

