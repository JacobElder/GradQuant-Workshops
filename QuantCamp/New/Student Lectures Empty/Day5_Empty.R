############

# LIMITS #

############

# Example 3.1.1.



## Can you see the limit? What is it?

# 2

# Example 3.1.2



## Can you see the limit? What is it?

# Infinity

# Example 3.1.3



# -1

# Example 3.1.1



# What is the limit?

# 0

# Example 3.1.2



# What is the limit?

# Infinity



# Central Limit Theorem Example

## generate population distribution from exponential distribution, a lot of data


## number of iterations


## initialize empty matrix


## examine matrix

## You can see it converges (i.e., has a limit) on Normal(0,1)

############

# PIVOTING #

############

# Load package



# Set working directory



# Read data



# fread interprets the file as a data frame



# read_csv will interpret the file as a tibble



# A tibble never changes the input type.
# No more worry of characters being automatically turned into strings.
# A tibble can have columns that are lists.
# A tibble can have non-standard variable names.
# can start with a number or contain spaces.
# To use this refer to these in a backtick.
# It only recycles vectors of length 1.
# It never creates row names.

# Tidyverse equivalent of head and tail



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

# Subset country, fair elections, and media has right to criticize government

# Sort by the two variables: Low to high, ascending

# 77 is	Refusal; 88	is Don't know; 99	is No answer
# Let's filter only the rows that are less than 77

# Print dataframe


# A tidyverse solution... Less lines, less variables/assignment, and more streamlined



# But realistically, we don't want to filter those columns completely, right? We want to replace them with NAs.

# Let's inspect before we mutate




# Let's check them out again


# Maybe we want to rename some variables





# Perhaps we'd like to summarize some statistics for the entire dataset...



# Now, let's say we want to examine the average fairness and media rights per country, and then sort them



# Now, maybe we want to group them into three differently labeled groups



# Another example of case_when


