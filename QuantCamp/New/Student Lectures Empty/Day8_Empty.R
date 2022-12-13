
library(tidyverse)

setwd("~/Documents/GitHub/UCRQuantCamp/New/Student Lectures Complete/")

# read_csv will interpret the file as a tibble

df <- read_csv("ESS10.csv")

########################

# SCATTERPLOTS

########################

# Let's start simple and only use Bulgaria

# Let's look at a scatterplot of happy and  minutes using internet

# remove the non-responses

Bulg <- df %>%
  filter(cntry == "BG") %>% # subset/filter Bulgaria
  mutate(happy = replace(happy, happy > 76, NA),
         netustm = replace(netustm, netustm >= 6666, NA))

# Let's look at a plot of happy and  minute

ggplot(Bulg, aes(y=happy,x=netustm))

# Wait a sec! There's nothing there. You need to specify "geom_point()" for the data points.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point()

# You can further tweak the size and shape of the dots.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size = 5, shape = 18)

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size = 1, shape = 18)

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size = 5, shape = 25)

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size = 5, shape = 5)

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size = 5, shape = 9)

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size = 5, alpha = .10, shape = 18, color = "dodgerblue")

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size = 5, alpha = .10, shape = 18, color = "darkred")

# Maybe you'd like to take on a best fit OLS line through the data points.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point() + geom_smooth(method = lm)

# Then tweak that line a bit...

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point() + geom_smooth(method = lm, linetype = "dotted")

ggplot(Bulg, aes(y = happy, x = netustm)) + 
  geom_point() + 
  geom_smooth(method = lm, linetype = "dashed", color = "dodgerblue", fill = "red", alpha = .2)

# Remove SE

ggplot(Bulg, aes(y = happy, x = netustm)) + 
  geom_point() + 
  geom_smooth(method = lm, linetype = "dashed", color = "dodgerblue", fill = "red", alpha = .2, se = FALSE)

# Potentially more tidy way to do it

Bulg %>% 
  ggplot() +
  aes(y = happy, x = netustm) + 
  geom_point() + 
  geom_smooth(method = lm, linetype = "dashed", color = "dodgerblue", fill = "red", alpha = .2, se = FALSE)

# Loess method: Nonparametric curve
# Kind of hard to tell the difference in this data though... Still pretty linear.

Bulg %>% 
  ggplot() +
  aes(y = happy, x = netustm) + 
  geom_point() + 
  geom_smooth()

# What if we want to look at different slopes for each gender?

# if(X){
#   then do x
# }else{
#   then do y
# }

# ifelse() is just shorter one function version of that

Bulg %>%
  # replaced non-respones with NAs using ifelse
  mutate(gndr = as_factor(
    ifelse(gndr==9, NA, gndr)
    )) %>%
  # recoded 1 as "Male" and 2 as "Female for the factor
  mutate(gndr = recode(gndr, "1" = "Male", "2" = "Female")) %>%
  # define the plot
  ggplot() +
  # define the aesthetic mappings, color and shape are defined by gender
  aes(x=happy, y=netustm, shape = gndr, color = gndr) +
  # define the points
  geom_point() +
  # define the best-fit line
  geom_smooth(method=lm)

# Okay, what if we want to be ambitious and look at all of the countries simultaneously while denoting gender with
# shape?

df %>%
  mutate(happy = replace(happy, happy > 76, NA),
         netustm = replace(netustm, netustm >= 6666, NA)
         ) %>%
  mutate(gndr = as_factor(
    ifelse(gndr==9, NA, gndr)
  )) %>%
  mutate(gndr = recode(gndr, "1" = "Male", "2" = "Female")) %>% 
  ggplot() +
  aes(x = happy, y = netustm, shape = gndr, color=cntry) +
  geom_jitter() +
  geom_smooth(method=lm)
                        
# That's pretty difficult to process/interpret given the amount of data but you get the idea

###############

# Barplots

###############

install.packages("Rmisc")

library(Rmisc)

# Let's plot the average happiness for the countries

df_cleaned <- df %>%
  mutate(happy = replace(happy, happy > 76, NA),
         netustm = replace(netustm, netustm >= 6666, NA)
  ) %>%
  mutate(gndr = as_factor(
    ifelse(gndr==9, NA, gndr)
  )) %>%
  mutate(gndr = recode(gndr, "1" = "Male", "2" = "Female")) 

# You can generate the summary statistics needed for a barplot using tidyverse and the group_by function.
# I'm also a fan of Rmisc's summarySE function

# Let's get the mean happiness per country within male and female

aveHappyDf <- df %>%
  group_by(cntry) %>%
  summarise(aveHappy = mean(happy, na.rm=T))
aveHappyDf

# Finland and Slovenia are pretty happy! :)
# Slovakia and Bulgaria are not so happy... :(

# Women in general seem to be happier than men, with some exceptions.

# But there's error bars missing


