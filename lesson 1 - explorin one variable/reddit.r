
getwd()

setwd('/media/ravi/Backup/r workspace')
reddit <- read.csv('reddit.csv')

?factor


str(reddit)

reddit$employment.status

table(reddit$employment.status)

remove(reddit)

?table

summary(reddit)

levels(reddit$age.range)

library(ggplot2)
qplot(data = reddit, x = age.range)
