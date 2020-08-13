## ---- echo=FALSE, results='asis', warning=FALSE---------------------------------------------------
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


## cat helloworld.txt


## cat ../../data/helloworld.txt; echo


## xxd -b helloworld.txt


## xxd -b ../../data/helloworld.txt


## xxd  helloworld.txt


## xxd  ../../data/helloworld.txt


## cat hastamanana.txt


## file -b hastamanana.txt


## file -b ../../data/hastamanana.txt


## iconv -f iso-8859-1 -t utf-8 hastamanana.txt | cat


## iconv -f iso-8859-1 -t utf-8 ../../data/hastamanana.txt | cat




## xxd ../../data/ch_gdp.csv




## -------------------------------------------------------------------------------------------------
a <- 1.5
b <- 3


## -------------------------------------------------------------------------------------------------
typeof(a)
class(a)


## -------------------------------------------------------------------------------------------------
a + b


## -------------------------------------------------------------------------------------------------
a <- "1.5"
b <- "3"


## -------------------------------------------------------------------------------------------------
typeof(a)
class(a)


## ----error=TRUE-----------------------------------------------------------------------------------
a + b




## -------------------------------------------------------------------------------------------------
persons <- c("Andy", "Brian", "Claire")
persons


## -------------------------------------------------------------------------------------------------
ages <- c(24, 50, 30)
ages




## -------------------------------------------------------------------------------------------------
gender <- factor(c("Male", "Male", "Female"))
gender




## -------------------------------------------------------------------------------------------------
my_matrix <- matrix(c(1,2,3,4,5,6), nrow = 3)
my_matrix



## -------------------------------------------------------------------------------------------------
my_array <- array(c(1,2,3,4,5,6,7,8), dim = c(2,2,2))
my_array





## -------------------------------------------------------------------------------------------------
df <- data.frame(person = persons, age = ages, gender = gender)
df





## -------------------------------------------------------------------------------------------------
my_list <- list(my_array, my_matrix, df)
my_list

