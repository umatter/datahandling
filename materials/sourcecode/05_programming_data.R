## ------------------------------------------------------------------------
# A vector containing numeric (or integer) values
numeric_vector <- 10:20
numeric_vector[2]
numeric_vector[2:5]

# A string vector ('a vector containing text')
string_vector <- c("a", "b", "c")
string_vector[-3]

# Lists
# A list can contain different types of elements, for example a numeric vector and a string_vector
mylist <- list(numbers = numeric_vector, letters = string_vector)
mylist

# We can access the elements of a list in various ways
# with the element's name
mylist$numbers
mylist["numbers"]
# via the index
mylist[1]
# with [[]] we can access directly the content of the element
mylist[[1]]

# lists can also be nested (list of lists of lists....)
mynestedlist <- list(a = mylist, b = 1:5)

## ------------------------------------------------------------------------

# matrices
mymatrix <- matrix(numeric_vector, nrow = 4)
# get the second row
mymatrix[2,]
# get the first two columns
mymatrix[, 1:2]

# data frames ("lists as columns")
mydf <- data.frame(Name = c("Alice", "Betty", "Claire"), Age = c(20, 30, 45))
mydf
# select the age column
mydf$Age
mydf[, "Age"]
mydf[, 2]
# select the second row
mydf[2,]



## ------------------------------------------------------------------------
# have a look at what kind of object you are dealing with
class(mydf)
class(mymatrix)

# have a closer look at the data structure
str(mydf)

