


###########################

# Redundant code can be automated: Custom functions

###########################

# We want to convert Farenheit to Celsius
# Farenheit to Celsius is (F-32)*(5/9)

# What is 72F in C?



# What is 50F in C?



# What is 32F in C?



# What is 102F in C?



# What is 20F in C?



# We have to re-write or copy and paste that code each time. Is there a more efficient way?



# What is 72F in C?



# What is 50F in C?



# What is 32F in C?



# What is 102F in C?



# What is 20F in C?



# Ultimately, you see that less code is needed here.

# Let's try an example with two inputs:

# Exercise: Concatenating two strings with paste0 produces: paste0('a','b')... 'ab'. Write a function called 
# fence that takes two parameters called original and wrapper and returns a new string that has the wrapper 
# character at the beginning and end of the original. A call to your function as fence('word','*') should
# produce '*word*'



# Test it by wrapping "pizza" with "+"



# What happens if you switch the order though?



# Order of inputs matters! If you order the inputs in the order of the arguments, it will make no difference.
# But if you order the inputs in a different order than the arguments in how the function is specified, you must
# arguments explicit. For example...



# We can also add defaults for the functions. For example, maybe if someone doesn't specify a wrapper, we assume
# they just want to print the word without a wrapper.


# Try it out on "pizza" as the input word without a wrapper using the variant of the function with an empty default
# for the wrapper



# You may have noticed that in the first example for converting temperatures, we used a return argument. While
# for this example, we did not. return is not required per se. If you did not call return, the custom function
# will return the last output of the function. But if you want to be explicit or call something that is not the last
# output, you should use return().

# We want to estimate the average miles per gallon of each car



# Now, we want to compute the mean miles per gallon of the car weighted by multiple different variables

# Weighted by weight


# Weighted by 1/4 mile time


# Weighted by gross horsepower


# Weighted by number of carburetors


# However, doing this requires more code than is necessary.

# Weighted mean custom function



# Apply the same process of weighted the miles per gallon average by weight, mile time, horsepower, carburetors



# Another example...

# Inputs



## Enter 3 then 5


# You'll see that h is defined within the function. Let's try and print it outside the function.



# Woah, there's an error. Why is that? Variables defined a function are what are called "local variables"
# that are only available and used in the local environment within the function but not for usage outside the function
# in the global environment.

# Default, null statement



# Control program flow with `if` and `else` statements



# Control program flow with `if` and `else` statements



# Write "wrapper functions" to make your life easier



# Use lists to return multiple outputs



# Iteration



# For loops



# Apply function

## Sum over rows



## Mean over columns



# There are other apply functions...

# apply	apply(x, MARGIN, FUN)	Apply a function to the rows or columns or both	Data frame or matrix	vector, list, array
# lapply	lapply(X, FUN)	Apply a function to all the elements of the input	List, vector or data frame	list
# sapply	sapply(X, FUN)	Apply a function to all the elements of the input	List, vector or data frame	vector or matrix

# Use for loops to examine the weighted mean of mpg using cyl, disp, hp, drat, wt, and qsec as weights
# Let's also compare the weighted means to the overall mean



# While statement


