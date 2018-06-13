#################################################################
# HSG course: Introduction to Web Mining for Social Scientists
# Utility functions
# 
# U.Matter, Cambridge
# First version: September 17, 2017
#################################################################

# PREAMBLE --------

# load packages 
require(knitr)
require(rmarkdown)
require(bookdown)
# set fixed variables
DIR <- "materials/notes"


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
     rmarkdown::render(input = f, output_format = html_document2(self_contained = TRUE,
                                                                 toc=FALSE,
                                                                 theme="cerulean",
                                                                 highlight="tango"),
                       output_dir = "materials/notes/html", quiet = TRUE)
     
     # pdf (due to a bug, pdf_document2 does not work with output_dir)
     cat(paste0("Rendering ", f, " as PDF\n"))
     output_file <- gsub(".Rmd", ".pdf", f_name, fixed = TRUE)
     output_path <- gsub(".Rmd", ".pdf", f, fixed = TRUE)
     output_dest <- paste0("materials/notes/pdf/", output_file)
     rmarkdown::render(input = f, output_format = pdf_document2(toc=FALSE),
                       quiet = TRUE, clean=TRUE)
     file.copy(from = output_path, to = output_dest, overwrite = TRUE)
     file.remove(output_path)
     
     # R code
     cat(paste0("Generating ", f, " as R-Script\n"))
     output_path <- paste0("materials/sourcecode/", gsub(".Rmd", ".R", f_name, fixed = TRUE))
     purl(input = f,
          output = output_path,
          documentation = 1)
}


