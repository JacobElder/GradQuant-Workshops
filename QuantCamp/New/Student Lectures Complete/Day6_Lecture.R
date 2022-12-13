###########

# Set Operations #

###########

vect1 <- c(1,2,3,8,9,10)
vect2 <- c(1,2,3,4,5,6)

# Union
# All elements in one vector OR the other

union(vect1, vect2)

# Intersect
# All elements that overlap in one vector AND the other

intersect(vect1, vect2)

# Complement
# All elements of the full sample that are not in the vector

setdiff(1:10, vect1)
setdiff(1:10, vect2)

# Test is the sets are equivalent

setequal(vect1, vect2) # They're not equivalent
setequal(vect1[1:3],vect2[1:3]) # But they first three elements are

# Does element belong to another vector?

is.element(1:10, vect2)
1:10 %in% vect2 # same, but different expression

is.element(1:10, vect1)
1:10 %in% vect1

# Bonus: For fun, let's see what that looks like using the ggvenn package!

# load Venn diagram package
install.packages("ggvenn")
library("ggvenn")

# use list as input 
AB <-list('A'=vect1,'B'=vect2)

# create customised venn diagram
ggvenn(AB,show_elements=TRUE,stroke_color="Red",
       stroke_linetype="solid")

##############

# Pivoting

##############

setwd("~/Documents/GitHub/UCRQuantCamp/New/RMarkdown Lectures/")

# read_csv will interpret the file as a tibble
df <- read_csv("ESS10.csv")

# Let's create an iterator within the group and use that to pivot wide to
shortDf <- df %>% 
  select(cntry, fairelcc) %>% 
  group_by(cntry) %>%
  mutate(sn = 1:n())

# Let's use the country as the ID, the sequential ID as the column,  and fair election variable as the value
wideDf <- shortDf %>% pivot_wider(id_cols = cntry, names_from = sn, values_from = fairelcc)

# Okay, now let's pivot it back to longer
longDf <- wideDf %>% pivot_longer(cols = 2:2000, names_to = "sn", values_to = "fairelcc")

# In the last class, we computed the mean per country for fair election...
# Maybe we want to have people's individual evaluations of fair elections, along with aggregate/country-level averages
# of fair elections.

# Repeat the replacing of missing values and the mean from last class

df <- df %>% 
  mutate(fairelcc = replace(fairelcc, fairelcc > 76, NA),
         medcrgvc = replace(medcrgvc, medcrgvc > 76, NA)
  )

aveDf <- df %>%
  group_by(cntry) %>%
  summarise(fairelccAVE = mean(fairelcc, na.rm=T),
            medcrgvcAVE = mean(fairelcc, na.rm=T)
  ) %>%
  arrange(fairelccAVE, medcrgvcAVE)

# We can then merge the dataframe of averages with the dataframe of all person-level data

# There are different types of joins
# inner_join(): includes all rows in x and y.
# 
# left_join(): includes all rows in x.
# 
# right_join(): includes all rows in y.
# 
# full_join(): includes all rows in x or y.

mergeDf <- df %>% inner_join(aveDf, by = "cntry")
