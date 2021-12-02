
## Merging -------------------------------------------------------------------------------------------------
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


## The merge command
df_merged <- merge(df_p, df_c, by="id")
df_merged

## "inner join"
df_merged2 <- merge(df_p, df_c, by="id", all = TRUE)
df_merged2





## Selection (of variables) -------------------------------------------------------------------------------------------------
df_selection <- select(df_merged, id, year, money_spent, currency)
df_selection






## Filtering (of observations) -------------------------------------------------------------------------------------------------
filter(df_selection, year == 2018)
# several conditions
filter(df_selection, year == 2018, money_spent < 5000, currency=="EUR")









## Mutating (adjust variables, compute new variables, etc.) -------------------------------------------------------------------------------------------------

# initiate example
exchange_rates <- data.frame(exchange_rate= c(0.9, 1, 1.2),
                             currency=c("USD", "CHF", "EUR"), stringsAsFactors = FALSE)
# combine data via merge
df_selection <- merge(df_selection, exchange_rates, by="currency")

## add a new variable via mutate
df_mutated <- mutate(df_selection, money_spent_chf = money_spent * exchange_rate)
df_mutated


## Compute Summary Statistics -------------------------------------------------------------------------------------------------
# simple example with the summarise function
summarise(df_mutated, 
          mean = mean(money_spent_chf),
          standard_deviation = sd(money_spent_chf),
          median = median(money_spent_chf),
          N = n())


## Compute aggregates per "group"/category (here per year)
by_year <- group_by(df_mutated, year)
summarise(by_year, 
          mean = mean(money_spent_chf),
          standard_deviation = sd(money_spent_chf),
          median = median(money_spent_chf),
          N = n())


## Summarizing the Swiss data set -------------------------------------------------------------------------------------------------
# load data
data("swiss")

## "Old approach" via sapply 
sapply(swiss, mean)

## Via summarise
summarise(swiss, 
          Fertility = mean(Fertility),
          Agriculture = mean(Agriculture)) # etc.







# Regression Basics -------------------------------------


## Illustration with code (Monte Carlo Analysis)
# set parameter values
alpha <- 30
beta <- 0.9
N <- 1000

# draw random sample
x <- runif(N, 0, 50)
# draw the random errors (all the other factors also affecting y)
epsilon <- rnorm(N, sd=10)
# compute the dependent variable values
y <- alpha + beta*x + epsilon


## Inspect pseudo data visually
plot(x,y)
abline(a = alpha, b=beta, col="red")



# compute average y per x intervals
lower <- c(0,10,20,30,40)
upper <- c(lower[-1], 50)
n_intervals <- length(lower)
y_bars <- list()
length(y_bars) <- n_intervals
x_bars <- list()
length(x_bars) <- n_intervals
for (i in 1:n_intervals){
  y_bars[i] <- mean(y[lower[i] <= x & x < upper[i]])
  x_bars[i] <- mean(x[lower[i] <= x & x < upper[i]])

}
y_bars <- unlist(y_bars)
x_bars <- unlist(x_bars)

# add to plot
plot(x,y)
abline(a = alpha, b=beta, col="red")
points(x_bars, y_bars, col="blue", lwd=10)


## Computation of slope coefficient ("averaging out u")
(mean(y) -30)/mean(x)


## Data Analytics perspective: data example
## # load the data
## data(swiss)
## # look at the description
## ?swiss


# load the data
data(swiss)
# inspect raw data
plot(swiss$Education, swiss$Examination)

# implement the simple OLS estimator
# verify implementation with simulated data from above
# my_ols(y,x) 
# should be very close to alpha=30 and beta=0.9
my_ols <- 
  function(y,x) {
    N <- length(y)
    betahat <- (sum(y*x) - N*mean(x)*mean(y)) / (sum(x^2)-N*mean(x)^2)
    alphahat <- mean(y)-betahat*mean(x)
    
    return(list(alpha=alphahat,beta=betahat))
  }

# estimate effect of Education on Examination
estimates <- my_ols(swiss$Examination, swiss$Education)
estimates


## inspect result
plot(swiss$Education, swiss$Examination)
abline(estimates$alpha, estimates$beta, col="red")


## linear regression in R 
estimates2 <- lm(Examination~Education, data=swiss)
estimates2
summary(estimates2)

