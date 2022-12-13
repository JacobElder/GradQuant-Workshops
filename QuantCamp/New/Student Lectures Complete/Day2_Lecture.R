#####################

# OPERATIONS #

#####################

# Print the number 2

2

# Add the number 2 and the number 1 together

2 + 1

# Subtract 2 from 6

6 - 2

# Multiply 2 by 3

2 * 3

# Square 2

2^2

# Find the remainder of 7 after divison by 2

7%%2

# Square root 4

sqrt(4)

## Assignment: Derive the area for a circle if the radius is 37.5. (Hint: pi is stored in R as "pi")

pi * 37.5^2

# Assign the number 2 to a variable titled "two"

two <- 2

# Use auto-printing

two

# Use explicit printing

print(two)

# Assignment: Generate a new variable containing another number:



# Generate a sequence of numbers from 1 to 10 and title domain

domain <- 1:10

# Add sequence of numbers to variable two and assign to variable "range"

range <- two + domain

# Create a vector of numbers 3, 6, 9 and assign to variable "dots"
## Note: c() stands for concatenate. Vectors contain variables only of same class

dots <- c(3, 6, 9)

# Plot dots
## Note: This is base R plotting which is generally less favored than ggplot2. It can be useful for quick
## plotting, like here. But we will cover more detailed visualization later.

plot(dots)

# Try to create a vector with a string at end.

broken <- c(3, 6, 9, "broke")

## What do you notice about when you add a different class to the end of the vector?

## Assignment: Generate a slope-intercept function with a y-intercept (b) of 2, a slope of 4, and a domain 
## set of numbers containing 2, 7, -1, 5, 3, 2, 11, 3. Write the function as y = mx + b by storing each number 
## as a variable.

m = 4
b = 2
x = c(2, 7, -1, 5, 3, 2, 11, 3)

y = m*x + b

## Assignment: Print the range assigned as "y".

print(y)

## Assignment: Plot "y"

plot(y)

# Examine the class of the variable "y"

class(y)

## What is its class?

# There are a variety of atomic (i.e., fundamental) classes:

# character
# Examples:

class("apple")
class("p")
class("1")

# numeric (real numbers)
# Examples:

class(1.23343)
class(pi)
class(2.0)

# integer
# Examples:

class(1)
class(2)
class(two)

# logical (True/False)
# Examples:

class(TRUE)
class(FALSE)
class(F)
class(T)

# There are also missing values

NA
NaN

# Variables can be converted to categorical factors for data analysis.
## Note: If a variable is a character and is used in a statistical model, it will default to a factor.

fruit <- c("apple", "orange", "banana")
fruit
fruit <- as.factor(fruit)
fruit

# You can explicitly coerce your objects to become other classes.
# For example, 1's and 0's can be converted to logical TRUEs and FALSEs

binary <- c(1,0,0,1)
binary
binary <- as.logical(binary)
binary

# Numbers can be converted to characters

numbers <- c(1,2,3)
numbers
numbers <- as.character(numbers)
numbers

# Matrices are vectors with another dimension, so n rows by m columns. Like vectors, they must be of one class
# and will otherwise be coerced.

# You can create an empty matrix of 3 rows and 2 columns.

m <- matrix(nrow = 3, ncol = 2)
m

# You can create a populated matrix of 3 rows and 3 columns.

m <- matrix(1:9, nrow=3, ncol=3)
m

# You can bind together vectors to create a matrix.

# For example, using cbind() to bind columns.

numbers1 <- c(1,2,3)
numbers2 <- c(4,5,6)
cnums <- cbind(numbers1,numbers2)
cnums

# For example, using rbind() to bind rows.

rnums <- rbind(numbers1, numbers2)
rnums

# For special cases, you can go beyond a 2-dimensional object using arrays. See a 2x5x4 array below:

dim(array(NA, c(2,5,4)))

# Lists are a special type of object that can contain elements of different classes. Below is a list
# containing both numbers and characters.

fruitandnums <- list(1, "apple", 3)
fruitandnums

# Lists can also contain objects of different types and sizes. Here is a list containing a matrix, a list, and a vector.

hodgepodge <- list(m, fruitandnums, numbers1)
hodgepodge

#####################

# OPERATIONS #

#####################

# Arithmetic Operations were covered above
# +, -, /, *, ^, sqrt(), %%, etc.

# Relative operations

1 < 2
1 <= 1
1 == 1
T == T
T > F
"a" == "a"
"a" != "b"

# Logical operations

## &	AND
## It returns true when both conditions are true

T & T
T & F
c(T,T) & c(T,F)
(.5 > 0) & (1 > .5)
(1 > 2) & (1 > .5)

## &&	AND
## Same as the above but, It works on single element

T && T
T && F
c(T,T) && c(T,F)
c(F,T) && c(T,T)
c(T,F) && c(T,T)

## |	OR
## It returns true when at-least one of the condition is true

T | T
T | F
F | F
c(T,T,F) | c(T,F,F)
(.5 > 0) | (1 > .5)
(1 > 2) | (1 > .5)

## ! is negation

!(T | F)
!(100 > 0)

## which can be useful for logical vectors, determining the indices of which are TRUE

which(c(T,F,T,F,T,F,T))
