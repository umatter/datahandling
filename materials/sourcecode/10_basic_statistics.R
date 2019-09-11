## ---- echo=FALSE, results='asis', warning=FALSE--------------------------
# conditional on the output format of the whole document,
# generate and render a HTML or a LaTeX table.
if (knitr::is_latex_output()) {
  
  cat('
  \\begin{center}
  \\href{http://creativecommons.org/licenses/by-nc-sa/4.0/}{\\includegraphics[width = .1\\textwidth]{../img/cc.png}}
  
  \\smallskip
  
  This work is licensed under a \\href{http://creativecommons.org/licenses/by-nc-sa/4.0/}{Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License}
  \\end{center}
  '
  )
  
} else {
     cat('
     
   <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
   
')
}


## ----message=FALSE, warning=FALSE----------------------------------------
# load packages
library(tidyverse)

# initiate data frame on persons' personal spending
df_c <- data.frame(id = c(1:3,1:3),
                   money_spent= c(1000, 2000, 6000, 1500, 3000, 5500),
                   currency = c("CHF", "CHF", "USD", "EUR", "CHF", "USD"),
                   year=c(2017,2017,2017,2018,2018,2018))
df_c

# initiate data frame on persons' characteristics
df_p <- data.frame(id = 1:4,
                   first_name = c("Anna", "Betty", "Claire", "Diane"),
                   profession = c("Economist", "Data Scientist",
                                  "Data Scientist", "Economist"))
df_p


## ------------------------------------------------------------------------
df_merged <- merge(df_p, df_c, by="id")
df_merged


## ------------------------------------------------------------------------
df_merged2 <- merge(df_p, df_c, by="id", all = TRUE)
df_merged2


## ------------------------------------------------------------------------
df_selection <- select(df_merged, id, year, money_spent, currency)
df_selection


## ------------------------------------------------------------------------
filter(df_selection, year == 2018)


## ------------------------------------------------------------------------
filter(df_selection, year == 2018, money_spent < 5000, currency=="EUR")


## ------------------------------------------------------------------------
exchange_rates <- data.frame(exchange_rate= c(0.9, 1, 1.2),
                             currency=c("USD", "CHF", "EUR"), stringsAsFactors = FALSE)
df_selection <- merge(df_selection, exchange_rates, by="currency")


## ------------------------------------------------------------------------
df_mutated <- mutate(df_selection, money_spent_chf = money_spent * exchange_rate)
df_mutated


## ------------------------------------------------------------------------
summarise(df_mutated, 
          mean = mean(money_spent_chf),
          standard_deviation = sd(money_spent_chf),
          median = median(money_spent_chf),
          N = n())


## ------------------------------------------------------------------------
by_year <- group_by(df_mutated, year)
summarise(by_year, 
          mean = mean(money_spent_chf),
          standard_deviation = sd(money_spent_chf),
          median = median(money_spent_chf),
          N = n())


## ------------------------------------------------------------------------
# load data
data("swiss")


## ------------------------------------------------------------------------
sapply(swiss, mean)


## ------------------------------------------------------------------------
summarise(swiss, 
          Fertility = mean(Fertility),
          Agriculture = mean(Agriculture)) # etc.


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
# (this is to be expected, as we have drawn a sample from a normal distribution)
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

# plot the distribution again and see how the tails of it (and thus the kurtosis) has changed
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
# Essentially, what we are doing here is repeating the experiment above many times, 
# each time increasing n.
# define the set of sample sizes
ns <- seq(from = 10, to = 10000, by = 10)
# initiate an empty list to record the results
means <- list()
length(means) <- length(ns)
# iterate through each sample size: 'repeat the die experiment for each sample size'
for (i in 1:length(ns)) {
     
     means[[i]] <- mean(sample( x = dvalues,
                                size = ns[i],
                                replace = TRUE))
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
     
     samples.i <- sapply(1:100000, function(j) sample( x = dvalues,
                                                       size = ns[i],
                                                       replace = TRUE))
     ts[[i]] <- apply(samples.i, function(x) (mean(x) - 3.5) / sd(x), MARGIN = 2)
}

# visualize the result: plot the density for each sample size

# plot the density for each set of t values
hist(ts[[1]], main = "Sample size: 10", xlab = "T-value")
hist(ts[[2]], main = "Sample size: 40", xlab = "T-value")
hist(ts[[3]], main = "Sample size: 100", xlab = "T-value")

# finally have a look at the actual standard normol distribution as a reference point
plot(function(t)dnorm(t), -4, 4, main = "Normal density")

