
library(ggplot2)

summary(diamonds$price)

ncol(diamonds)

str(diamonds)

levels(diamonds$color)

qplot(x = price, data = diamonds, binwidth = 100) + 
  scale_x_continuous(limits = c(200, 2000), breaks = seq(200, 2000, 100))


qplot(x = price, data = diamonds, binwidth = 100) + 
  scale_x_continuous(limits = c(200, 2000), breaks = seq(200, 2000, 100)) + 
  facet_wrap(~cut)

subset(diamonds, price >= 15000)


by(diamonds$price, diamonds$cut, max)

by(diamonds$price, diamonds$cut, min)

by(diamonds$price, diamonds$cut, median)

qplot(x = price, data = diamonds) + facet_wrap(~cut, scales="free_y")

qplot(x = price/carat, data = diamonds) + 
  facet_wrap(~cut)

?facet_wrap


qplot()