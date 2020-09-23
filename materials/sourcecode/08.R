

## SET UP --------------
library(tidyverse)


## -a messy df
messy_df <- data.frame(last_name = c("Wayne", "Trump", "Karl Marx"),
                       first_name = c("John", "Melania", ""),
                       gender = c("male", "female", "Man"),
                       date = c("2018-11-15", "2018.11.01", "2018/11/02"),
                       income = c("150,000", "250000", "10000"),
                       stringsAsFactors = FALSE)





## FACTORS EXAMPLE 
messy_df$gender <- as.factor(messy_df$gender)
messy_df$gender


messy_df$gender[messy_df$gender == "Man"] <- "male"
messy_df$gender


messy_df$gender <- fct_recode(messy_df$gender, "male" = "Man")
messy_df$gender





## NUMBERS: INTEGER
as.integer(messy_df$income)



## clean values!
messy_df$income <- str_replace(messy_df$income, pattern = ",", replacement = "")


## try it again!
messy_df$income <- as.integer(messy_df$income)


## -------------------------------------------------------------------------------------------------
splitnames <- str_split(messy_df$last_name, pattern = " ", simplify = TRUE)
splitnames


## -------------------------------------------------------------------------------------------------
problem_cases <- messy_df$first_name == ""
messy_df$first_name[problem_cases] <- splitnames[problem_cases, 1]


## -------------------------------------------------------------------------------------------------
messy_df$last_name[problem_cases] <- splitnames[problem_cases, 2]
messy_df


## ----message=FALSE--------------------------------------------------------------------------------
library(lubridate)


## -------------------------------------------------------------------------------------------------
messy_df$date <- ymd(messy_df$date)


## -------------------------------------------------------------------------------------------------
messy_df


## -------------------------------------------------------------------------------------------------
str(messy_df)






## ----echo=FALSE, warning=FALSE, message=FALSE-----------------------------------------------------
tidydata <- gather(data = rawdata, treatmenta, treatmentb, key = "treatment", value = "result" )
tidydata$treatment <- gsub("treatment", "", tidydata$treatment)




## -------------------------------------------------------------------------------------------------
wide_df <- data.frame(last_name = c("Wayne", "Trump", "Marx"),
                       first_name = c("John", "Melania", "Karl"),
                       gender = c("male", "female", "male"),
                       income.2018 = c("150000", "250000", "10000"),
                      income.2017 = c( "140000", "230000", "15000"),
                      stringsAsFactors = FALSE)
wide_df


## -------------------------------------------------------------------------------------------------
long_df <- gather(wide_df, income.2018, income.2017, key = "year", value = "income")
long_df


## -------------------------------------------------------------------------------------------------
long_df$year <- str_replace(long_df$year, "income.", "")
long_df


## -------------------------------------------------------------------------------------------------
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


## -------------------------------------------------------------------------------------------------
tidy_df <- spread(weird_df, key = "variable", value = "value")
tidy_df

