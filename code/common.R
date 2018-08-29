library(grid)
library(gridExtra)
cellSize <- unit(1, "lines")
marginSize <- unit(2, "mm")
charSize <- stringWidth(" ")

cmlgctt <- Type1Font("cmlgctt",
                     file.path("..",
                               "cm-lgc", "fonts", "afm", "public", "cm-lgc", 
                               c("fctr8a.afm",
                                 "fctr8a.afm", # no bold 
                                 "fctri8a.afm",
                                 "fctri8a.afm")))  # no bold-italic
pdfFonts(cmlgctt=cmlgctt)
cmlgcs <- Type1Font("cmlgcs",
                    file.path("..",
                              "cm-lgc", "fonts", "afm", "public", "cm-lgc", 
                              c("fcsr8a.afm",
                                "fcsb8a.afm", 
                                "fcsro8a.afm",
                                "fcsbo8a.afm")))
pdfFonts(cmlgcs=cmlgcs)
pdf.options(family="cmlgctt")

# Calc physical sizes
pdf("temp.pdf")
cell <- convertWidth(cellSize, "inches", valueOnly=TRUE)
margin <- convertWidth(marginSize, "inches", valueOnly=TRUE)
char <- convertWidth(stringWidth(" "), "inches", valueOnly=TRUE)
dev.off()
