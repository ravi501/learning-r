

library('ggplot2')

ggplot(aes(x = x, y = price), data = diamonds) + 
  geom_point()

?diamonds

cor.test(diamonds$price, diamonds$z)


ggplot(aes(x = depth, y = price), data = diamonds) + 
  geom_point()

ggplot(aes(x = depth, y = price), data = diamonds) + 
  geom_point(alpha = 1/100) + 
  scale_x_continuous(breaks = seq(50, 70, 2))

cor.test(diamonds$depth, diamonds$price)


# Create a scatterplot of price vs carat
# and omit the top 1% of price and carat
# values.
ggplot(aes(x = carat, y = price), data = diamonds) + 
  geom_point() + 
  xlim(0, quantile(diamonds$carat, 0.99)) + 
  ylim(0, quantile(diamonds$price, 0.99))


# Create a scatterplot of price vs. volume (x * y * z).
# This is a very rough approximation for a diamond's volume.
# Create a new variable for volume in the diamonds data frame.
# This will be useful in a later exercise.
# Don't make any adjustments to the plot just yet.
diamonds$volume <- ggplot(aes(x = volume, y = price), data = diamonds)

ggplot(aes(x = x * y * z, y = price), data = diamonds) + 
  geom_point()


# What's the correlation between price and volume?
# Exclude diamonds that have a volume of 0 or that are greater than or equal to 800
diamonds$volume <- diamonds$x * diamonds$y * diamonds$z
omitted = subset(diamonds, volume < 800)
omitted <- subset(diamonds, volume != 0 & volume < 800)
cor.test(x = omitted$volume, y = omitted$price, data = omitted)


# Subset the data to exclude diamonds with a volume
# greater than or equal to 800. Also, exclude diamonds
# with a volume of 0. Adjust the transparency of the
# points and add a linear model to the plot. (See the
# Instructor Notes or look up the documentation of
# geom_smooth() for more details about smoothers.)

ggplot(aes(x = volume, y = price), data = omitted) + 
  geom_line() + 
  geom_smooth()


# Use the function dplyr package
# to create a new data frame containing
# info on diamonds by clarity.

# Name the data frame diamondsByClarity

# The data frame should contain the following
# variables in this order.

#       (1) mean_price
#       (2) median_price
#       (3) min_price
#       (4) max_price
#       (5) n

# where n is the number of diamonds in each
# level of clarity.
library(dplyr)

diamondsByClarity <- diamonds %>%
  group_by(clarity) %>%
  summarise(mean_price = mean(price),
            median_price = median(price),
            min_price = min(price),
            max_price = max(price),
            n = n())

# We’ve created summary data frames with the mean price
# by clarity and color. You can run the code in R to
# verify what data is in the variables diamonds_mp_by_clarity
# and diamonds_mp_by_color.

# Your task is to write additional code to create two bar plots
# on one output image using the grid.arrange() function from the package
# gridExtra.
diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))



  

