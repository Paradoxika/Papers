#get RPI-only data
alldata = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/sorted/sorted-pairs-csvc.csv")
alldata[1:10,]
#compressedOnlyDataRPI <- subset(alldataRPI, compressRatioRes > -1, select=proof:numFOSub)
#compressedOnlyDataRPI[1:10,]
num <- length(compressedOnlyDataRPI)
num 
compressLengthRPILU<- alldata[,"foluforpi"]
compressLengthLURPI<- alldata[,"forpifolu"]

#compressLengthRPI<- compressedOnlyDataRPI[,"compressedLengthAll"]
#compressLengthResOnlyRPI <- compressedOnlyDataRPI[,"compressedLengthResOnly"]
#compressLengthResOnlyRPI 
#numFOsubRPI <- compressedOnlyDataRPI[,"numFOSub"]
#compressLengthFinalRPI <- (compressLengthRPI - (numFOsubRPI))
#initialLengthsRPI <- compressedOnlyDataRPI[,"length"]

par(mar=c(5.1,4.1,1,2.1))


#get LU-only data
alldataLU = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/CADE15 Files/Paper Writing Tools/r scripts/results-feb18.csv")
#alldataLU[1:10,]
#compressedOnlyDataLU <- subset(alldataLU, compressRatioRes > -1, select=proof:numFOSub)
#compressedOnlyDataLU[1:10,]
#num <- length(compressedOnlyDataLU)
#num 
#compressLengthLU<- compressedOnlyDataLU[,"compressedLengthAll"]
#compressLengthResOnlyLU <- compressedOnlyDataLU[,"compressedLengthResOnly"]
#compressLengthResOnlyLU 
#numFOsubLU <- compressedOnlyDataLU[,"numFOSub"]
#compressLengthFinalLU <- (compressLengthLU - (numFOsubLU))
#initialLengthsLU <- compressedOnlyDataLU[,"length"]

#combined data computations
#alldataLURPI = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/LPARResults-FORPI-Jun17b-folu-forpi.csv")
#alldataLURPI[1:10,]
setwd("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/misc/")

#alldataRPILU = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/LPARResults-FORPI-Jun17-forpi-folu.csv")
#alldataRPILU[1:10,]
#setwd("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/forpi-folu/")

#res length (x-axis) vs. compressed res length
#compressedOnlyDataRPILU <- subset(alldataRPILU, compressRatioRes > -1, select=proof:totalTime)
#compressedOnlyDataRPILU[1:10,]
#num <- length(compressedOnlyDataRPILU)
#num 
#compressLengthResOnlyRPILU <- compressedOnlyDataRPILU[,"compressedLengthResOnly"]
#compressLengthResOnlyRPILU 


#res length (x-axis) vs. compressed res length (all)
#compressedOnlyDataLURPI <- subset(alldataLURPI, compressRatioRes > -1, select=proof:totalTime)
#compressedOnlyDataLURPI[1:10,]
#num <- length(compressedOnlyDataLURPI)
#num 
#compressLengthResOnlyLURPI <- compressedOnlyDataLURPI[,"compressedLengthAll"]
#compressLengthResOnlyLURPI 
#LURPIcompressedLenth <- (compressedOnlyDataLURPI[,"compressedLengthAll"]- compressedOnlyDataLURPI[,"numFOSub"])
#RPILUcompressedLenth <- (compressedOnlyDataRPILU[,"compressedLengthAll"]- compressedOnlyDataRPILU[,"numFOSub"])
#RPILUcompressedLenthB <- RPILUcompressedLenth[0:291]
#RPILUcompressedLenth <- RPILUcompressedLenthB
#RPILUcompressedLenthU <- unique(RPILUcompressedLenth)
#LURPIcompressedLenthU <- unique(LURPIcompressedLenth)
#length(LURPIcompressedLenth)
#length(RPILUcompressedLenth)
#vsData <- cbind(LURPIcompressedLenth, RPILUcompressedLenth)
pdf('forpi-folu-vs-folu-forpi-length_vs_compress_length_all_proofs-b.pdf', height=5, width=5)
#plot(compressedLengthAll~ length, compressedOnlyDataLURPI, axes=FALSE, xlab="Proof Length", ylab="Compressed Length", main = "Compressed Length vs.\n Proof Length\nIncluding Uncompressed Proofs")
#plot(LURPIcompressedLenthU,RPILUcompressedLenthU ,  xlim=c(0,50), ylim=c(0,50),axes=FALSE, xlab="Compressed Proof Length (LU-RPI)", ylab="Compressed Proof Length (RPI-LU)", main = "GFOLU-FORPI Compressed Proof Length vs.\n FORPI-GFOLU Compressed Length\nIncluding Uncompressed Proofs",yaxs="i", xaxs="i")
par(mar=c(5.1,4.1,1,2.1))

plot(compressLengthRPILU,compressLengthLURPI ,  xlim=c(0,50), ylim=c(0,50),axes=FALSE, xlab="Compressed Proof Length (GFOLU(FORPI(p)))", ylab="Compressed Proof Length (FORPI(GFOLU(p)))",yaxs="i", xaxs="i")

abline(0,1)
#lengths <- sort(unique(compressedOnlyDataLURPI[,"length"]))
ylabelsV = seq(0,50, by =2)
axis(1, at=ylabelsV , seq(0,50, by =2), las=2)
ylabelsV = seq(0,50, by =2)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
abline(v=50)
abline(h=50)

#other <-cbind(compressedOnlyDataRPILU[,"length"], RPILUcompressedLenth )
#points(other,col="red",pch=4)
#rpionly <-cbind(compressedOnlyDataRPI[,"length"], compressLengthFinalRPI)
#points(rpionly ,col="blue",pch=2)

#luonly <-cbind(compressedOnlyDataLU[,"length"], compressLengthFinalLU)
#points(luonly ,col="green",pch=3)
#legend("topleft",c("FOLU(FORPI(p))", "FORPI(FOLU(p))", "FORPI(p)", "FOLU(p)"), pch=c(1,4,2,3), col=c("black","red", "blue", "green"))

dev.off()