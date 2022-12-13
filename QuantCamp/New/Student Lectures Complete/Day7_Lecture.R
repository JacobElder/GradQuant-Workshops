############

# Distribution Functions

############

# dnorm: density function of the normal distribution
# pnorm: cumulative density function of the normal distribution
# qnorm: quantile function of the normal distribution
# rnorm: random sampling from the normal distribution

AreaNormal <- function(pointH,pointL=-3){
  ggplot(data.frame(x = c(-3, 3)), aes(x)) +
    stat_function(fun = dnorm ) + 
    stat_function(fun = dnorm, 
                  xlim = c(pointL,pointH),
                  geom = "area") 
}

#### pnorm for cumulative

# The cumulative density to the left at mean of 0 for standard normal distribution

pnorm(0)
AreaNormal(0)

# 50%

# The cumulative density to the left at mean of 1 SD for standard normal distribution

pnorm(1)
AreaNormal(1)

# 84.1%

# The cumulative density to the left at mean of 2 SD for standard normal distribution

pnorm(2)
AreaNormal(2)

# 97.7%

# The cumulative density to the left at mean of 2.5 SD for standard normal distribution

pnorm(2.5)
AreaNormal(2.5)

# The cumulative density between 1 SD above and below the mean for standard normal distribution

pnorm(1) - pnorm(-1)
AreaNormal(pointH=1, pointL=-1)

##### qnorm for quantile

# 99.4%

# The quantile at .5 is...

qnorm(.5)

# 0

# The quantile at .975 (two-tailed alpha of .05) is...

qnorm(.975)

# 1.96

# The quantile at .95 (one-tailed alpha of .05) is...

qnorm(.95)

# 1.64

##### dnorm for density

x <- seq(-3, 3, length=1000)
y <- dnorm(x, mean = 0, sd = .25)
y # The density at each value along x
qplot(x = x, y = y, geom = "line",ylab = "Density") +
  theme_minimal(base_size = 20) # qplot is just a "quick" plot... Basically, ggplot2 equivalent of base plot()
# We will go into more detail about ggplot2 next class

########################

# Data Wrangling

########################


## TBD ##