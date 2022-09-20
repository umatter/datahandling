# Script that checks which images are actually embedded in any file,
# given one or several folders of rmd files and a folder of images.
#
# Images that are not found to be embedded in any file, are removed from
# the image folder (either deleted or moved to a given folder)

remove_images <- 
  function(img, files, delete=FALSE, img_archive=NULL) {
    
    require(stringr)
    
    if (!delete & is.null(img_archive)){
      stop("Path to image archive is missing!\n")
    }
    
    # get a list of all the images
    images <- list.files(path = img)
    images_paths <- list.files(path = img,
                               full.names = TRUE)
    
    # read all the files as strings
      files_found <- unlist(lapply(files,
                                   list.files,
                      full.names = TRUE, recursive = TRUE,
                      pattern= "\\.Rmd"))
      docs <- lapply(files_found, readLines)
      docs <- lapply(docs, paste, collapse = " ")
      
    # find images in files
    matches <- unique(unlist(lapply(docs, str_which, pattern = images)))
    images_not_used <- images_paths[matches*-1]
    
    if (!delete) {
      # move the unused images
      copied <- file.copy(from = images_not_used,
                to = img_archive, overwrite = TRUE)
      if (all(copied)){
        lapply(images_not_used, unlink)
      }
      
    } else {
      lapply(images_not_used, unlink)
    }
      
      
  }

    