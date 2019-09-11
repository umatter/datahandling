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


## ----message=FALSE, warning=FALSE----------------------------------------
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



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination))



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     geom_smooth(method = 'loess') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     coord_flip()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme(legend.position = "bottom", axis.text=element_text(size=12) ) 



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_minimal()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8--------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_dark()


