## ----message=FALSE, warning=FALSE-----------------------------------------------------------------
# load packages and data
library(tidyverse)
data("swiss")
# compute summary statistics
swiss_summary <-
  summarise(swiss, 
          avg_education = mean(Education, na.rm = TRUE),
          avg_fertility = mean(Fertility, na.rm = TRUE),
          N = n()
          )
swiss_summary



## -------------------------------------------------------------------------------------------------
swiss_summary_rounded <- round(swiss_summary, 2)
swiss_summary_rounded


## -------------------------------------------------------------------------------------------------

swiss_summary_formatted <- format(swiss_summary_rounded, decimal.mark=",")
swiss_summary_formatted 


## -------------------------------------------------------------------------------------------------
string <- "AbCD "
toupper(string)
tolower(string)
trimws(tolower(string))




## ----echo=TRUE------------------------------------------------------------------------------------
# load the R package
library(ggplot2)
# load the data
data(swiss)
# get details about the data set
# ?swiss
# inspect the data
head(swiss)


## -------------------------------------------------------------------------------------------------
# code province as 'Catholic' if more than 50% are catholic
swiss$Religion <- 'Protestant'
swiss$Religion[50 < swiss$Catholic] <- 'Catholic'
swiss$Religion <- as.factor(swiss$Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination))



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     geom_smooth(method = 'loess') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     coord_flip()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme(legend.position = "bottom", axis.text=element_text(size=12) ) 



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_minimal()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_dark()





## -------------------------------------------------------------------------------------------------
# SET UP ----------------

# load packages
library(tidyverse)
library(ggplot2)

# fix vars 
DATA_URL <- "https://ga-covid19.ondemand.sas.com/docs/ga_covid_data.zip"
COUNTIES <- c("Cobb", "DeKalb", "Fulton", "Gwinnett", "Hall")
MIN_DATE <- as.Date("2020-04-26")
MAX_DATE <- as.Date("2020-05-09")


# FETCH/IMPORT DATA -----------------------

# create a temporary file to store the downloaded zipfile
tmp <- tempfile()
download.file(DATA_URL, destfile = tmp)
# unzip the file we need
path <- unzip(tmp, files = "epicurve_rpt_date.csv" )
# read the data
cases <- read_csv(path)
# inspect the data
head(cases)



## -------------------------------------------------------------------------------------------------
# only observations in the five major counties and during the relevant days
cases <- filter(cases, county %in% COUNTIES, MIN_DATE <= report_date, report_date <= MAX_DATE)
# only the relevant variables
cases <- select(cases, county, report_date, cases)
# order according to date
cases <- cases[order(cases$report_date),]
# we add an additional column in which we treat dates as categories
cases <- mutate(cases, date=factor(report_date))


## ----out.width="85%", fig.width=6,fig.height=2.8--------------------------------------------------
ggplot(cases, aes(y=cases, x=date, fill=county)) +
  geom_bar(position = position_dodge2(), stat = "identity") + 
  scale_x_discrete(guide = guide_axis(n.dodge = 2)) # this avoids overlapping of x-axis labels (and is similar to what is done in the original plot)
  


## ---- out.width="85%", fig.width=6,fig.height=2.8-------------------------------------------------
cases2 <- mutate(cases, date= fct_reorder(date, cases, sum,.desc = TRUE)) # re-order the dates based on the total number of cases per date.

ggplot(cases2, aes(y=cases, x=date, fill=county)) +
  geom_bar(position = position_dodge2(), stat = "identity") + 
  scale_x_discrete(guide = guide_axis(n.dodge = 2))  # this avoids overlapping of x-axis labels (and is similar to what is done in the original plot)
  


## ---- out.width="85%", fig.width=6,fig.height=2.8-------------------------------------------------

ggplot(cases2, aes(y=cases, x=date, fill=county, group=cases)) +
  geom_bar(aes(group=cases), position = position_dodge2(reverse=TRUE), stat = "identity") +
    scale_x_discrete(guide = guide_axis(n.dodge = 2))  # this avoids overlapping of x-axis labels (and is similar to what is done in the original plot)

  


## ---- out.width="85%", fig.width=8,fig.height=4---------------------------------------------------
ggplot(cases2, aes(y=cases, x=date, fill=county, group=cases)) +
  geom_bar(aes(group=cases), position = position_dodge2(reverse=TRUE), stat = "identity") +
  ggtitle("Top5 Counties with the Greatest Number of Confirmed COVID-19 Cases") +
  scale_x_discrete(guide = guide_axis(n.dodge = 2)) +  # this avoids overlapping of x-axis labels (and is similar to what is done in the original plot)
  guides(fill=guide_legend(title = "County",
                           title.position = "top",
                           direction = "horizontal",
                           title.hjust = 0.5)) +
  theme(legend.position = "top",
        plot.title = element_text(colour = "white", hjust = -0.1),
        legend.key.size = unit(0.5,"line"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),        
        panel.background = element_rect(fill="#132a52"),
        legend.background = element_rect(fill="#132a52"),
        plot.background = element_rect(fill="#132a52"),
        legend.text = element_text(colour = "#536b8d"), 
        legend.title = element_text(colour = "white"),
        axis.text = element_text(colour = "#536b8d"),
        axis.ticks = element_line(colour = "#71869e"),
        axis.line = element_line(colour="#71869e"),
        axis.title = element_blank())

