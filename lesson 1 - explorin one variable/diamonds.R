
library(ggplot2)

str(diamonds)

summary(diamonds$color)

qplot(x = price, data = diamonds)

subset(diamonds, diamonds$price > 15000)

qplot(x = price, data = diamonds, binwidth = 100) + 
  scale_x_continuous(limits = c(200, 2000), breaks = seq(200, 2000, 100))

qplot(x = price, data = diamonds, binwidth = 100) + 
  scale_x_continuous(limits = c(200, 2000), breaks = seq(200, 2000, 100)) + 
  facet_wrap(~cut)

by(diamonds$price,diamonds$cut, median)


qplot(x = price, data = diamonds) + facet_wrap(~cut)
summary(diamonds)

qplot(x = log10(price/carat), data = diamonds, binwidth = 0.1) + 
  facet_wrap(~cut)


qplot(x = cut, y = price, data = diamonds, geom = 'boxplot')

diamonds_d <- subset(diamonds, diamonds$color == "D")

summary(diamonds_d)

diamonds_j = subset(diamonds, diamonds$color == "J")
summary(diamonds_j)



IQR(subset(diamonds, color == "J")$price) 


by(diamonds$color, diamonds$co)

qplot(x = color, y = price/carat, data = diamonds, geom = 'boxplot')


qplot(x = carat, data = diamonds, geom = 'freqpoly', binwidth = 0.1) + 
  scale_y_continuous(breaks = seq(0, 15000, 1000)) + 
  scale_x_continuous(breaks = seq(0, 2, 0.1))

rm(diamonds_j)
