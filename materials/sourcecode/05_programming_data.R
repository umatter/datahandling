## ------------------------------------------------------------------------
# vector to be summed up
numbers <- c(1,2.1,3.5,4.8,5)
# initiate total
total_sum <- 0
# number of iterations
n <- length(numbers)
# start loop
for (i in 1:n) {
     total_sum <- total_sum + numbers[i]
}

# check result
total_sum
# compare with result of sum() function
sum(numbers)


## ------------------------------------------------------------------------
# matrix to be summed up
numbers_matrix <- matrix(1:20, ncol = 4)
numbers_matrix


## ------------------------------------------------------------------------

# number of iterations for outer loop
m <- ncol(numbers_matrix)
# number of iterations for inner loop
n <- nrow(numbers_matrix)
# start outer loop (loop over columns of matrix)
for (j in 1:m) {
     # start inner loop
     # initiate total
     total_sum <- 0
     for (i in 1:n) {
          total_sum <- total_sum + numbers_matrix[i, j]
          }
     print(total_sum)
     }



## ------------------------------------------------------------------------
# initiate starting value
total <- 0
# start loop
while (total <= 20) {
     total <- total + 1.12
}

# check the result
total


## ------------------------------------------------------------------------
2+2 == 4
3+3 == 7

condition <- TRUE
if (condition) {
     print("This is true!")
} else {
     print("This is false!")
}

condition <- FALSE
if (condition) {
     print("This is true!")
} else {
     print("This is false!")
}



## ------------------------------------------------------------------------
# a simle integer vector, for which we want to compute the Mean
a <- c(5.5, 7.5)
# desired functionality and output:
# my_mean(a)
# 6.5

## ------------------------------------------------------------------------
sum(a)/length(a)

## ------------------------------------------------------------------------
# define our own function to compute the mean, given a numeric vector
my_mean <- function(x) {
     x_bar <- sum(x) / length(x)
     return(x_bar)
}

## ------------------------------------------------------------------------
# test it
my_mean(a)

## ------------------------------------------------------------------------
b <- c(4,5,2,5,5,7)
my_mean(b) # our own implementation
mean(b) # the built_in function

