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


