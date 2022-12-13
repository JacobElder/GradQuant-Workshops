#####################

# OPERATIONS #

#####################

# Print the number 2



# Add the number 2 and the number 1 together



# Subtract 2 from 6



# Multiply 2 by 3



# Square 2



# Find the remainder of 7 after divison by 2



# Square root 4



## Assignment: Derive the area for a circle if the radius is 37.5. (Hint: pi is stored in R as "pi")



# Assign the number 2 to a variable titled "two"



# Use auto-printing



# Use explicit printing



# Assignment: Generate a new variable containing another number:



# Generate a sequence of numbers from 1 to 10 and title domain



# Add sequence of numbers to variable two and assign to variable "range"



# Create a vector of numbers 3, 6, 9 and assign to variable "dots"
## Note: c() stands for concatenate. Vectors contain variables only of same class



# Plot dots
## Note: This is base R plotting which is generally less favored than ggplot2. It can be useful for quick
## plotting, like here. But we will cover more detailed visualization later.



# Try to create a vector with a string at end.



## What do you notice about when you add a different class to the end of the vector?

## Assignment: Generate a slope-intercept function with a y-intercept (b) of 2, a slope of 4, and a domain 
## set of numbers containing 2, 7, -1, 5, 3, 2, 11, 3. Write the function as y = mx + b by storing each number 
## as a variable.



## Assignment: Print the range assigned as "y".



## Assignment: Plot "y"



# Examine the class of the variable "y"



## What is its class?

# There are a variety of atomic (i.e., fundamental) classes:

# character
# Examples:



# numeric (real numbers)
# Examples:



# integer
# Examples:



# logical (True/False)
# Examples:



# There are also missing values


# Variables can be converted to categorical factors for data analysis.
## Note: If a variable is a character and is used in a statistical model, it will default to a factor.



# You can explicitly coerce your objects to become other classes.
# For example, 1's and 0's can be converted to logical TRUEs and FALSEs


# Numbers can be converted to characters



# Matrices are vectors with another dimension, so n rows by m columns. Like vectors, they must be of one class
# and will otherwise be coerced.

# You can create an empty matrix of 3 rows and 2 columns.



# You can create a populated matrix of 3 rows and 3 columns.



# You can bind together vectors to create a matrix.

# For example, using cbind() to bind columns.



# For example, using rbind() to bind rows.



# For special cases, you can go beyond a 2-dimensional object using arrays. See a 2x5x4 array below:



# Lists are a special type of object that can contain elements of different classes. Below is a list
# containing both numbers and characters.



# Lists can also contain objects of different types and sizes. Here is a list containing a matrix, a list, and a vector.



#####################

# OPERATIONS #

#####################

# Arithmetic Operations were covered above
# +, -, /, *, ^, sqrt(), %%, etc.

# Relative operations



# Logical operations

## &	AND
## It returns true when both conditions are true



## &&	AND
## Same as the above but, It works on single element



## |	OR
## It returns true when at-least one of the condition is true



## ! is negation



## which can be useful for logical vectors, determining the indices of which are TRUE


