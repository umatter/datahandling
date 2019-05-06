## ----message=FALSE-------------------------------------------------------
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


## ------------------------------------------------------------------------
swiss_summary_rounded <- round(swiss_summary, 2)
swiss_summary_rounded

## ------------------------------------------------------------------------

swiss_summary_formatted <- format(swiss_summary_rounded, decimal.mark=",")
swiss_summary_formatted 

## ----echo=TRUE-----------------------------------------------------------
# load the R package
library(ggplot2)
# load the data
data(swiss)
# get details about the data set
# ?swiss
# inspect the data
head(swiss)

## ------------------------------------------------------------------------
# code province as 'Catholic' if more than 50% are catholic
swiss$Religion <- 'Protestant'
swiss$Religion[50 < swiss$Catholic] <- 'Catholic'
swiss$Religion <- as.factor(swiss$Religion)


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination))


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point()


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     facet_wrap(~Religion)


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     geom_smooth(method = 'loess') +
     facet_wrap(~Religion)


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion)


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion)


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     coord_flip()


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme(legend.position = "bottom", axis.text=element_text(size=12) ) 


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_minimal()


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_dark()


