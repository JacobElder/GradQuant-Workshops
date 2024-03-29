############################

# Data frames

############################

# Set working directory

setwd("~/Documents/GitHub/UCRQuantCamp/New/RMarkdown Lectures/")

# Load dplyr

library("dplyr")

# Load Star Wars dataset

data("mtcars")

# Examine the dataset

View(mtcars)

# Examine variable names of dataset

colnames(mtcars)

# Examine dimensions of the data

dim(mtcars)

## How many rows and columns are there?

# Examine the head (top 6 rows) and tail (bottom 6 rows) of dataset

head(mtcars)
tail(mtcars)

## What is in the bottom six and top six rows?

# Examine class of Star Wars dataset

class(mtcars)

## What kind of class is the dataframe?

# You can examine variables by using the dollar sign $

mtcars$mpg
mtcars$cyl
mtcars$disp

# Check class of name

class(mtcars$mpg)

## What kind of class is it?

#######################

# Indexing

#######################

# Index first row

mtcars[1,]

# Index second row

mtcars[2,]

# Index 3rd through 5th rows

mtcars[3:5,]

# Index 4th column

mtcars[,4]

## You can index without the comma but it will be interpreted as a data.frame, in contrast to above being a vector.

mtcars[4]

# Index 2 and 5th column

mtcars[,c(2,5)]

# Index column for "cyl"

mtcars[,"cyl"]

# Index column for "cyl" and "wt"

mtcars[,c("cyl","wt")]

# Index column for "cyl" and "wt" and move "wt" before "cyl"

mtcars[,c("wt","cyl")]

# Index 3 row and 5th column

mtcars[3,5]

# Index 2nd, 3rd, and 5th column and 3rd through 6th rows

mtcars[3:6, c(2,3,5)]

# Subset rows of wt that are less than 3

mtcars[mtcars$wt < 3,]

# Subset rows where vs is 1

mtcars[mtcars$vs == 3,]

# Subset rows where carb is NOT 4

mtcars[mtcars$carb != 4,]

#######################

# Writing

#######################

# There are multiple different file types that could be used. Probably the most commonly used and most efficient
# are CSVs (comma separated values) which represent your data as text delimited by commas.

# While you may open CSV files in Excel, there are some important to distinctions.
# CSV is a plain text format with a series of values separated by commas whereas Excel is a binary file that holds information about all the worksheets in a workbook.
# CSV file can’t perform operations on data while Excel can perform operations on the data.
# Comparing CSV vs Xlsx, CSV files are faster and also consumes less memory whereas Excel consumes more memory while importing data.

# While less commonly used, you can also read and write text data as tab delimited, semicolon delimited, space delimited, etc.

# There are also proprietary data types for software such as SPSS (.sav), STATA (.dta), SAS (.sas7bdat)

# Write csv to your working directory (comma delimited)

write.csv(mtcars, "mtcars.csv", row.names = F)

# Can also write csv to you working directory that is semicolon delimited

write.table(mtcars, file="mtcarsSC.csv",quote=TRUE, sep = ";")

# Can also write tsv to your working directory

write.table(mtcars, file = "mtcars.tsv", row.names=FALSE, sep="\t")

# To write and import xlsx files, you will need the xlsx package

install.packages('xlsx')     
library(xlsx)
write.xlsx(mtcars, file = "mtcars.xlsx", row.names = T)

# The "haven" package will allow you to read and write SPSS files such as .sav, SAS files, and STATA files

install.packages("haven")
library(haven)
haven::write_sav(mtcars, "mtcars.sav")

# You can save you workspace as well

save.image("mtcars_space.RData")

# Clear workspace

rm()

# Load workspace

load("mtcars_space.RData")

#############################

# Reading data

#############################

# https://ess-search.nsd.no/en/study/172ac431-2a06-41df-9dab-c1fd8f3877e7

# Base read csv
df <- read.csv("ESS10.csv",header = T)

# readr's read_csv much faster
df <- readr::read_csv("ESS10.csv")

# fread 2.5x faster than read_csv
# fread is fast and efficient but is also cool because it automatically detects the number of columns, rows,
# and the delimiter! So it will determine if your input is tab separated or comma separated fo example.
df <- data.table::fread("ESS10.csv")

# Compare the two ways of reading with same function
mtcars1 <- data.table::fread("mtcars.tsv")
mtcars2 <- data.table::fread("mtcars.tsv")
all(mtcars1==mtcars2) # They're the same

# We can also read in that mtcars dataset again as a tsv or as a ; separated dataset
mtcars <- read.csv("mtcarsSC.csv",header = T, sep = ";")

# Read in the tsv file with readr
mtcars <- read_tsv("mtcars.tsv")

# Read in the tsv file with base
mtcars <- read.table("mtcars.tsv", sep = "\t", header = T)

# Importing a sav file from SPSS
read_sav("ZA5950_v2-0-0.sav")

# Reading in an xlsx file
dfxlsx <- read.xlsx("mtcars.xlsx", header = T, sheetIndex = 1, row.names = 1)

# I would recommend fread-- You won't notice the difference on small files but for large files like you might see
# in political science and public policy, it can save you a lot of waiting.

# But readr has some very useful new functionality like if multiple files of same columns are in same directory
# it can read them all into one file.

# FUNCTIONS FOR READING FILES

# read.table, read.csv, for reading tabular data
# readLines, for reading lines of a text file
# source, for reading in R code files (inverse of dump)
# dget, for reading in R code files (inverse of dput)
# load, for reading in saved workspaces
# unserialize, for reading single R objects in binary form

# FUNCTIONS FOR WRITING FILES

# write.table, for writing tabular data to text files (i.e. CSV) or connections
# writeLines, for writing character data line-by-line to a file or connection
# dump, for dumping a textual representation of multiple R objects
# dput, for outputting a textual representation of an R object
# save, for saving an arbitrary number of R objects in binary format (possibly compressed) to a file.
# serialize, for converting an R object into a binary format for outputting to a connection (or file).

# What is the row number for this dataset?

nrow(df)

# What is the column number for this dataset?

ncol(df)

# What are the dimensions for this dataset? Use the function for this.

dim(df)

# What are the variable names for the dataset?

colnames(df)
