##############################################################
# Figure illustrating the decrease in hardware storage costs
#
# Data source: http://www.mkomo.com/cost-per-gigabyte
# mkomo.com
##############################################################

# SET UP ------------

# load packages
library(rvest)
library(ggplot2)
library(data.table)

# fix vars
INPUT_URL <- "http://www.mkomo.com/cost-per-gigabyte"
OUTPUT_PATH <- "materials/img/hardware_costs.png"


# FETCH/PREPARE DATA ----------------

# fetch data from website
page <- read_html(INPUT_URL)
html_tab <- html_node(page, xpath = "/html/body/div[2]/div/div/div/table")
df_tab <- html_table(html_tab)

# clean/prepare data
names(df_tab) <- c("date", "drive_info", "size_mb", "cost", "cost_gb")
df_tab$year <- substr(df_tab$date, 1L, 4L)
df_tab$size_mb <- as.numeric(gsub(",", "", df_tab$size_mb))
df_tab$cost <- gsub("$", "", df_tab$cost, fixed = TRUE)
df_tab$cost <- as.numeric(gsub(",", "", df_tab$cost, fixed = TRUE))
df_tab$cost_gb <- gsub("$", "", df_tab$cost_gb, fixed = TRUE)
df_tab$cost_gb <- as.numeric(gsub(",", "", df_tab$cost_gb, fixed = TRUE))
df_tab <- as.data.table(df_tab)
df_tab[,avgcost_year:= mean(cost), by=year]
df_tab[,avgcost_gb_year:= mean(cost_gb), by=year]
df_tab[,avgsize_mb_year:= mean(size_mb), by=year]
df_tab2 <- df_tab[,c("year", "avgsize_mb_year", "avgcost_gb_year"), with=FALSE]

