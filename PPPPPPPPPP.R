N <- 1000000
a <- rnorm(N)
b <- rnorm(N)

c <- a * b

# de-vectorised approach
d  <- rep(NA,N)
for (i in 1:N){
  d[i] <- a[i] * b[i]
}