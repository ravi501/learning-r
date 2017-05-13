
# Create a histogram of diamond prices.
# Facet the histogram by diamond color
# and use cut to color the histogram bars.

# The plot should look something like this.
# http://i.imgur.com/b5xyrOu.jpg

# Note: In the link, a color palette of type
# 'qual' was used to color the histogram using
# scale_fill_brewer(type = 'qual')

names(diamonds)

qplot(data = diamonds, x = table, y = price) + 
  geom_point(aes(color = cut)) + 
  scale_x_continuous(breaks = seq(50, 80, 2))


# Create a scatterplot of diamond price vs.
# volume (x * y * z) and color the points by
# the clarity of diamonds. Use scale on the y-axis
# to take the log10 of price. You should also
# omit the top 1% of diamond volumes from the plot.

# Note: Volume is a very rough approximation of
# a diamond's actual volume.

# The plot should look something like this.
# http://i.imgur.com/excUpea.jpg

# Note: In the link, a color palette of type
# 'div' was used to color the scatterplot using
# scale_color_brewer(type = 'div')
library(ggplot2)

diamonds$volume <- diamonds$x * diamonds$y * diamonds$z

ggplot(aes(y = price, x = volume),
       data = diamonds)  + 
  geom_point(aes(color = clarity))  + 
  scale_x_log10() + 
  coord_cartesian(ylim = c(quantile(diamonds$price, 0.01), quantile(diamonds$price, 0.99))) + 
  scale_color_brewer(type = 'div')


# Your task is to create a new variable called 'prop_initiated'
# in the Pseudo-Facebook data set. The variable should contain
# the proportion of friendships that the user initiated.
pf$prop_initiated <- pf$friendships_initiated / pf$friend_count


# Create a line graph of the median proportion of
# friendships initiated ('prop_initiated') vs.
# tenure and color the line segment by
# year_joined.bucket.

# Recall, we created year_joined.bucket in Lesson 5
# by first creating year_joined from the variable tenure.
# Then, we used the cut function on year_joined to create
# four bins or cohorts of users.

# (2004, 2009]
# (2009, 2011]
# (2011, 2012]
# (2012, 2014]

# The plot should look something like this.
# http://i.imgur.com/vNjPtDh.jpg
# OR this
# http://i.imgur.com/IBN1ufQ.jpg

ggplot(aes(x = tenure, y = prop_initiated, color = year_joined.bucket), data = pf) + 
  geom_line(stat='summary', fun.y=median, na.rm=TRUE)


# For the group with the largest proportion of friendships initiated, what is the group's
# average proportion of friendship's initiated?
mean(pf$prop_initiated[pf$year_joined.bucket == '(2012, 2014]'], na.rm = TRUE)


# Create a scatter plot of the price/carat ratio
# of diamonds. The variable x should be
# assigned to cut. The points should be colored
# by diamond color, and the plot should be
# faceted by clarity.
# The plot should look something like this.
# http://i.imgur.com/YzbWkHT.jpg.
# Note: In the link, a color palette of type
# 'div' was used to color the histogram using
# scale_color_brewer(type = 'div')

ggplot(diamonds, aes(x=cut, y=price/carat, color=color)) +
  geom_point(position=position_jitter(), alpha=0.33) + 
  facet_wrap(~clarity) +
  scale_color_brewer(type='div')

  
  