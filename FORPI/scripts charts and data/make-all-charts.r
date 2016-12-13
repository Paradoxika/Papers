setwd("D:/Research Scripts/GSoC14/November 2016 - Charts - R")
alldata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-data-dec1.txt")

#Random---
#LURPI vs RPILU
source("random-alg-length.R")
source("random-alg-res-length.R")

#All
source("random-all-length.R")
source("random-all-res-length.R")

#RPI
source("random-forpi-length.R")
source("random-forpi-res-length.R")

#LURPI
source("random-folurpi-length.R")
source("random-folurpi-res-length.R")

#RPILU
source("random-forpilu-length.R")
source("random-forpilu-res-length.R")

#LU
source("random-folu-length.R")
source("random-folu-res-length.R")


#Cumulative
source("random-all-cumulative-nodes.R")
source("random-all-cumulative-nodes-diff.r")

source("random-all-cumulative-rnodes.R")
source("random-all-cumulative-rnodes-diff.r")

#bar plots
rpiNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-forpi-nc-data-dec1.txt")
luNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-folu-nc-data-dec1.txt")
lurpiNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-folurpi-nc-data-dec1.txt")
rpiluNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-forpilu-nc-data-dec1.txt")
allNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-nc-data-dec1.txt")
allNCdataSepRaw = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-nc-sep-data-dec1.txt")

source("random-make-stacked.r")

#box-whisker
allRandomDataBW = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/random-all-bw-data-dec1.txt")

source("random-make-all-box-whisker.R")

#################

#TPTP---
alldataRPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpi.txt")
alldataLU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folu.txt")
alldataLURPI = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi.txt")
alldataRPILU = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu.txt")

source("tptp-forpi-length.R")
source("tptp-forpi-res-length.R")
source("tptp-folu-length.R")
source("tptp-folu-res-length.R")
source("tptp-forpilu-length.R")
source("tptp-forpilu-res-length.R")
source("tptp-folurpi-length.R")
source("tptp-folurpi-res-length.R")

source("tptp-all-length.R")
source("tptp-all-res-length.R")

#cumulative
source("tptp-all-cumulative-nodes.R")
source("tptp-all-cumulative-rnodes.R")

source("tptp-all-cumulative-nodes-diff.R")
source("tptp-all-cumulative-rnodes-diff.R")

#ordering
source("tptp-alg-length.R")
source("tptp-alg-res-length.R")

#bar plots
rpiNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpi-nc.txt")
luNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folu-nc.txt")
lurpiNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-folurpi-nc.txt")
rpiluNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-forpilu-nc.txt")
allNCdata = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-all-nc.txt")
allNCdataSepRaw = read.csv("D:/Research Scripts/GSoC14/November 2016 - Charts - R/cade-all-nc-sep.txt")

source("tptp-make-stacked.r")

#box-whisker

tptpLUbwData = read.csv("cade-folu.txt")
tptpRPIbwData = read.csv("cade-forpi.txt")
tptpLURPIbwData = read.csv("cade-folurpi.txt")
tptpRPILUbwData = read.csv("cade-forpilu.txt")

source("tptp-make-all-box-whisker.R")

