# XML and JSON


# load packages
library(xml2)

# parse XML, represent XML document as R object
xml_doc <- read_xml("persons.xml")
xml_doc


# load packages
library(jsonlite)

# parse the JSON-document shown in the example above
json_doc <- fromJSON("persons.json")

# check the structure
str(json_doc)




# HTML ------------

# naive approach
swiss_econ <- readLines("https://en.wikipedia.org/wiki/Economy_of_Switzerland")
# inspect
head(swiss_econ)
# extract part
line_number <- grep('US Dollar Exchange', swiss_econ)
line_number
swiss_econ[line_number]


# parsing
# load the package
library(rvest)
# parse the webpage, show the content
swiss_econ_parsed <- read_html("https://en.wikipedia.org/wiki/Economy_of_Switzerland")
swiss_econ_parsed



tab_node <- html_node(swiss_econ_parsed,
                      xpath = "//*[@id='mw-content-text']/div/table[2]")
tab <- html_table(tab_node)
tab