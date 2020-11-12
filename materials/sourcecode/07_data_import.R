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


## -------------------------------------------------------------------------------------------------
#######################################################################
# Data Handling Course: Example Script for Data Gathering and Import
#
# Imports data from ...
# Input: links to data sources (data comes in ... format)
# Output: cleaned data as CSV
# 
# U. Matter, St.Gallen, 2019
#######################################################################



## ----eval=FALSE-----------------------------------------------------------------------------------
## #######################################################################
## # Data Handling Course: Example Script for Data Gathering and Import
## #
## # Imports data from ...
## # Input: links to data sources (data comes in ... format)
## # Output: cleaned data as CSV
## #
## # U. Matter, St.Gallen, 2019
## #######################################################################
## 
## 
## # SET UP --------------
## # load packages
## library(tidyr)
## 
## # set fix variables
## INPUT_PATH <- "/rawdata"
## OUTPUT_FILE <- "/final_data/datafile.csv"
## 


## ----eval=FALSE-----------------------------------------------------------------------------------
## #######################################################################
## # Project XY: Data Gathering and Import
## #
## # This script is the first part of the data pipeline of project XY.
## # It imports data from ...
## # Input: links to data sources (data comes in ... format)
## # Output: cleaned data as CSV
## #
## # U. Matter, St.Gallen, 2019
## #######################################################################
## 
## 
## # SET UP --------------
## # load packages
## library(tidyr)
## 
## # set fix variables
## INPUT_PATH <- "/rawdata"
## OUTPUT_FILE <- "/final_data/datafile.csv"
## 
## 
## # IMPORT RAW DATA FROM CSVs -------------
## 
## 


## ----eval=TRUE------------------------------------------------------------------------------------
data(swiss)


## ----eval=TRUE------------------------------------------------------------------------------------
# inspect the structure
str(swiss)

# look at the first few rows
head(swiss)






## ----eval=FALSE-----------------------------------------------------------------------------------
## # install the package
## install.packages("readxl")




## ----eval=FALSE, warning=FALSE--------------------------------------------------------------------
## # load the package
## library(readxl)
## 
## # import data from a spreadsheet
## swiss_imported <- read_excel("data/swiss.xlsx")




## ----eval=FALSE-----------------------------------------------------------------------------------
## # install the package (if not yet installed):
## # install.packages("haven")
## 
## # load the package
## library(haven)
## 
## # read the data
## swiss_imported <- read_spss("data/swiss.sav")
## 


## -------------------------------------------------------------------------------------------------
library(readr)

read_csv('"District","Fertility","Agriculture","Examination","Education","Catholic","Infant.Mortality"
"Courtelary",80.2,17,15,12,9.96,22.2')



## ----eval=FALSE-----------------------------------------------------------------------------------
## swiss <- read_csv("data/swiss.csv")




## -------------------------------------------------------------------------------------------------
swiss


## -------------------------------------------------------------------------------------------------
read_csv('A,B
         12:00, 12:00
         14:30, midnight
         20:01, noon')


## -------------------------------------------------------------------------------------------------
guess_parser(c("12:00", "midnight", "noon"))
guess_parser(c("12:00", "14:30", "20:01"))


## ----eval=FALSE-----------------------------------------------------------------------------------
## # load packages
## library(xml2)
## 
## # parse XML, represent XML document as R object
## xml_doc <- read_xml("data/customers.xml")
## xml_doc
## 




## -------------------------------------------------------------------------------------------------
# navigate through the XML document (recall the tree-like nested structure similar to HTML)
# navigate downwards
# 'customers' is the root-node, persons are their'children'
persons <- xml_children(xml_doc) 
# navigate sidewards
xml_siblings(persons)
# navigate upwards
xml_parents(persons)

# find data via XPath
customer_names <- xml_find_all(xml_doc, xpath = ".//name")
# extract the data as text
xml_text(customer_names)



## ----eval=FALSE-----------------------------------------------------------------------------------
## # load packages
## library(jsonlite)
## 
## # parse the JSON-document shown in the example above
## json_doc <- fromJSON("data/person.json")
## 
## # look at the structure of the document
## str(json_doc)
## 
## # navigate the nested lists, extract data
## # extract the address part
## json_doc$address
## # extract the gender (type)
## json_doc$gender$type
## 
## 




## ----echo=FALSE-----------------------------------------------------------------------------------
dgov <- data.table::fread("../../data/divided_gov.csv")
head(dgov)




## ----echo=FALSE, warning=FALSE, message=FALSE-----------------------------------------------------
# SETUP ------------------

# load packages
library(rvest)
library(tidyverse)

# fix vars
SOURCE_PATH <- "https://en.wikipedia.org/wiki/Divided_government_in_the_United_States"
OUTPUT_PATH <- "../../data/divided_gov.csv"



## -------------------------------------------------------------------------------------------------
# FETCH/FORMAT DATA -------------------

# fetch from web
doc <- read_html(SOURCE_PATH)
html_tables <- html_node(doc, xpath = "//table[@class='wikitable']")
tab <- html_table(html_tables)
tab <- tab[-nrow(tab), ] # remove last row (not containing data)


## -------------------------------------------------------------------------------------------------
# generate year-level data.frame

# prepare loop
all_years <- list() # the container
n <- length(tab$Year) # number of cases to iterate through
length(all_years) <- n
# generate year-level observations. row by row.
for (i in 1:n){
      # select row
      row <- tab[i,] 
      y <- row$Year
      # 
      begin <- as.numeric(unlist(strsplit(x = y, split = "[\\–\\-]", perl = TRUE))[1])
      end <- as.numeric(unlist(strsplit(x = y, split =  "[\\–\\-]"))[2])
      tabnew <- data.frame(year=begin:(end-1), president=row$President, senate=row$Senate, house=row$House)
      all_years[[i]] <- tabnew # store in container
}

# stack all rows together
allyears <- bind_rows(all_years)


## -------------------------------------------------------------------------------------------------
# WRITE TO DISK --------------------------------------------------

# inspect
head(allyears)

# write to csv
write_csv(allyears, path=OUTPUT_PATH)


