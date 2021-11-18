

## The readr package (tidyverse: https://www.tidyverse.org/)
library(readr)

# csv-"string" as input
read_csv('"District","Fertility","Agriculture","Examination","Education","Catholic","Infant.Mortality"
"Courtelary",80.2,17,15,12,9.96,22.2')

## csv file as input
swiss <- read_csv("data/swiss.csv") # Hint: see also ?read_csv under 'locale' for information about encoding

swiss


## readr csv parser features
read_csv('A,B
         12:00, 12:00
         14:30, midnight
         20:01, noon')


## illustration of lower-level parser components (heuristics to guess data types)
guess_parser(c("12:00", "midnight", "noon"))
guess_parser(c("12:00", "14:30", "20:01"))


# Working with XML in R -------------------------------------------------------------------------------------------------
# load packages
library(xml2)

# parse XML, represent XML document as R object
xml_doc <- read_xml("data/customers.xml")
xml_doc

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



# Working with JSON in R -----------------------------------------------------------------------------------
# load packages
library(jsonlite)

# parse the JSON-document shown in the example above
json_doc <- fromJSON("data/person.json")

# look at the structure of the document
str(json_doc)

# navigate the nested lists, extract data
# extract the address part
json_doc$address
# extract the gender (type)
json_doc$gender$type






## Tutorial ----------------------------------------------------------
# data source : https://en.wikipedia.org/wiki/Divided_government_in_the_United_States

# example
dgov <- read_csv("data/divided_gov.csv")
head(dgov)


# SETUP ------------------

# load packages
library(rvest)
library(tidyverse)

# fix vars
SOURCE_PATH <- "https://en.wikipedia.org/wiki/Divided_government_in_the_United_States"
OUTPUT_PATH <- "data/divided_gov.csv"


# FETCH/FORMAT DATA -------------------

# fetch from web
doc <- read_html(SOURCE_PATH)
tab <- html_table(doc,fill=TRUE)[[2]]
tab <- tab[-nrow(tab), ] # remove last row (not containing data)


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


# WRITE TO DISK --------------------------------------------------

# inspect
head(allyears)

# write to csv
write_csv(allyears, file=OUTPUT_PATH)


