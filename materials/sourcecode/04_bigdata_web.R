## <?xml version="1.0"?>

##   <temperatures>

##     <variable>Monthly Surface Clear-sky Temperature (ISCCP) (Celsius)</variable>

##     <case date="16-JAN-1994" temperature="9.200012" />

##   <cases>

## <person>

## {"firstName": "John",

## ----eval=FALSE, purl=TRUE-----------------------------------------------
## # load packages
## library(jsonlite)
## 
## # parse the JSON-document shown in the example above
## json_doc <- fromJSON("persons.json")
## 
## # check the structure
## str(json_doc)
## 

##      <!DOCTYPE html>

## ----echo=FALSE, fig.align="center", out.width="50%", fig.cap="(ref:caphtml)"----
include_graphics("../img/dom_tree.png")

## ----swiss, echo=FALSE, out.width = "50%", fig.align='center', fig.cap= "(ref:capswiss)"----
include_graphics("../img/1_SwissGDP.png")

## ------------------------------------------------------------------------
swiss_econ <- readLines("https://en.wikipedia.org/wiki/Economy_of_Switzerland")

## ------------------------------------------------------------------------
head(swiss_econ)

## ------------------------------------------------------------------------
line_number <- grep('US Dollar Exchange', swiss_econ)

## ------------------------------------------------------------------------
line_number

## ------------------------------------------------------------------------
swiss_econ[line_number]

## ----echo=FALSE----------------------------------------------------------
# install package if not yet installed
# install.packages("rvest")

# load the package
library(rvest)

## ------------------------------------------------------------------------
# parse the webpage, show the content
swiss_econ_parsed <- read_html("https://en.wikipedia.org/wiki/Economy_of_Switzerland")
swiss_econ_parsed

## ------------------------------------------------------------------------
tab_node <- html_node(swiss_econ_parsed, xpath = "//*[@id='mw-content-text']/div/table[2]")
tab <- html_table(tab_node)
tab

