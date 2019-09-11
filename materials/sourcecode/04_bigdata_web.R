## ---- echo=FALSE, results='asis', warning=FALSE--------------------------
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


## <?xml version="1.0"?>

##   <temperatures>

##     <variable>Monthly Surface Clear-sky Temperature (ISCCP) (Celsius)</variable>

##     <filename>ISCCPMonthly_avg.nc</filename>

##     <filepath>/usr/local/fer_data/data/</filepath>

##     <badflag>-1.E+34</badflag>

##     <subset>48 points (TIME)</subset>

##     <longitude>123.8W(-123.8)</longitude>

##     <latitude>48.8S</latitude>

##     <case date="16-JAN-1994" temperature="9.200012" />

##     <case date="16-FEB-1994" temperature="10.70001" />

##     <case date="16-MAR-1994" temperature="7.5" />

##     <case date="16-APR-1994" temperature="8.100006" />

## 
## ...

##   </temperatures>


##   <temperatures>

## ...

##   </temperatures>


##     <variable>Monthly Surface Clear-sky Temperature (ISCCP) (Celsius)</variable>

##     <filename>ISCCPMonthly_avg.nc</filename>

##     <filepath>/usr/local/fer_data/data/</filepath>

##     <badflag>-1.E+34</badflag>

##     <subset>48 points (TIME)</subset>

##     <longitude>123.8W(-123.8)</longitude>

##     <latitude>48.8S</latitude>

##     <case date="16-JAN-1994" temperature="9.200012" />

##     <case date="16-FEB-1994" temperature="10.70001" />

##     <case date="16-MAR-1994" temperature="7.5" />

##     <case date="16-APR-1994" temperature="8.100006" />


##     <case date="16-JAN-1994" temperature="9.200012" />

##     <case date="16-FEB-1994" temperature="10.70001" />

##     <case date="16-MAR-1994" temperature="7.5" />

##     <case date="16-APR-1994" temperature="8.100006" />


##   <cases>

##     <case>

##       <date>16-JAN-1994<date/>

##       <temperature>9.200012<temperature/>

##     <case/>

##     <case>

##       <date>16-FEB-1994<date/>

##       <temperature>10.70001<temperature/>

##     <case/>

##     <case>

##       <date>16-MAR-1994<date/>

##       <temperature>7.5<temperature/>

##     <case/>

##     <case>

##       <date>16-APR-1994<date/>

##       <temperature>8.100006<temperature/>

##     <case/>

##   <cases/>


## <person>

##   <firstName>John</firstName>

##   <lastName>Smith</lastName>

##   <age>25</age>

##   <address>

##     <streetAddress>21 2nd Street</streetAddress>

##     <city>New York</city>

##     <state>NY</state>

##     <postalCode>10021</postalCode>

##   </address>

##   <phoneNumber>

##     <type>home</type>

##     <number>212 555-1234</number>

##   </phoneNumber>

##   <phoneNumber>

##     <type>fax</type>

##     <number>646 555-4567</number>

##   </phoneNumber>

##   <gender>

##     <type>male</type>

##   </gender>

## </person>

## 

## {"firstName": "John",

##   "lastName": "Smith",

##   "age": 25,

##   "address": {

##     "streetAddress": "21 2nd Street",

##     "city": "New York",

##     "state": "NY",

##     "postalCode": "10021"

##   },

##   "phoneNumber": [

##     {

##       "type": "home",

##       "number": "212 555-1234"

##     },

##     {

##       "type": "fax",

##       "number": "646 555-4567"

##     }

##   ],

##   "gender": {

##     "type": "male"

##   }

## }

## 





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

## 
##      <html>

##          <head>

##              <title>hello, world</title>

##          </head>

##          <body>

##              <h2> hello, world </h2>

##          </body>

##      </html>


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

