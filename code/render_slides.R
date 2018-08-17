#################################################################
# HSG course: Data Handling
# Script to render ioslides
# 
# U.Matter, Zurich
# First version: July 2018
#################################################################

# PREAMBLE --------

# load packages 
require(knitr)
require(rmarkdown)
require(bookdown)
# set fixed variables
DIR <- "materials/slides"


# PREPARATION ---------
# get all files to be rendered
file_paths <- list.files(DIR, pattern = ".Rmd", full.names = TRUE)
file_names <- list.files(DIR, pattern = ".Rmd", full.names = FALSE)

# RENDERING ----------
# render all
for (i in 1:length(file_paths)) {
     
     f <- file_paths[i]
     f_name <- file_names[i]
     
     # self contained html page
     cat(paste0("Rendering ", f, " as HTML\n"))
     rmarkdown::render(input = f, output_format = NULL,
                       output_dir = "materials/slides/html", quiet = TRUE)
     
}


