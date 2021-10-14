## XML -------------------------

# load packages
library(xml2)

# parse XML, represent XML document as R object
xml_doc <- read_xml("data/persons.xml")
xml_doc


## JSON -------------------------

# load packages
library(jsonlite)

# parse the JSON-document shown in the example above
json_doc <- fromJSON("data/persons.json")

# check the structure
str(json_doc)

## HTML Example

## -------------------------------------------------------------------------------------------------
swiss_econ <- readLines("https://en.wikipedia.org/wiki/Economy_of_Switzerland")


## -------------------------------------------------------------------------------------------------
head(swiss_econ)

## -------------------------------------------------------------------------------------------------
line_number <- grep('US Dollar Exchange', swiss_econ)
line_number
swiss_econ[line_number]


## -------------------------------------
# install package if not yet installed
# install.packages("rvest")

# load the package
library(rvest)




## -------------------------------------------------------------------------------------------------
# parse the webpage, show the content
swiss_econ_parsed <- read_html("https://en.wikipedia.org/wiki/Economy_of_Switzerland")
swiss_econ_parsed


## -------------------------------------------------------------------------------------------------
tab_node <- html_node(swiss_econ_parsed, xpath = "//*[@id='mw-content-text']/div/table[2]")
tab <- html_table(tab_node)
tab

