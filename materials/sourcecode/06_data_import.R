## ------------------------------------------------------------------------
#######################################################################
# Data Handling Course: Example Script for Data Gathering and Import
#
# Imports data from ...
# Input: links to data sources (data comes in ... format)
# Output: cleaned data as CSV
# 
# U. Matter, St.Gallen, 2019
#######################################################################



## ----eval=FALSE----------------------------------------------------------
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


## ----eval=FALSE----------------------------------------------------------
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


## ----eval=TRUE-----------------------------------------------------------
data(swiss)


## ----eval=TRUE-----------------------------------------------------------
# inspect the structure
str(swiss)

# look at the first few rows
head(swiss)






## ----eval=FALSE----------------------------------------------------------
## # install the package
## install.packages("readxl")




## ----eval=FALSE----------------------------------------------------------
## # load the package
## library(readxl)
## 
## # import data from a spreadsheet
## swiss_imported <- read_excel("data/swiss.xlsx")




## ----eval=FALSE----------------------------------------------------------
## # install the package (if not yet installed):
## # install.packages("haven")
## 
## # load the package
## library(haven)
## 
## # read the data
## swiss_imported <- read_spss("data/swiss.sav")
## 


## ------------------------------------------------------------------------
library(readr)

read_csv('"District","Fertility","Agriculture","Examination","Education","Catholic","Infant.Mortality"
"Courtelary",80.2,17,15,12,9.96,22.2')



## ----eval=FALSE----------------------------------------------------------
## swiss <- read_csv("data/swiss.csv")




## ------------------------------------------------------------------------
swiss


## ------------------------------------------------------------------------
read_csv('A,B
         12:00, 12:00
         14:30, midnight
         20:01, noon')


## ------------------------------------------------------------------------
guess_parser(c("12:00", "midnight", "noon"))
guess_parser(c("12:00", "14:30", "20:01"))


## ------------------------------------------------------------------------
# load packages
library(xml2)

# parse XML, represent XML document as R object
xml_doc <- read_xml("../../data/customers.xml")
xml_doc



## ------------------------------------------------------------------------
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



## ------------------------------------------------------------------------
# load packages
library(jsonlite)

# parse the JSON-document shown in the example above
json_doc <- fromJSON("../../data/person.json")

# look at the structure of the document
str(json_doc)

# navigate the nested lists, extract data
# extract the address part
json_doc$address
# extract the gender (type)
json_doc$gender$type



