#Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

#* if you need the file to have items as a factor stats <- read.csv(file.choose(), stringsAsFactors = T)

#Method 2: Set WD & READ DATA
getwd()
setwd("/Users/randhirprem/Desktop/r-projects")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data - P2-Demographic-Data.csv", stringsAsFactors = T)
stats

#------------------------------------------------------------
#Explore data
nrow(stats)# number of rows
ncol(stats)#number of columns
head(stats)#Top 5
tail(stats)#bottom 5
head(stats, n=10) # top 10
tail(stats, n=15)# bottom 15
str(stats) # structure
summary(stats)

#----------------------------------------------------------------
#Using $ sign
stats
head(stats)
stats[3, 3]
stats[3, "Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)

stats$Income.Group <- factor(stats$Income.Group) # turns the items into a factor
levels(stats$Income.Group)
summary(stats)
head(stats)
#--------------------------------------------------------------------
#Basic operations with a DF
stats[1:10,]#subsetting
stats[3:9,]
stats[c(4,100),]
#Remember how the [ ] works:
stats[1,]
is.data.frame(stats[1,])

stats[,1]
is.data.frame(stats[,1])
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])

#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users

#add column
head(stats)
#stats$MyCalc <- stats$Birth.rate * stats$Internet.users

# stats$xyz <- 1:5
#head(stats, n=12)

#remove colum
head(stats)
#stats$MyCalc <- NULL
#stats$xyz <- NULL

#------------------ Filtering Data Frames
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
stats[stats$Birth.rate > 30 & stats$Income.Group == "High income",]

stats[stats$Country.Name == "Malta",]

#---------------------Introduction to qplot
#install.packages("ggplot2")
#library(ggplot2)
?qplot

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),colour=I("blue"))

qplot(data=stats, x=Income.Group, y=Birth.rate, geom = "boxplot")
#---------------------Introduction to qplot visualising
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      colour=I("red"),size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate,
      colour=Income.Group,size=I(1))
#----------------------Create data frame--------------------------
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
mydf
head(mydf)
#colnames(mydf) <- c("Country", " Code", "Region")
#head(mydf)
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
head(mydf)
#------------------- merging df
head(stats)
head(mydf)
merged <- merge(stats,mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)

#--------------------Visualising Qplot 2
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Regions_2012_Dataset)
#Shape
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(1), shape=I(23))
#Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(1), shape=I(19),
      alpha=I(0.6))
#Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(1), shape=I(19),
      alpha=I(0.6),
      main="Birth Rate vs Internet Users")
