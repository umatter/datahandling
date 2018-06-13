#################################################################
# HSG course: Introduction to Web Mining for Social Scientists
# Utility functions
# 
# U.Matter, Cambridge
# First version: March 31, 2017
#################################################################

# Function to render all rmd notebooks
render_all <- 
     function(dir = "materials/notes", file = NULL) {
          # load packages 
          require(knitr)
          require(rmarkdown)
          
          if (is.null(file)) {
               # get paths of all RMD files in dir
               files <- list.files(dir, pattern = ".Rmd", full.names = TRUE)
               
          } else {
               files <- paste0(dir, "/", file)
          }
          
          # render all
          for (f in files) {
               
               # self contained html page
               render(input = f, output_format = html_document(self_contained = TRUE),
                      output_dir = "materials/notes/html", quiet = TRUE)
               cat(paste0("Rendering ", f, " as HTML\n"))
               # markdown
               render(input = f, output_format = "md_document",
                      output_dir = "materials/notes/md",
                      quiet = TRUE)
               cat(paste0("Rendering ", f, " as MD\n"))
               # pdf
               render(input = f, output_format = pdf_document2(toc=FALSE), 
                      output_dir = "materials/notes/pdf", quiet = TRUE)
               cat(paste0("Rendering ", f, " as PDF\n"))
               # R code
               output_path <- paste0("materials/sourcecode/", gsub(".Rmd", ".R", f, fixed = TRUE))
               purl(input = f,
                    output = output_path,
                    documentation = 1)
               cat(paste0("Generating ", f, " as R-Script\n"))
          }
     }


# read part2 solutions
# x path to a text file with the solutions
# n numeric, indicating the number of responses (according to instructions/exercise)
read_part2 <-
     function(x, n=10) {
          require(stringr)
          # read text
          text <- readLines(x)
          # keep lines mentioning TRUE or FALSE, check if file complete
          tf <- text[grepl("TRUE", text) | grepl("FALSE", text) ]
          stopifnot(length(tf)==n)
          
          # clean responses
          tf <- as.logical(unlist(str_extract_all(string = tf, pattern = "(TRUE|FALSE)")))
          
          return(tf)

     }

# compare part2 solutions
# off_sol, stud_sol locigal vectors containing the official and student's solution, respectively
compare_part2 <-
     function(stud_sol, off_sol) {
          corr <- as.numeric(off_sol == stud_sol)
          
          return(corr)
          
     }


