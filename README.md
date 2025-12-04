# Data Handling Pocket Reference

A bookdown project for the SEPS-HSG (University of St. Gallen) course "Data Handling: Import, Cleaning and Visualisation" (BA, Major in Economics).

**Author:** Ulrich Matter
**Online Book:** https://umatter.github.io/datahandling/

## About

This book covers practical data handling with R for economics and social sciences, including:
- Programming with data in R
- Data storage and structures (CSV, JSON, XML, databases)
- High-dimensional, text, and image data
- Data import, cleaning, and preparation
- Basic analytics and econometrics
- Data visualization

## Building the Book

Requires R with `bookdown`, `knitr`, and `rmarkdown` packages.

```r
# Build all formats (HTML, PDF, EPUB)
bookdown::render_book("index.Rmd")

# Build only GitBook (HTML)
bookdown::render_book("index.Rmd", "bookdown::gitbook")

# Preview a single chapter
bookdown::preview_chapter("09_data_preparation.Rmd")
```

Output is generated in the `docs/` directory.

## License

The online version is licensed under [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/). 