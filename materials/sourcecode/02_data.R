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












## ------------------------------------------------------------------------
clockHTML <- readLines("https://www.census.gov/popclock/")


## ------------------------------------------------------------------------
head(clockHTML)


## ------------------------------------------------------------------------
line_number <- grep('id="world-pop-container"', clockHTML)


## ------------------------------------------------------------------------
line_number




## ----eval=FALSE----------------------------------------------------------
## writeLines(clockHTML, "clock.html")

