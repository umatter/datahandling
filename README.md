
# About
Lecture materials for the SEPS-HSG (University of St. Gallen) course 'Data Handling: Import, Cleaning and Visualisation' (BA, Major in Economics). The materials consist of two parts:

 - Lecture notes: `materials/notes/`
 - Lecture slides: `materials/slides/`

# How to contribute

- Open issues:
  - report bugs
  - suggest enhancements
- Resolve open issues with a pull request


# Prerequisites

```{r}
install.packages("tidyverse")
install.packages("knitr")
install.packages("bookdown")
install.packages("pacman")
install.packages("qdapRegex")
```
As well as all the packages used in the code examples.


```{r}

# get a list of all rmd files (slides and notes)
notes_files <- list.files("materials/notes", pattern = "\\.Rmd", full.names =TRUE)
slides_files <- list.files("materials/slides", pattern = "\\.Rmd", full.names = TRUE)
all_files <- c(notes_files, slides_files)

# parse the rmds, extract a list of package dependencies
rmds <- lapply(all_files, readLines)
to_install <- lapply(rmds, qdapRegex::rm_between, 
                     left = c("library(", "require("),
                     right = c(")", ")"),
                     extract = TRUE)
to_install <-  unique(na.omit(unlist(to_install)))
to_install <- to_install[! to_install %in% c("PACKAGE-NAME",  "<PACKAGE NAME>")]

# install all missing packages
pacman::p_load(char = to_install)
```


# Compillation of materials

Run the following in the terminal:
```{bash}
sh makeall_datahandling.sh
```
This tests all the R code, compiles notes as html (`materials/notes/html`) and pdf (`materials/notes/pdf`), slides as html/ioslides (`materials/slides/html`), and outputs the sourcecode of code examples in the notes to an R script (`materials/sourcecode`).


