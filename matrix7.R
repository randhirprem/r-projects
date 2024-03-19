Data <- MinutesPlayed[1:3,]
Data
matplot(t(Data), type="b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4,6),pch = 15:18, horiz = F)
#-----------------------------------------------------------------------------------------------------

Data <- MinutesPlayed[1,,drop=F]
matplot(t(Data), type="b",pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6),pch = 15:18, horiz = F)
#----------------------------------------------------------------------------------------


#FUNCTION
myplot <- function(data,rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type="b",pch = 15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6),pch = 15:18, horiz = F)
}
myplot(Salary,1:2)
myplot(Games)
#---------------------------------------------------------------
#Analysis

#Salary
myplot(Salary)
myplot(Salary/Games)
myplot(Salary / FieldGoals)

#In-Game Metrics
myplot(MinutesPlayed)
myplot(Points)

#In-Game Metrics Normalised
myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)

#Interesting Observation
myplot(MinutesPlayed/Games)
myplot(Games)

#Time is valuable
myplot(FieldGoals/MinutesPlayed)

#Player Style
myplot(Points/FieldGoals)

myplot()
