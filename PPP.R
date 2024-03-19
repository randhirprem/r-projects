library(ggplot2)
?diamonds

qplot(data=diamonds, carat, price, colour=clarity, facets=.~clarity)
 