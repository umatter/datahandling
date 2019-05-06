##################################################
# Shell script to make/update all documents
# of the course:
# Data Handling: Import, Cleaning and Visualisation
# first version:
# U.Matter, June 2018
# Prerequisites:
# needs latexmk (is shipped with new latex distr)
# brew install bib-tool
# brew install latex2rtf
# LibreOffice installiert
##################################################



# MATERIALS
# manual changes should only be made in materials
# this compiles all materials in the requested formats (see wm_utils.R for details) and copies the updated files to the respective folders (website etc.)

# a) render notes (pdf and html)
Rscript code/render_notes.R
Rscript code/render_slides.R


# b) copy rendered notes and slides to website
# notes
cp -a materials/notes/html/. ~/Dropbox/matterials/backend/courses/datahandling/notes/html/
cp -a materials/notes/pdf/. ~/Dropbox/matterials/backend/courses/datahandling/notes/pdf/

# c) clean intermediate results (from interactive session)
rm materials/notes/*.html
rm materials/notes/*.pdf
rm materials/slides/*.html

# slides
cp -a materials/slides/html/. ~/Dropbox/matterials/backend/courses/datahandling/slides/html/

# Syllabus
cp syllabus.pdf ~/Dropbox/matterials/backend/courses/datahandling/syllabus.pdf

# UPDATE WEBSITE
# sh ~/Dropbox/matterials/makeall.sh
