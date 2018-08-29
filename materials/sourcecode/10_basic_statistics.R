## ------------------------------------------------------------------------
normal_distr <- rnorm(1000)
hist(normal_distr)

## ---- echo=TRUE----------------------------------------------------------
# draw a random sample from a normal distribution with a large standard deviation
largevar <- rnorm(10000, mean = 5000, sd = 5)
# draw a random sample from a normal distribution with a small standard deviation
littlevar <- rnorm(10000, mean = 5000, sd = 1)

# visualize the distributions of both samples with a density plot
plot(density(littlevar), col = "blue", 
     xlim=c(min(largevar), max(largevar)), main="Income Distribution")
lines(density(largevar), col = "red")


## ---- echo=TRUE----------------------------------------------------------
# Install the R-package called "moments" with the following command (if not installed yet):
# install.packages("moments")

# load the package
library(moments)


## ---- echo=TRUE----------------------------------------------------------
# draw a random sample of simulated data from a normal distribution
# the sample is of size 1000 (hence, n = 1000)
sample <- rnorm(n = 1000)

# plot a histogram and a density plot of that sample
# note that the distribution is neither strongly positively nor negatively skewed
# (this is to be expected, as we have drawn a sample from a normal distribution!)
hist(sample)
plot(density(sample))

# now compute the skewness
skewness(sample)

# Now we intentionally change our sample to be strongly positively skewed
# We do that by adding some outliers (observations with very high values) to the sample 
sample <- c(sample, (rnorm(200) + 2), (rnorm(200) + 3))

# Have a look at the distribution and re-calculate the skewness
plot(density(sample))
skewness(sample)


#


## ------------------------------------------------------------------------
# draw a random sample of simulated data from a normal distribution
# the sample is of size 1000 (hence, n = 1000)
sample <- rnorm(n = 1000)

# plot the density & compute the kurtosis
plot(density(sample))
kurtosis(sample)

# now lets remove observations from the extremes in this distribution
# we thus intentionally alter the distribution to have less mass in its tails
sample <- sample[ sample > -0.6 & sample < 0.6]

# plot the distribution again and see how the tails of it (and thus the kurtosis has changed)
plot(density(sample))

# re-calculate the kurtosis
kurtosis(sample)
# as expected, the kurtosis has now a lower value


## ---- echo=TRUE----------------------------------------------------------
# own implementation
sum((sample-mean(sample))^3) / ((length(sample)-1) * sd(sample)^3)

# implementation in moments package
skewness(sample)

## ---- echo=TRUE----------------------------------------------------------
# own implementation
sum((sample-mean(sample))^4) / ((length(sample)-1) * sd(sample)^4)

# implementation in moments package
kurtosis(sample)

## ----dice10, echo=TRUE---------------------------------------------------
# first we define the potential values a die can take
dvalues <- 1:6 # the : operater generates a regular sequence of numbers (from:to)
dvalues
# define the size of the sample n (how often do we roll the die...)
# for a start, we only roll the die ten times
n <- 10
# draw the random sample: 'roll the die n times and record each result'
results <- sample( x = dvalues, size = n, replace = TRUE)
# compute the mean
mean(results)

## ----dice100, echo=TRUE--------------------------------------------------
n <- 100
# draw the random sample: 'roll the die n times and record each result'
results <- sample( x = dvalues, size = n, replace = TRUE)
# compute the mean
mean(results)

## ----lln, echo=TRUE------------------------------------------------------
# Essentially, what we are doing here is repeating the experiment above many times, each time increasing n.
# define the set of sample sizes
ns <- seq(from = 10, to = 50000, by = 10)
# initiate an empty list to record the results
means <- list()
length(means) <- length(ns)
# iterate through each sample size: 'repeat the die experiment for each sample size'
for (i in 1:length(ns)) {
     
     means[[i]] <- mean(sample( x = dvalues, size = ns[i], replace = TRUE))
}

# visualize the result: plot sample means against sample size
plot(ns, unlist(means),
     ylab = "Sample Mean",
     xlab = "Sample Size",
     pch = 16,
     cex = .6)
abline(h = 3.5, col = "red")

## ----t-test--------------------------------------------------------------

# First we roll the die like above
n <- 100
# draw the random sample: 'roll the die n times and record each result'
results <- sample( x = dvalues, size = n, replace = TRUE)
# compute the mean
sample_mean <- mean(results)
# compute the sample sd
sample_sd <- sd(results)
# estimated standard error of the mean
mean_se <- sample_sd/sqrt(n)

# compute the t-statistic:
t <- (sample_mean - 3.5) / mean_se
t


## ----p-value-------------------------------------------------------------
# calculate the p-value associated with the t-value calculated above
2*pnorm(-abs(t))

## ----clt-----------------------------------------------------------------
# define the set of sample sizes
ns <- c(10, 40, 100)
# initiate an empty list to record the results
ts <- list()
length(ts) <- length(ns)
# iterate through each sample size: 'repeat the die experiment for each sample size'
for (i in 1:length(ns)) {
     
     samples.i <- sapply(1:500000, function(j) sample( x = dvalues, size = ns[i], replace = TRUE))
     ts[[i]] <- apply(samples.i, function(x) (mean(x) - 3.5) / sd(x), MARGIN = 2)
}

# visualize the result: plot the density for each sample size

# plot the density for each set of t values
hist(ts[[1]], main = "Sample size: 10", xlab = "T-value")
hist(ts[[2]], main = "Sample size: 40", xlab = "T-value")
hist(ts[[3]], main = "Sample size: 100", xlab = "T-value")

# finally have a look at the actual standard normol distribution as a reference point
plot(function(t)dnorm(t), -4, 4, main = "Normal density")

## ------------------------------------------------------------------------
# initiate sample
a <- c(10,22,33, 22, 40)
names(a) <- c("Andy", "Betty", "Claire", "Daniel", "Eva")

# compute the mean
mean(a)
# compute the median
median(a)


## ---- echo=TRUE----------------------------------------------------------
range(a)
var(a)
sd(a)


## ------------------------------------------------------------------------
# define size of sample
n <- 100
# draw the random sample from a normal distribution with mean 10 and sd 2
sample <- rnorm(n, mean = 10, sd = 2)

# Test H0: mean of population = 10 
t.test(sample, mu = 10)


## ------------------------------------------------------------------------
model1 <- Examination~Education

## ------------------------------------------------------------------------
fit1 <- lm(formula = model1, data = swiss)

## ------------------------------------------------------------------------
summary(fit1)

## ------------------------------------------------------------------------
# load data
data(swiss)

# linear regression with one variable
# estimate coefficients
model_fit <- lm(Examination~Education, data = swiss)
# t-tests of coefficients (and additional statistics)
summary(model_fit)


## ------------------------------------------------------------------------
# multiple linear regression
# estimate coefficients
model_fit2 <- lm(Examination~Education + Catholic + Agriculture, data = swiss)
# t-tests of coefficients (and additional statistics)
summary(model_fit2)


## ------------------------------------------------------------------------
# load packages
library(stargazer)

# print regression results as text
stargazer(model_fit, model_fit2, type = "text")

## ------------------------------------------------------------------------
# load packages
library(stargazer)

# print regression results as text
stargazer(model_fit, model_fit2, type = "latex")

