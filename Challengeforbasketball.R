myplot <- function(data,rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type="b",pch = 15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6),pch = 15:18, horiz = F)
}

myplot(FreeThrows)
myplot(FreeThrowsAttemps)


#Analysis
#1. Free Throw Attempts / Games
myplot(FreeThrowsAttemps/Games)

#2. Free Throw Accuracy
myplot(FreeThrows/FreeThrowsAttemps)

myplot(FieldGoals/FieldGoalAttempts)

#3. Player style pattern Excluding Free Throws
myplot((Points - FreeThrows)/FieldGoals)
