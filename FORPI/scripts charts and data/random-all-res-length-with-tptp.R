#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")
setwd("D:/Git Repositories/Papers/FORPI/scripts charts and data")

#get all data
alldata = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/random-all-data-dec1s.txt")
someData <- subset(alldata, select=rpiProofsize:totalTime)
num <- length(someData)
num 

#Get the data
#RPI
sizeRPI = "rpiNumRes" #or rpiNumRes
cSizeRPI = "rpiNumResCompressed" #or "rpiNumResCompressed"
lengthRPI <- someData[,sizeRPI]
compressedLengthRPI <- someData[,cSizeRPI]
numFOSubsRPI <- someData[,"rpiCFO"]
compressedLengthFinalRPI <- compressedLengthRPI #(compressedLengthRPI  - numFOSubsRPI )
rpiXlim <- max(unique(lengthRPI)) + 1
rpiYlim <- max(unique(compressedLengthFinalRPI)) + 1


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
###---
luXlim <- max(unique(lengthLU)) + 1
luYlim <- max(unique(compressedLengthFinalLU)) + 1

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
sizeRPILU = "rpiluNumRes" #or luNumRes
cSizeRPILU = "rpiluNumResCompressed" #or "luNumResCompressed"
lengthRPILU <- someData[,sizeRPILU]
compressedLengthRPILU <- someData[,cSizeRPILU]
numFOSubsRPILU <- someData[,"rpiluCFO"]
compressedLengthFinalRPILU <- compressedLengthRPILU #(compressedLengthRPILU  - numFOSubsRPILU )
rpiluXlim <- max(unique(lengthRPILU)) + 1
rpiluYlim <- max(unique(compressedLengthFinalRPILU)) + 1

#TPTP stuff--------------

alldataRPItptp = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpi.txt")
dataRPItptp <- subset(alldataRPItptp, select=proof:numFOSub)
numtptp <- length(dataRPItptp)
compressedLengthResOnlyRPItptp <- dataRPItptp[,"compressedLengthResOnly"]
initialResLengthsRPItptp <- dataRPItptp[,"resOnlyLength"]


#get LU-only data
alldataLUtptp = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folu.txt")
dataLUtptp <- subset(alldataLUtptp, select=proof:numFOSub)
numtptp <- length(dataLUtptp)
compressedLengthResOnlyLUtptp <- dataLUtptp[,"compressedLengthResOnly"]
initialResLengthsLUtptp <- dataLUtptp[,"resOnlyLength"]
 

#get LURPI-only data
alldataLURPItptp = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi.txt")
dataLURPItptp <- subset(alldataLURPItptp, select=proof:numFOSub)
numtptp <- length(dataLURPItptp)
compressedLengthResOnlyLURPItptp <- dataLURPItptp[,"compressedLengthResOnly"]
initialResLengthsLURPItptp <- dataLURPItptp[,"resOnlyLength"]


#get RPILU-only data
alldataRPILUtptp = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu.txt")
dataRPILUtptp <- subset(alldataRPILUtptp, select=proof:numFOSub)
numtptp <- length(dataRPILUtptp) 
compressedLengthResOnlyRPILUtptp <- dataRPILUtptp[,"compressedLengthResOnly"]
initialResLengthsRPILUtptp <- dataRPILUtptp[,"resOnlyLength"]

rpiPointstptp <- cbind(dataRPItptp[,"resOnlyLength"],compressedLengthResOnlyRPItptp)
luPointstptp <-cbind(dataLUtptp[,"resOnlyLength"], compressedLengthResOnlyLUtptp )
rpiluPointstptp <-cbind(dataRPILUtptp[,"resOnlyLength"], compressedLengthResOnlyRPILUtptp)
lurpiPointstptp <-cbind(dataLURPItptp[,"resOnlyLength"], compressedLengthResOnlyLURPItptp)




#TPTP stuff--------------



axisLimitX = max(rpiXlim, luXlim, rpiluXlim, lurpiXlim)
axisLimitY = max(rpiYlim, luYlim, rpiluYlim, lurpiYlim)
axisLimit = max(axisLimitX, axisLimitY)

pdf('combined-all-res-length-vs-compressed-res-length.pdf', height=6, width=6)
par(mar=c(5.1,5.1,1,2.1))

plot(lengthRPI,compressedLengthFinalRPI ,  xlim=c(0,axisLimit), ylim=c(0,axisLimit ),axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)",yaxs="i", xaxs="i")

luPoints <-cbind(lengthLU, compressedLengthFinalLU )
points(luPoints,col="red",pch=4)
rpiluPoints <-cbind(lengthRPILU, compressedLengthFinalRPILU )
points(rpiluPoints,col="blue",pch=2)
lurpiPoints <-cbind(lengthLURPI, compressedLengthFinalLURPI)
points(lurpiPoints,col="green",pch=3)
legend("topleft",c("FORPI(p)", "GFOLU(p)", "FORPI(GFOLU(p))", "GFOLU(FORPI(p))"), pch=c(1,4,2,3), col=c("black","red", "blue", "green"), bty="n")


points(lurpiPointstptp,col="green",pch=3)
points(rpiPointstptp,col="black",pch=7) #TODO: change
points(luPointstptp,col="red",pch=4)
points(rpiluPointstptp,col="blue",pch=2)

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

#add the zoomed view for TPTP data
horizontalScale <- 3
verticalScale <- 3
horizontalOffset <- 40
verticalOffset <- 180


rpiPointstptpScaled <- cbind(dataRPItptp[,"resOnlyLength"]*horizontalScale + horizontalOffset,compressedLengthResOnlyRPItptp*verticalScale + verticalOffset)
luPointstptpScaled <-cbind(dataLUtptp[,"resOnlyLength"]*horizontalScale + horizontalOffset, compressedLengthResOnlyLUtptp*verticalScale + verticalOffset )
rpiluPointstptpScaled <-cbind(dataRPILUtptp[,"resOnlyLength"]*horizontalScale + horizontalOffset, compressedLengthResOnlyRPILUtptp*verticalScale + verticalOffset)
lurpiPointstptpScaled <-cbind(dataLURPItptp[,"resOnlyLength"]*horizontalScale + horizontalOffset, compressedLengthResOnlyLURPItptp*verticalScale + verticalOffset)

inlayWidth <- (max(max(max(rpiPointstptp[,1]),max(luPointstptp[,1])),max(max(rpiluPointstptp[,1]),max(lurpiPointstptp[,1]))))
inlayWidthScaled <- inlayWidth*horizontalScale
inlayHeight <- (max(max(max(rpiPointstptp[,2]),max(luPointstptp[,2])),max(max(rpiluPointstptp[,2]),max(lurpiPointstptp[,2]))))
inlayHeightScaled <- inlayHeight*verticalScale


#connecting lines
segments(0,0,horizontalOffset, verticalOffset, lty='dotted') #bottom left
segments(inlayWidth,0,horizontalOffset+inlayWidthScaled+5, verticalOffset, lty='dotted') #bottom right
segments(0,inlayHeight,horizontalOffset, verticalOffset+inlayHeightScaled+5, lty='dotted') #top left
segments(inlayWidth,inlayHeight,horizontalOffset+inlayWidthScaled+5, verticalOffset+inlayHeightScaled+5, lty='dotted') #top right

#also does the border
rect(horizontalOffset,verticalOffset, horizontalOffset+inlayWidthScaled+5, verticalOffset+inlayHeightScaled+5,col='white')

points(lurpiPointstptpScaled,col="green",pch=3)
points(rpiPointstptpScaled,col="black",pch=7) #TODO: change
points(luPointstptpScaled,col="red",pch=4)
points(rpiluPointstptpScaled,col="blue",pch=2)

#inlay y=x line
segments(horizontalOffset , verticalOffset, horizontalOffset+inlayWidthScaled+5, verticalOffset+inlayHeightScaled+5)

#window outline
segments(inlayWidth , 0, inlayWidth, inlayHeight , lty='dotted')
segments(0 , inlayHeight , inlayWidth, inlayHeight , lty='dotted')


inlayXlabelPositions <- seq(0,90, by=30) + horizontalOffset
axis(1, at=inlayXlabelPositions , labels=seq(0,30, by =10),las=2, pos=c(verticalOffset,horizontalOffset))

inlayYlabelPositions <- seq(0,90, by=30) + verticalOffset
axis(2, at=inlayYlabelPositions , labels=seq(0,30, by =10),las=2, pos=c(horizontalOffset,verticalOffset))


dev.off()

