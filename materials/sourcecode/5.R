
# R AS A CALCULATOR --------------------


## ------------------------------------------------------------------------
# basic arithmetic 
sum_result <- 2+2
sum_result
sum_result -2
4*5
20/5




# work with variables
a <- 20
b <- 10
a/b



# arithmetics with vectors
a <- c(1,4,6)
b <- c(10,40,80)
a * 2



# note the 'vectorization' built into R
a * b
a + b 



# 'math' functions
sum(b)



# vector multiplication
a * b # a_1 * b_1, a_2 * b_2, ... (a and be are of same length!)
a %*% b # the 'inner product'  (same as sum(a*b))
a %o% b # the 'outer product' 
sum(diag(a %o% b))



# matrices
A <- matrix(1:20, nrow=4) # 4 x 5
B <- matrix(1:20, nrow=5) # 5 x 4

C <- A * B # does not work (dimensionality!)
C <- A %*% B # 'dot product' # 4 x 4









## LOOPS -------------------

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







## BOOLEANS, CONTROL FLOW ----------------


2+2 == 4
3+3 == 7


## ------------------------------------------------------------------------

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





# WRITE YOUR FIRST FUNCTION ------------------

##########################################################################
# Mean Function:
# Computes the mean, given a 
# numeric vector.
# x, a numeric vector
# returns the arithmetic mean of x (a numeric scalar)
#
# Example:
# a integer vector, for which we want to compute the mean
# a <- c(5.5, 7.5)
# desired functionality and output:
# my_mean(a)
# 6.5
#
##########################################################################

























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

