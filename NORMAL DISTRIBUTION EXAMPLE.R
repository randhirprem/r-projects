
N <- 1000000
counter <- 0
for(i in rnorm(N)){
  if(i > -1 & i < 1){
    counter <- counter + 1
  }
}
counter / N

# compare to 1 std deviation 68.2 %
