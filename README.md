


# Prerequisites

```{r}
install.packages("tidyverse")
install.packages("knitr")
install.packages("bookdown")
```
As well as all the packages used in the code examples.


# About
Lecture materials for the SEPS-HSG (University of St. Gallen) course 'Data Handling: Import, Cleaning and Visualisation' (BA, Major in Economics). The materials consist of two parts:

 - Lecture notes: `materials/notes/`
 - Lecture slides: `materials/slides/`


# Compillation of materials

Run the following in the terminal:
```{bash}
sh makeall_datahandling.sh
```
This tests all the R code, compiles notes as html (`materials/notes/html`) and pdf (`materials/notes/pdf`), slides as html/ioslides (`materials/slides/html`), and outputs the sourcecode of code examples in the notes to an R script (`materials/sourcecode`).

# How to contribute

- Open issues:
  - report bugs
  - suggest enhancements
- Resolve open issues with a pull request


