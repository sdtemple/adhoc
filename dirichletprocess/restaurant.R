# Chinese restaurant process ----------------------------------------------
restaurant <- function(n = 2, theta, alpha){
  if(alpha > 1){
    stop("invalid inputs")
  }
  if((alpha >= 0) & (alpha < 1)){
    if(theta <= -alpha){
      stop("invalid inputs")
    }
  }
  if(alpha < 0){
    if(((theta / alpha) %% 1) != 0){
      stop("invalid inputs")
    }
  }
  
  sample <- list("1" = 1)
  for(i in 2:n){
    u <- runif(1, min = 0, max = 1)
    l <- length(sample)
    x <- 0
    j <- 1
    while((u > x) & (j != (l + 1))){
      x <- x + 
            (theta + length(sample[[as.character(j)]]) * alpha) / 
            (n + theta)
      j <- j + 1
    }
    if(u <= x){
      sample[[as.character(j - 1)]] <- c(sample[[as.character(j - 1)]], i)
    }
    else{
      sample[[as.character(j)]] <- i
    }
  }
  return(sample)
}

