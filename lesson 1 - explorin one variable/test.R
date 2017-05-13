getwd()

setwd('/media/ravi/Backup/r workspace')

statesInfo <- read.csv('stateData.csv')

subset(statesInfo, state.region == 1)

stateSubset <- statesInfo[statesInfo$state.region == 1,]
head(stateSubset, 2)
dim(stateSubset)


?subset

?head

?dim