


## -------------------------------------------------------------------------------------------------
library(readr)

# from string
read_csv('"District","Fertility","Agriculture","Examination","Education","Catholic","Infant.Mortality"
"Courtelary",80.2,17,15,12,9.96,22.2')


# from file
swiss <- read_csv("data/swiss.csv")


# Parsing/guessing of data type

## -------------------------------------------------------------------------------------------------
read_csv('A,B
         12:00, 12:00
         14:30, midnight
         20:01, noon')


## -------------------------------------------------------------------------------------------------
guess_parser(c("12:00", "midnight", "noon"))
guess_parser(c("12:00", "14:30", "20:01"))






# TUTORIAL -------------



# SETUP ------------------

# load packages
library(rvest)
library(tidyverse)

# fix vars
SOURCE_PATH <- "https://en.wikipedia.org/wiki/Divided_government_in_the_United_States"
OUTPUT_PATH <- "../../data/divided_gov.csv"







# FETCH/FORMAT DATA -------------------

# fetch from web
doc <- read_html(SOURCE_PATH)
html_tables <- html_node(doc, xpath = "//table[@class='wikitable']")
tab <- html_table(html_tables)
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
write_csv(allyears, path=OUTPUT_PATH)


