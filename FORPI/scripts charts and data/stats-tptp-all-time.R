#setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")
setwd("D:/Git Repositories/Papers/FORPI/scripts charts and data")

#times for TPTP data are in nano seconds

#Get the tptp data
#get RPI-only data
alldataRPI = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-forpi.txt")
#get RPILU-only data
alldataRPILU = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-forpilu.txt")
#get LURPI-only data
alldataLURPI = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-folurpi.txt")
#get LU-only data
alldataLU = read.csv("D:/Git Repositories/Papers/FORPI/scripts charts and data/cade-folu.txt")

overflowReducitonVal <- 100

#Get the data
#RPI
timeRPIkey = "totalTime" 
timeRPI <- alldataRPI[,timeRPIkey]/overflowReducitonVal

#LU
timeLUkey = "totalTime" 
timeLU <- alldataLU[,timeLUkey]/overflowReducitonVal

#RPILU
timeRPILUkey = "totalTime" 
timeRPILU <- alldataRPILU[,timeRPILUkey]/overflowReducitonVal

#LURPI
timeLURPIkey = "totalTime" 
timeLURPI <- alldataLURPI[,timeLURPIkey]/overflowReducitonVal

#total
timeAll <- timeRPI + timeLU + timeRPILU + timeLURPI

#total time for each
totalRPI <- sum(timeRPI)*overflowReducitonVal
totalLU <- sum(timeLU)*overflowReducitonVal
totalLURPI <- sum(timeLURPI)*overflowReducitonVal
totalRPILU <- sum(timeRPILU)*overflowReducitonVal
#total time for all
totalAll <- sum(timeAll)*overflowReducitonVal

#average time for each
averageRPI <- mean(timeRPI)*overflowReducitonVal
averageLU <- mean(timeLU)*overflowReducitonVal
averageLURPI <- mean(timeLURPI)*overflowReducitonVal
averageRPILU <- mean(timeRPILU)*overflowReducitonVal
#average time for all
averageAll <- mean(timeAll)*overflowReducitonVal


#max time for each
maxRPI <- max(timeRPI)*overflowReducitonVal
maxLU <- max(timeLU)*overflowReducitonVal
maxLURPI <- max(timeLURPI)*overflowReducitonVal
maxRPILU <- max(timeRPILU)*overflowReducitonVal
#max time for all
maxAll <- max(timeAll)*overflowReducitonVal

 
#min time for each
minRPI <- min(timeRPI)*overflowReducitonVal
minLU <- min(timeLU)*overflowReducitonVal
minLURPI <- min(timeLURPI)*overflowReducitonVal
minRPILU <- min(timeRPILU)*overflowReducitonVal
#min time for all
minAll <- min(timeAll)*overflowReducitonVal


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


totalAll