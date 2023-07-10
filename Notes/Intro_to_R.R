# Comments - like Python, use pound

# VARIABLES
number <- 5
print(number)

number <- number + 3
print(number)

# you have to run each line individually for it to compile

# R Objects ####
ls() # print names of all objects

number <- 5
decimal <- 0.5
letter <- 'a'
word <- 'hello'
logic <- TRUE
logic2 <- T

# CLASSES of variables
# there are three main classes - numeric, character, logical
class(number) # numeric
class(decimal)
class(letter) # character
class(word)
class(logic) # logical

# TYPES of variables
typeof(number) # double
typeof(decimal)

# change type of variable using function
as.character(number)
as.integer(decimal) # truncates
print(number) # but number is kept as variable

# rounding numbers
round(decimal) # rounds normally
round(22/7, 3) # specify number of digits - 3
?round # gives you the documentation OR pull up help tab and search manually

ceiling(22/7) # always rounds up
floor(22/7) # always rounds down

as.integer(word) # returns 'NA', which is a missing/unknown value


# NAMING
name <- "fornax"
NAME <- "caelum"
n.a.m.e <- "cetus"
n_a_m_e <- "eridanus"

# operators and conditionals can not be used in names
# these symbols don't work: $, comma, \, spaces
# names can't start with number or underscore

# good naming conventions
camelCase <- 'start with capital letter'
snake_case <- 'underscore between words'

## Object Manipulation ####

paste() # concats characters/words/numbers/logics with space inbetween
paste0() # concats without space

paste(logic, ":", name, "says", word, number, "times")

# Patterns
?grep
food <- "watermelon"
grepl("me", food) # does food have 'me' in it?
sub('me', 'you', food) # subs 'me' with 'you'

rm(logic2) # removes logic2 from environment (can do with multiple objects)

# drop-downs ??

# Vectors ####
# R VECTORS START AT 1 NOT 0
# make a vector of numerics:
numbers <- c(1, 2, 3, 4, 5) #combining things into a vector

letters <- c('a', 'b', 'c', 'd')
# paste is different because it combines the elements into one, but vectors are like arrays
letters <- c(letters, 'e')
letters <- c(letters, letters)

rangeOfVals <- 1:5 # all integers 1 through 5

?seq
seq(2, 10, 2) # (from, to, by)
seq(from = 2, to = 10, by = 2)
seq(by = 2, from = 2, to = 10)

?rep
rep(3, 5)
rep(c(1, 2), 5)

seq(1, 5, 0.5)
c(rep(1, 3), rep(2, 3))
rep(1:2, each =3)

# make a vector of random numbers between1 and 20
numbers <- 1:20

fiveNums <- sample(numbers, 5) #takes five random nums and "removes" them
fiveNums
fiveNums <- sample(numbers, 5, replace = T) # replace ensures there can be duplicates now and for future samples
fiveNums <- sort(fiveNums)
fiveNums

length(fiveNums) # length of a vector
unique(fiveNums) # what are the unique values int he vector
length(unique(fiveNums))

table(fiveNums) #first row = unique values, second row = count of num in vector

fiveNums + 5 # adds 5 to every element

nums1 <- c(1, 2, 3)
nums2 <- c(4, 5, 6)
nums1 + nums2 # adds theme element-wise

nums3 <- c(nums1, nums2)
nums1 + nums3

sum(nums3) # cumulative sum of all elements

# Vector indexing
# R has first index as 1
numbers <- c(1, 4, 7, 2, 8, 3, 0)
numbers[1]
numbers[5]

numbers[c(1, 2, 3, 4, 5)] #multiple elements returned
numbers[1:5] # range of elements
numbers[c(3, 5, 2, 6)]



# DATA SETS ####
?datasets
library(help = "datasets") # list of datasets in package

?mtcars # about the dataset
mtcars # prints to console to a degree

View(mtcars) # capital letter!! brings new, cean view to new tab

summary(mtcars) # gives information about the spread of each variable
str(mtcars) # good OVERVIEW of a dataset unlike ^
names(mtcars) # names of variables
head(mtcars) # variables + first 6 rows (REALLY Good!!)
head(mtcars, 10) # specify how may rows to preview

## Pull out individual variables as vectors
mpg <- mtcars[,1] # blank means "all". All rowsm first column
mpg

mtcars[3,] # third row, all columns
mtcars[2, 2] value at second row and second column

# use the names of the variables/columns to pull out vectors

mtcars$gear
mtcars[c("gear", "mpg")]

sum(mtcars$gear)





# IRIS DATASET EXAMPLE

iris
View(iris)
first5 <- iris$Sepal.Length[1:5]
first5

mean(iris$Sepal.Length)
median(iris$Sepal.Length)

range(first5)
max(iris$Sepal.Length) - min(iris$Sepal.Length)

quantile(first5, 0.25)

sl <- iris$Sepal.Length
# outliers < mean - 3 * sd
lower <- mean(sl) - 3*sd(sl)
# outliers < mean + 3 * sd
upper <- mean(sl) + 3 * sd(sl)
# outliers < Q1 - 1.5 * IQR
quantile(sl, 0.25) - 1.5 * IQR(sl)
# outliers > Q3 + 1.5 * IQR
quantile(sl, 0.75) + 1.5 * IQR(sl)

# Subsetting vectors
first5
first5 < 4.75 | first5 > 5 # which ones are true or false
first5[first5 < 4.75] # keeps only those values and removes others

values <- c(first5, 3, 9)
values
values[values > lower | values < upper] # removes outliers


# Read in Data
getwd() # get working directory
superData <- read.csv("Data/super_hero_powers.csv")
View(superData)




## Conditionals ####
x <- 5

x < 3 #these just return true or false
x > 3
x == 3
x == 5
x!= 3

numbers <- 1:5
numbers < 3 # compares each element to 3

# subsetting
numbers[1]
numbers[c(1, 2)]
numbers[1:2]
numbers[numbers < 3]

?c


# managing NA values
sum(1, 2, 3, NA) # returns NA
sum(1, 2, 3, NA, na.rm=T) # disregads NA

mean(c(1, 2, 3, NA), na.rm=T)