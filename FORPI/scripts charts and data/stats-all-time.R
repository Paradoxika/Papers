setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")

#get all data
alldata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-data-dec1.txt")
#alldata[1:6,]
someData <- subset(alldata, select=rpiProofsize:totalTime)
#someData[1:2,]
num <- length(someData)




#Get the data
#RPI
timeRPIkey = "rpiCompressTime" 
timeRPI <- someData[,timeRPIkey]

#LU
timeLUkey = "luCompressTime" 
timeLU <- someData[,timeLUkey]

#RPILU
timeRPILUkey = "rpiluCompressTime" 
timeRPILU <- someData[,timeRPILUkey]

#LURPI
timeLURPIkey = "lurpiCompressTime" 
timeLURPI <- someData[,timeLURPIkey]

#total
timeAllkey = "totalTime"
timeAll <- someData[,timeAllkey]

#total time for each
totalRPI <- sum(timeRPI)
totalLU <- sum(timeLU)
totalLURPI <- sum(timeLURPI)
totalRPILU <- sum(timeRPILU)
#total time for all
totalAll <- sum(timeAll)

#average time for each
averageRPI <- mean(timeRPI)
averageLU <- mean(timeLU)
averageLURPI <- mean(timeLURPI)
averageRPILU <- mean(timeRPILU)
#average time for all
averageAll <- mean(timeAll)


#max time for each
maxRPI <- max(timeRPI)
maxLU <- max(timeLU)
maxLURPI <- max(timeLURPI)
maxRPILU <- max(timeRPILU)
#max time for all
maxAll <- max(timeAll)

 
#min time for each
minRPI <- min(timeRPI)
minLU <- min(timeLU)
minLURPI <- min(timeLURPI)
minRPILU <- min(timeRPILU)
#min time for all
minAll <- min(timeAll)


#print out stats
cat("RPI: total, average, min, max\n")
totalRPI
averageRPI
minRPI
maxRPI
cat("LU: total, average, min, max\n")
totalLU
averageLU
minLU
maxLU
cat("LURPI: total, average, min, max\n")
totalLURPI
averageLURPI
minLURPI
maxLURPI
cat("RPILU: total, average, min, max\n")
totalRPILU
averageRPILU
minRPILU
maxRPILU
