## cat helloworld.txt; echo

## cat ../../data/helloworld.txt; echo

## xxd -b helloworld.txt

## xxd -b ../../data/helloworld.txt

## xxd  data/helloworld.txt

## xxd  ../../data/helloworld.txt

## cat hastamanana.txt; echo

## file -b data/hastamanana.txt

## file -b ../../data/hastamanana.txt

## iconv -f iso-8859-1 -t utf-8 hastamanana.txt | cat

## iconv -f iso-8859-1 -t utf-8 ../../data/hastamanana.txt | cat

## xxd ../../data/ch_gdp.csv

## xxd ../../data/ch_gdp.csv

## ------------------------------------------------------------------------
a <- 1.5
b <- 3

## ------------------------------------------------------------------------
typeof(a)
class(a)

## ------------------------------------------------------------------------
a + b

## ------------------------------------------------------------------------
a <- "1.5"
b <- "3"

## ------------------------------------------------------------------------
typeof(a)
class(a)

## ----error=TRUE----------------------------------------------------------
a + b

## ------------------------------------------------------------------------
persons <- c("Andy", "Brian", "Claire")
persons

## ------------------------------------------------------------------------
ages <- c(24, 50, 30)
ages

## ------------------------------------------------------------------------
gender <- factor(c("Male", "Male", "Female"))
gender

## ------------------------------------------------------------------------
my_matrix <- matrix(c(1,2,3,4,5,6), nrow = 3)
my_matrix


## ------------------------------------------------------------------------
my_array <- array(c(1,2,3,4,5,6), dim = 3)
my_array


## ------------------------------------------------------------------------
df <- data.frame(person = persons, age = ages, gender = gender)
df


## ------------------------------------------------------------------------
my_list <- list(my_array, my_matrix, df)
my_list

