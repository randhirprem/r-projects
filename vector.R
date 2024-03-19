MyFirstVector <- c(3, 45, 56, 732)
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L,12L, 243L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("A","B", "hELLO", 7)
is.numeric(V3)
is.integer(V3)
is.double(V3)
is.character(V3)


seq() # sequence - like ":"
rep()# replicate

seq(1,15)
1:15

seq(1,15,2)

z <- seq(1,15,4)
z

rep(3,50)
d <- rep(3, 50)

rep("a",7)

x<- c(30,20)
rep(x,20)