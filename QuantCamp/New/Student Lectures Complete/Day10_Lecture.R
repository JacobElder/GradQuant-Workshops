#############

# SPECIAL DISTRIBUTIONS

#############

# Binomial Number Generation

qplot(rbinom(10000,20,prob=.7))
qplot(rbinom(10000,20,prob=.5))
qplot(rbinom(10000,20,prob=.15))

# Poisson Number Generation

qplot(rpois(10000,lambda=1))
qplot(rpois(10000,lambda=1.5))
qplot(rpois(10000,lambda=2))

# Normal Number Generation

qplot(rnorm(10000,0,1))
qplot(rnorm(10000,3,10))
qplot(rnorm(10000,10,50))

########################

# Descriptives

########################

library(tidyverse)

data("starwars")

summary(starwars$mass)

# 'psych' has some nice functions for descriptives

library(psych)

describe(starwars$mass)

# describe can also provide different descriptives within groupings

describeBy(starwars$mass, starwars$gender)

########################

# Seed

########################

# I want to generate some data...

rnorm(5)

# But it's different each time I generate it! I want to use random number generation but it to be the same each
# time I run the code...

rnorm(5)

# For randomization processes, set your seed to maintain reproducible code

set.seed(50)
rnorm(5)
set.seed(50)
rnorm(5)

########################

# Writing efficient code

########################

# When performing simulations, pre-allocate memory whenever possible.
# In other words, try to define the dimensions of your matrix rather than concatenating at each iteration.

mat1 <- matrix(nrow=0,ncol=1)
mat2 <- matrix(nrow=100,ncol=1)
group <- c(1,2)
microbenchmark::microbenchmark(
  
  # rbind to empty matrix each time
  concatenate = for(i in 1:100){
    mat1 <- rbind(mat1, mean(group))
  },
  
  # insert to pre-defined rows each time
  preallocate = for(i in 1:100){
    mat2[i,] <- mean(group)
  }
  
)

# It's twice as fast! Wow!

# Matrices are faster than data.frames

mat1 <- as.data.frame(matrix(nrow=100,ncol=1))
mat2 <- matrix(nrow=100,ncol=1)
group <- c(1,2)
microbenchmark::microbenchmark(
  
  # rbind to empty matrix each time
  df = for(i in 1:100){
    mat1[i,] <- mean(group)
  },
  
  # insert to pre-defined rows each time
  mat = for(i in 1:100){
    mat2[i,] <- mean(group)
  }
  
)

# Matrix is about 2x faster than data frame