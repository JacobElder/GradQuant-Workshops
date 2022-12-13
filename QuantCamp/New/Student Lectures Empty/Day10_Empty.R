#############

# SPECIAL DISTRIBUTIONS

#############

# Binomial Number Generation

mean(rbinom(10000,20, prob = .5)) # 50-50 chance, like flipping coin
qplot(rbinom(10000,20, prob = .5))
qplot(rbinom(10000,20,prob=.2)) # skewed towards tails
qplot(rbinom(10000,20,prob=.8)) # skewed towards heads

# Poisson Number Generation

poissonVect1 <- rpois(10000,lambda=1)
qplot(poissonVect1)
mean(poissonVect1)
var(poissonVect1)
qplot(poissonVect1)
qplot(rpois(10000,lambda=3))
qplot(rpois(10000,lambda=15))

set.seed(50) # reproducible code
jaypois <- rpois(10000,lambda=3)
mean(jaypois)
var(jaypois)

# Normal Number Generation

qplot(rnorm(10000,0,1))
qplot(rnorm(10000,mean=20,sd=10))
qplot(rnorm(10000,mean=10,sd=50))

library(ggplot2)

simDf <- data.frame(nums=c(rnorm(1000,20,10), 
             rpois(1000,2.5), 
             rbinom(1000,20,prob=.8)
             ),
           distribs = c(rep("Normal",1000),
                        rep("Poisson",1000),
                        rep("Binomial",1000)
                        )
           )

# Plotting all numbers at once: Ew
qplot(x=nums, data=simDf)
# Plotting distributions separated by panel: Pretty
qplot(x=nums, data=simDf) + facet_wrap( ~ distribs) + 
  labs(x="Numbers", y="Density",title="Distributions") +
  theme_classic()

########################

# Descriptives

########################

library(tidyverse)

data('starwars')

# 'psych' has some nice functions for descriptives

library(psych)

describe(starwars$mass)
qplot(starwars$mass)

qplot(x=mass, data=starwars) + facet_wrap( ~ gender) + 
  labs(x="Mass", y="Density",title="Mass by Gender") +
  theme_classic()

starwars$mass[starwars$mass > 500] <- NA

data('starwars')

starwars <- starwars %>% 
  mutate(
    mass = replace(mass, mass > 500, NA)
  ) %>%
  filter(!is.na(gender))

qplot(x=mass, data=starwars) + facet_wrap( ~ gender) + 
  labs(x="Mass", y="Density",title="Mass by Gender") +
  theme_classic()

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

# Sampling

########################

set.seed(55)
# Without replacement (default)
sample(LETTERS[1:10], 5, replace=F)
# With replacement
sample(LETTERS[1:10], 5, replace=T)

qplot(simDf$nums) # full population distribution before
iter <- 100000
storage <- vector(length=iter)
for(i in 1:iter){
  storage[i] <- mean(sample(simDf$nums,replace=T))
}

# Compute confidence intervals empirically

qplot(storage) + # bootstrapped distribution of sample means
geom_vline(xintercept = mean(storage) - 1.96*sd(storage), color = "red" ) + # Lower bound
geom_vline(xintercept = mean(storage) + 1.96*sd(storage), color = "red" ) + # Upper bound
  theme_classic() +
  labs(x="Sample Means")

########################

# Writing efficient code

########################

# When performing simulations, pre-allocate memory whenever possible.
# In other words, try to define the dimensions of your matrix rather than concatenating at each iteration.

mat1 <- matrix(nrow=0,ncol=1)
mat2 <- matrix(nrow=100,ncol=1)
group <- c(1,2)
# install.packages("microbenchmark")
microbenchmark::microbenchmark(
  
  #rbind to empty matrix each time
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

df1 <- as.data.frame(matrix(nrow=100, ncol=1))
mat2 <- matrix(nrow=100,ncol=1)
group <- c(1,2)
microbenchmark::microbenchmark(
  
  # insert value to dataframe
  df = for(i in 1:100){
    df1[i,] <- mean(group)
  }
  
  # insert value to matrix
  mat = for(i in 1:100){
    mat2[i,] <- mean(group)
  }
  
)

# Matrix is about 2x faster than data frame