###########

# Set Operations #

###########



# Union
# All elements in one vector OR the other



# Intersect
# All elements that overlap in one vector AND the other



# Complement
# All elements of the full sample that are not in the vector



# Test is the sets are equivalent



# Does element belong to another vector?





# Bonus: For fun, let's see what that looks like using the ggvenn package!

# load Venn diagram package


# use list as input 


# create customised venn diagram


##############

# Pivoting

##############

# Set wd



# read ESS10
# read_csv will interpret the file as a tibble


# Let's create an iterator within the group and use that to pivot wide to


# Let's use the country as the ID, the sequential ID as the column,  and fair election variable as the value


# Okay, now let's pivot it back to longer


# In the last class, we computed the mean per country for fair election...
# Maybe we want to have people's individual evaluations of fair elections, along with aggregate/country-level averages
# of fair elections.

# Repeat the replacing of missing values and the mean from last class





# We can then merge the dataframe of averages with the dataframe of all person-level data

# There are different types of joins
# inner_join(): includes all rows in x and y.
# 
# left_join(): includes all rows in x.
# 
# right_join(): includes all rows in y.
# 
# full_join(): includes all rows in x or y.


