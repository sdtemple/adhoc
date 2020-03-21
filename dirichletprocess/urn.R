# Blackwell-MacQueen urn sampling scheme ----------------------------------
rurn <- function(n = 1, alpha, numcells){
  urn <- rep(0, alpha)
  for(i in 1:n){
    ball <- sample(urn, 1)
    if(ball == 0){
      color <- rmultinom(1, 1, rep(1 / numcells, numcells))
      urn <- c(urn, which(color != 0, arr.ind = T)[1])
    }
    else{
      urn <- c(urn, ball)
    }
  }
  return(urn[(alpha + 1):length(urn)])
}
