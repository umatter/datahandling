## ----echo= FALSE, out.width= "65%", fig.align="center", fig.cap="Source: http://bloggotype.blogspot.ch/2016/08/holiday-notes2-grammar-of-graphics.html"----
include_graphics("../img/gog.png")

## ----echo= FALSE, out.width= "25%", fig.align="center"-------------------
include_graphics("../img/ggplot2.png")

## ----echo=TRUE, eval=FALSE-----------------------------------------------
## ggplot(data = my_dataframe, aes(x= xvar, y= yvar))

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
     theme_minimal()


## ----echo=TRUE, out.width="85%"------------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_dark()


