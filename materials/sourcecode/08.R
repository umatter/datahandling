## SET UP -----------
library(tidyverse)


## Clean messy data --------------------

# initiate a messy data set
messy_df <- data.frame(last_name = c("Wayne", "Trump", "Karl Marx"),
                       first_name = c("John", "Melania", ""),
                       gender = c("male", "female", "Man"),
                       date = c("2018-11-15", "2018.11.01", "2018/11/02"),
                       income = c("150,000", "250000", "10000"),
                       stringsAsFactors = FALSE)


# Find/replace character strings, recode factor levels -------------

# simple approach (problem?)
messy_df$gender <- as.factor(messy_df$gender)
messy_df$gender # not really meaningful categories!

# clean messy cagegories
messy_df$gender[messy_df$gender == "Man"] <- "male" # find/replace
messy_df$gender # the problem is not really solved!

# better approach via tidyverse!
messy_df$gender <- fct_recode(messy_df$gender, "male" = "Man")
messy_df$gender




## Removing individual characters from a string -------------------

# prepare income variable
as.integer(messy_df$income) # proper data type causes a problem


## replace characters in a string to clean this variable!
messy_df$income <- str_replace(messy_df$income, pattern = ",", replacement = "")


## try to set the type again
messy_df$income <- as.integer(messy_df$income)


## Splitting strings ------------------------------------------------

# First, we split the strings at every occurrence of white space (" "). 
#Setting the option simplify=TRUE, we get a matrix containing the individual sub-strings after the splitting.

splitnames <- str_split(messy_df$last_name, pattern = " ", simplify = TRUE)
splitnames


## As the first two observations did not contain any white space, there was nothing to split there and the function simply returned empty strings ""
problem_cases <- messy_df$first_name == ""
messy_df$first_name[problem_cases] <- splitnames[problem_cases, 1]


## Finally, we have to correct the last_name column by replacing the respective values.
messy_df$last_name[problem_cases] <- splitnames[problem_cases, 2]
messy_df




## Parsing dates ---------------------

# load additional package to handle dates
library(lubridate)

## parse as date
messy_df$date <- ymd(messy_df$date)


## inspect the final (cleaned) dataset --------------------------------
messy_df

str(messy_df)






##  Tidying messy datasets. ------------------------




## Gathering (‘wide to long’)
wide_df <- data.frame(last_name = c("Wayne", "Trump", "Marx"),
                       first_name = c("John", "Melania", "Karl"),
                       gender = c("male", "female", "male"),
                       income.2018 = c("150000", "250000", "10000"),
                      income.2017 = c( "140000", "230000", "15000"),
                      stringsAsFactors = FALSE)
wide_df


## change wide to long
long_df <- gather(wide_df, income.2018, income.2017, key = "year", value = "income")
long_df

## clean up
long_df$year <- str_replace(long_df$year, "income.", "")
long_df


## Spreading (‘long to wide’) -----------------

# weird df example
weird_df <- data.frame(last_name = c("Wayne", "Trump", "Marx",
                                     "Wayne", "Trump", "Marx",
                                     "Wayne", "Trump", "Marx"),
                       first_name = c("John", "Melania", "Karl",
                                      "John", "Melania", "Karl",
                                      "John", "Melania", "Karl"),
                       gender = c("male", "female", "male",
                                  "male", "female", "male",
                                  "male", "female", "male"),
                       value = c("150000", "250000", "10000",
                                 "2000000", "5000000", "NA",
                                 "50", "25", "NA"),
                       variable = c("income", "income", "income",
                                    "assets", "assets", "assets",
                                    "age", "age", "age"),
                       stringsAsFactors = FALSE)
weird_df


##  change to wide in order to clean df (make it tidy)
tidy_df <- spread(weird_df, key = "variable", value = "value")
tidy_df






## Tutorial

# SET UP --------------

# load packages
library(tidyverse)
library(janitor) # install.packages("janitor") (if not yet installed)

# fix variables
url_h1 <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-11/H1.csv"
url_h2 <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-11/H2.csv"

## DATA IMPORT -----------------

h1 <- read_csv(url_h1)
h2 <- read_csv(url_h2)



## -------------------------------------------------------------------------------------------------
## CLEAN DATA -------------------------

# use the janitor-package clean_names function. see ?clean_names for details
h1 <- clean_names(h1)
h2 <- clean_names(h2)

# add column to clarify origin of observation
h1 <- mutate(h1, hotel="Resort Hotel")
h2 <- mutate(h2, hotel="City Hotel")

# stack observations
hotel_df <- bind_rows(h1,h2)

# inspect the first observations
head(hotel_df)


