"
Seth Temple
10/17/19
"

# define gambler's ruin function
gruin <- function(N,p,i,r){
  
          # assign parameters
          q <- 1 - p
          R <- rep(NA,r+1)
          R[1] <- i
          u <- runif(r)
  
          # play gambler's ruin
          for(j in 2:(r+1)){
            if(R[j - 1] == 0){
              R[j] <- R[j - 1]
            } else if(R[j - 1] == N){
              R[j] <- R[j - 1]
            } else if(u[j - 1] <= q){
              i <- i - 1
              R[j] <- i
            } else{
              i <- i + 1
              R[j] <- i
            }
          }
          return(R)
}

# assign parameters
K <- 1
N <- 10
p <- .29
i <- 3
r <- 20

# simulate games of gambler's ruin
set.seed(100395)
m <- matrix(nrow = K, ncol = r + 1)
for(k in 1:K){
  m[k,] <- gruin(N,p,i,r)
}
print(c(m))

ct_col <- function(mat,index, id){
            ct <- 0
            for(item in mat[,index]){
              if(item == id) ct <- ct + 1
            }
            return(ct)
}

# assign parameters
p <- seq(.1,.9,.1)
i <- 4
K <- 10000
m <- matrix(nrow = K, ncol = r + 1)

# simulate games of gambler's ruin
# and count the winning games
set.seed(100492)
cts <- rep(NA,length(p))
for(n in 1:length(p)){
  m <- matrix(nrow = K, ncol = r + 1)
  for(k in 1:K){
    m[k,] <- gruin(N,p[n],i,r)
  }
  cts[n] <- ct_col(m,r+1,N)
}

# plot the results
est_prob <- cts / K
plot(p,est_prob,main="Gambler's Ruin",
     ylab="Estimates of h(4,p)",xlab="p",
     pch=19)
lines(p,est_prob)
