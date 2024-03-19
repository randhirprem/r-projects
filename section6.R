getwd()
setwd("/Users/randhirprem/Desktop/r-projects")
getwd()

movies <- read.csv("P2-Movie-Ratings - P2-Movie-Ratings.csv",stringsAsFactors = T)
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)


factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)
#-------------Aesthetics---------
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) 

#add geom

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + geom_point()

#colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) + geom_point()

#size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        colour=Genre, size=Genre)) + geom_point()

#size better way
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        colour=Genre, size=BudgetMillions)) + geom_point()
#>>>> this is #1 (we will improve it)

#-------------Plotting With Layers---------
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre, size=BudgetMillions))
# Point
p + geom_point()
# Line
p + geom_line()

#Multiple layes
p + geom_point() +geom_line()
p + geom_line() +geom_point()

#---------Overriding Aesthetics -------

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre, size=BudgetMillions))
#add geom Layer
q + geom_point()

#overriding Aestics
#eg1
q + geom_point(aes(size=CriticRating))
#eg2
q + geom_point(aes(colour=BudgetMillions))
#q remains the same
q + geom_point()

#eg3
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$")

#eg4
q + geom_line() + geom_point()
#reduce line size
q + geom_line(size=1) + geom_point()

#----------------------- mapping vs setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()           

#Add Colour
#1.Mapping
r + geom_point(aes(colour=Genre))

#2. Setting
r + geom_point(colour = "DarkGreen")
#Error
#r + geom_point(aes(colour="DarkGreen"))

# Mapping
r + geom_point(aes(size=BudgetMillions))
#setting
r + geom_point(size=10)
#error
#r + geom_point(aes(size=10))

#----------Histograms and density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#add colour
s + geom_histogram(binwidth = 10, fill="green")
s + geom_histogram(binwidth = 10, aes(fill=Genre))
#add border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
#>> 3(we will improve)

#sometime you may need density chart
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position = "stack")

#----------------Starting Layer--------
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill="White", colour="Blue")

#another way:
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="White", colour="Blue")
#>> 4
t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White", colour="Blue")
#>>>> 5
t <- ggplot()

#--------------------Statistical Transformation----------
?geom_smooth
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#BOXPLOTS
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip hack
u + geom_boxplot(size=1.2) + geom_jitter()
# another way:
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
#>>>6
#-------------using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

#facets
v + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   colour="Black") + 
  facet_grid(Genre~., scales="free")

#scatterplot
w <- ggplot(data=movies,aes(x=CriticRating, y=AudienceRating,
                            colour=Genre))
w + geom_point(size=3)
#Facets
w + geom_point(size=3) +
  facet_grid(Genre~.)

w + geom_point(size=3) +
  facet_grid(.~Year)

w + geom_point(size=3) +
  facet_grid(Genre~Year)

w + geom_point(size=3) +
  geom_smooth() +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)

#>>> 1 still will improve

#----------Coordinates

# Limits

#Zoom
m <- ggplot(data=movies,aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             colour=Genre))
m + geom_point()

m + geom_point() + 
  xlim(50,100) +
  ylim(50,100)

#wont work well always
n <- ggplot(data=movies, aes(x=BudgetMillions))

n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  ylim(0,50)

#instead -zoom
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") + 
  coord_cartesian(ylim=c(0,50))

#improve #1
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) + coord_cartesian(ylim=c(0,100))
#-------------- Theme
o <- ggplot(data=movies, aes(x=BudgetMillions))

h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

h
#axis label
h + 
  xlab("Money Axis") +
  ylab("Number of Movies")

#label formatting
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "Dark Green", size=30),
        axis.title.y = element_text(colour = "Red", size=30))
# tick mark formatting
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "Dark Green", size=30),
        axis.title.y = element_text(colour = "Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))

# legend mark formatting
# tick mark formatting
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") + 
  theme(axis.title.x = element_text(colour = "Dark Green", size=30),
        axis.title.y = element_text(colour = "Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour = "DarkBlue",
                                  size=40, family="Courier")
        )

