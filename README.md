


# Prerequisites

```{r}
install.packages("tidyverse")
install.packages("knitr")
install.packages("bookdown")
```

# About
Lecture materials for the course 'Data Handling: Import, Cleaning and Visualisation'. The materials consist of three parts:

 - Lecture notes: `materials/notes/`
 - Lecture slides: `materials/slides/`
 - Exercises: `materials/exercises`
 

# Compillation of materials

Run the following in the OSX terminal:
```{bash}
sh makeall_datahandling.sh
```
This tests all the R code, compiles notes as html (`materials/notes/html`) and pdf (`materials/notes/pdf`), slides as html/ioslides (`materials/slides/html`), and sourcecode (`materials/sourcecode`).
Then all slides, notes, and sourcecodes are copied to the website backend, and the website is re-generated with jeckyll.


