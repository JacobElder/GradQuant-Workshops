############

# LIMITS #

############

# Example 3.1.1.

n = -100:100
SetA = 2 - (1 / n^2)
plot(SetA)

## Can you see the limit? What is it?

# 2

# Example 3.1.2

n = -100:100
SetB = (n^2 + 1)/n
plot(SetB)

## Can you see the limit? What is it?

# Infinity

# Example 3.1.3

n = -100:100
SetC = (-1^n * ( 1 - (1/n) ))
plot(SetC)

# -1

# Example 3.1.1

n = -100:100
SetD = (2*n / (n^2 + 1) )
plot(SetD)

# What is the limit?

# 0

# Example 3.1.2

n = -10000:10000
SetE = n^3 - 100 * n^2
plot(SetE)

# What is the limit?

# Infinity



# Central Limit Theorem Example

## generate population distribution from exponential distribution, a lot of data
population <- rexp(100000000, rate = 3.2)

## number of iterations
iter <- 100000

## initialize empty matrix
samplematrix <- matrix(ncol=1, nrow=iter)
for(i in 1:iter){
  ## Get samples of 100
  study <- sample(population, 100, replace=F)
  ## store in vector/matrix
  samplematrix[i,] <- mean(study)
}
## examine matrix
hist(scale(samplematrix))
## You can see it converges (i.e., has a limit) on Normal(0,1)

############

# PIVOTING #

############

# Load package

library(tidyverse)

# Set working directory

setwd("~/Documents/GitHub/UCRQuantCamp/New/RMarkdown Lectures/")

# Read data

df <- data.table::fread("ESS10.csv")

# fread interprets the file as a data frame
class(df)

# read_csv will interpret the file as a tibble
df <- read_csv("ESS10.csv")

# A tibble never changes the input type.
# No more worry of characters being automatically turned into strings.
# A tibble can have columns that are lists.
# A tibble can have non-standard variable names.
# can start with a number or contain spaces.
# To use this refer to these in a backtick.
# It only recycles vectors of length 1.
# It never creates row names.

# Tidyverse equivalent of head and tail
slice_head(df,n=5)
slice_tail(df,n=5)

# Countries are
# AT	Austria
# BE	Belgium
# BG	Bulgaria
# CH	Switzerland
# CY	Cyprus
# PT	Portugal
# RS	Serbia
# SE	Sweden
# SI	Slovenia
# SK	Slovakia

# A typical sequence of events to accomplish something may look like..

# Assign to new df
df1 <- df
# Subset country, fair elections, and media has right to criticize government
df1_subsetted <- select(df1, cntry, fairelcc, medcrgvc)
# Sort by the two variables: Low to high, ascending
df1_sorted <- arrange(df1_subsetted, fairelcc, medcrgvc)
# 77 is	Refusal; 88	is Don't know; 99	is No answer
# Let's filter only the rows that are less than 77
df1_sorted_filtered <- filter(df1_sorted, fairelcc < 77 & medcrgvc < 77)
# Print dataframe
df1_sorted_filtered

# A tidyverse solution... Less lines, less variables/assignment, and more streamlined

df %>% 
  select(cntry, fairelcc, medcrgvc) %>% 
  arrange(fairelcc, medcrgvc) %>%
  filter(fairelcc < 77 & medcrgvc < 77)

# But realistically, we don't want to filter those columns completely, right? We want to replace them with NAs.

# Let's inspect before we mutate
unique(df$fairelcc)
unique(df$medcrgvc)

df <- df %>% 
  mutate(fairelcc = replace(fairelcc, fairelcc > 76, NA),
         medcrgvc = replace(medcrgvc, medcrgvc > 76, NA)
         )

# Let's check them out again
unique(df$fairelcc)
unique(df$medcrgvc)

# Maybe we want to rename some variables

df %>% 
  select(cntry, fairelcc) %>%
  rename(Country = cntry, fairElect = fairelcc)

df %>% 
  select(cntry, fairelcc) %>%
  rename_with(toupper)

# Perhaps we'd like to summarize some statistics for the entire dataset...

df %>% 
  select(fairelcc) %>%
  summarize(min_fair = min(fairelcc, na.rm = T),
                 m_fair = mean(fairelcc, na.rm = T),
                 max_fair = max(fairelcc, na.rm = T))

# Now, let's say we want to examine the average fairness and media rights per country, and then sort them

aveDf <- df %>%
  group_by(cntry) %>%
  summarise(fairelccAVE = mean(fairelcc, na.rm=T),
            medcrgvcAVE = mean(fairelcc, na.rm=T)
            ) %>%
  arrange(fairelccAVE, medcrgvcAVE)

# Now, maybe we want to group them into three differently labeled groups

aveDf %>%
  mutate(fairType = 
           case_when(fairelccAVE < 6 ~ "Low",
                     fairelccAVE >= 6 &  fairelccAVE < 7 ~ "Med",
                     fairelccAVE >= 7 ~ "High")
  )

# Another example of case_when

foods <- sample(c("bread","fruit","vegetable","meat"),100,replace=T)
case_when(foods == "bread" ~ "6-11 Servings",
          foods == "fruit" ~ "2-4 Servings",
          foods == "vegetable" ~ "3-5 Servings",
          foods == "meat" ~ "2-3 Servings"
          )
