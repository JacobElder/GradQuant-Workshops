
library(ggplot2)

setwd("~/Documents/GitHub/UCRQuantCamp/New/RMarkdown Lectures/")

# read_csv will interpret the file as a tibble
df <- read_csv("ESS10.csv")

########################

# SCATTERPLOTS

########################

# Let's start simple and only use Bulgaria

# Let's look at a scatterplot of happy and  minute

# remove the non-responses

Bulg <- df %>% filter(cntry=="BG") %>%
  mutate(happy = replace(happy, happy > 76, NA),
         netustm = replace(netustm, netustm == 6666 | netustm == 7777 | netustm == 8888 | netustm == 9999, NA)
  )

# Let's look at a scatterplot of happy and  minute

ggplot(Bulg, aes(y = happy, x = netustm)) 

# Wait a sec! There's nothing there. You need to specify "geom_point()" for the data points.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point()

# You can further tweak the size and shape of the dots.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size=5,shape=18)

# Maybe you'd like to take on a best fit OLS line through the data points.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size=5,shape=18) + geom_smooth(method=lm)

# Then tweak that line a bit...

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size=5,shape=18) + geom_smooth(method=lm,  linetype="dotted",
                                                                                      color="dodgerblue", fill="red")


# Remove SE

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size=5,shape=18) + geom_smooth(method=lm,  linetype="dotted",
                                                                                      color="dodgerblue", fill="red", se = F)

# Loess method: Nonparametric curve
# Kind of hard to tell the difference in this data though... Still pretty linear.

ggplot(Bulg, aes(y = happy, x = netustm)) + geom_point(size=5,shape=18) + geom_smooth(linetype="dotted",
                                                                                      color="dodgerblue", fill="red")

# What if we want to look at different slopes for each gender?

Bulg %>% mutate(gndr = as_factor(ifelse(gndr==9, NA, gndr)) ) %>% ggplot(aes(x=happy, y=netustm, shape=gndr, color=gndr)) +
  geom_point() + geom_smooth(method=lm)

# Okay, what if we want to be ambitious and look at all of the countries simultaneously while denoting gender with
# shape?

df %>%
  mutate(happy = replace(happy, happy > 76, NA),
         netustm = replace(netustm, netustm == 6666 | netustm == 7777 | netustm == 8888 | netustm == 9999, NA)
  ) %>% 
  mutate(gndr = as_factor(ifelse(gndr==9, NA, gndr)) ) %>% 
  ggplot(aes(x=happy, y=netustm, shape=gndr, color=cntry)) +
  geom_point() + 
  geom_smooth(method=lm)
                        
# That's pretty difficult to process/interpret given the amount of data but you get the idea

###############

# Barplots

###############

library(Rmisc)

df <- df %>%
  mutate(happy = replace(happy, happy > 76, NA),
         netustm = replace(netustm, netustm == 6666 | netustm == 7777 | netustm == 8888 | netustm == 9999, NA)
  ) %>% 
  mutate(gndr = as_factor(ifelse(gndr==9, NA, gndr)) ) %>%
  mutate(gndr = recode(gndr, "1" = "Male", "2" = "Female"))

# Let's plot the average happiness for the countries

aveHappyDf <- df %>% 
  group_by(cntry) %>%
  summarise(aveHappy = mean(happy, na.rm=T))

ggplot(aveHappyDf, aes(x=cntry, y=aveHappy)) + 
  geom_bar(stat="identity", position=position_dodge())

# You can generate the summary statistics needed for a barplot using tidyverse and the group_by function.
# I'm also a fan of Rmisc's summarySE function

# Let's get the mean happiness per country within male and female
aveHappy <- summarySE(df, measurevar = c("happy"), groupvars = c("gndr","cntry"), na.rm=T)

# Finland and Slovenia are pretty happy! :)
# Slovakia and Bulgaria are not so happy... :(

# Women in general seem to be happier than men, with some exceptions.

# But there's error bars missing

ggplot(aveHappy, aes(x=cntry, y=happy, fill=gndr)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=happy-se, ymax=happy+se), width=.45,
                position=position_dodge(1))
