#get RPI-only data
alldataRPI = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/LPARResults-FORPI-Jun9b.csv")
alldataRPI[1:10,]
compressedOnlyDataRPI <- subset(alldataRPI, compressRatioRes > -1, select=proof:numFOSub)
compressedOnlyDataRPI[1:10,]
num <- length(compressedOnlyDataRPI)
num 
compressLengthRPI<- compressedOnlyDataRPI[,"compressedLengthAll"]
compressLengthResOnlyRPI <- compressedOnlyDataRPI[,"compressedLengthResOnly"]
compressLengthResOnlyRPI 
numFOsubRPI <- compressedOnlyDataRPI[,"numFOSub"]
compressLengthFinalRPI <- (compressLengthRPI - (numFOsubRPI))
initialLengthsRPI <- compressedOnlyDataRPI[,"length"]



#get LU-only data
alldataLU = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/CADE15 Files/Paper Writing Tools/r scripts/results-feb18.csv")
alldataLU[1:10,]
compressedOnlyDataLU <- subset(alldataLU, compressRatioRes > -1, select=proof:numFOSub)
compressedOnlyDataLU[1:10,]
num <- length(compressedOnlyDataLU)
num 
compressLengthLU<- compressedOnlyDataLU[,"compressedLengthAll"]
compressLengthResOnlyLU <- compressedOnlyDataLU[,"compressedLengthResOnly"]
compressLengthResOnlyLU 
numFOsubLU <- compressedOnlyDataLU[,"numFOSub"]
compressLengthFinalLU <- (compressLengthLU - (numFOsubLU))
initialLengthsLU <- compressedOnlyDataLU[,"length"]

#combined data computations
alldataLURPI = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/LPARResults-FORPI-Jun17b-folu-forpi.csv")
alldataLURPI[1:10,]
setwd("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/misc/")

alldataRPILU = read.csv("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/LPARResults-FORPI-Jun17-forpi-folu.csv")
alldataRPILU[1:10,]
#setwd("C:/Users/Jan/Documents/Google Summer of Code 2014/LPAR-20 Files/R scripts - pre-writing/forpi-folu/")

#res length (x-axis) vs. compressed res length
compressedOnlyDataRPILU <- subset(alldataRPILU, compressRatioRes > -1, select=proof:compressSpeedRes)
compressedOnlyDataRPILU[1:10,]
num <- length(compressedOnlyDataRPILU)
num 
compressLengthResOnlyRPILU <- compressedOnlyDataRPILU[,"compressedLengthResOnly"]
compressLengthResOnlyRPILU 


#res length (x-axis) vs. compressed res length
compressedOnlyDataLURPI <- subset(alldataLURPI, compressRatioRes > -1, select=proof:compressSpeedRes)
compressedOnlyDataLURPI[1:10,]
num <- length(compressedOnlyDataLURPI)
num 
compressLengthResOnlyLURPI <- compressedOnlyDataLURPI[,"compressedLengthResOnly"]
compressLengthResOnlyLURPI 
pdf('res_length_vs_compress_res_length.pdf')
plot(compressLengthResOnlyLURPI ~ resOnlyLength, compressedOnlyDataLURPI, axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)", main = "Compressed Resolution Length vs.\n Proof Resolution Length", xlim=c(0,28), ylim=c(0,28), xaxs="i", yaxs="i")
abline(0,1)
abline(h=28)
abline(v=28)
abline(v=0)
abline(h=0)
lengths <- sort(unique(compressedOnlyDataLURPI[,"resOnlyLength"]))
axis(1, at=c(0:29), labels=c(0:29), las=2)
ylabelsV = seq(0,29, by =1)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
dev.off()

#res length (x-axis) vs. compressed res length (all)
compressedOnlyDataLURPI <- subset(alldataLURPI, compressRatioRes > -1, select=proof:compressSpeedRes)
compressedOnlyDataLURPI[1:10,]
num <- length(compressedOnlyDataLURPI)
num 
compressLengthResOnlyLURPI <- compressedOnlyDataLURPI[,"compressedLengthResOnly"]
compressLengthResOnlyLURPI 
pdf('everything-forpi-folu-res_length_vs_compress_res_length_all_proofs.pdf', height=5, width=5)
par(mar=c(5.1,4.1,1,2.1))

#plot(compressLengthResOnlyLURPI ~ resOnlyLength, compressedOnlyDataLURPI, xlim=c(0,32),ylim=c(0,32), axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)", main = "Compressed Resolution Length vs.\n Proof Resolution Length\nIncluding Uncompressed Proofs",yaxs="i", xaxs="i")
plot(compressLengthResOnlyLURPI ~ resOnlyLength, compressedOnlyDataLURPI, xlim=c(0,32),ylim=c(0,32), axes=FALSE, xlab="Proof Length (Resolutions)", ylab="Compressed Length (Resolutions)",yaxs="i", xaxs="i")
abline(0,1)
lengths <- sort(unique(compressedOnlyDataLURPI[,"resOnlyLength"]))
axis(1, at=c(0:40), labels=c(0:40), las=2)
ylabelsV = seq(0,40, by =1)
axis(2, at=ylabelsV , labels=ylabelsV  , las=2)
other <-cbind(compressedOnlyDataRPILU[,"resOnlyLength"], compressedOnlyDataRPILU[,"compressedLengthResOnly"])
points(other,col="red",pch=4)
rpionly <-cbind(compressedOnlyDataRPI[,"resOnlyLength"], compressedOnlyDataRPI[,"compressedLengthResOnly"])
points(rpionly ,col="blue",pch=2)
abline(v=32)
abline(h=32)

luonly <-cbind(compressedOnlyDataLU[,"resOnlyLength"], compressedOnlyDataLU[,"compressedLengthResOnly"])
points(luonly ,col="green",pch=3)
legend("topleft",c("GFOLU(FORPI(p))", "FORPI(GFOLU(p))", "FORPI(p)", "GFOLU(p)"), pch=c(1,4,2,3), col=c("black","red", "blue", "green"))

dev.off()