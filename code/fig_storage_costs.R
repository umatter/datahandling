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
OUTPUT_PATH <- "../data/storage_costs.csv"


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
df_tab2 <- df_tab[year > 1980,c("year", "avgsize_mb_year", "avgcost_gb_year"), with=FALSE]


# STORE DATA ----------------
#fwrite(df_tab2, OUTPUT_PATH)


# PLOT ----------------------

storage_cost_plot_dark <- 
     ggplot(df_tab2, aes(x=year, y=avgcost_gb_year)) +
     geom_point(color="#03e273", size = 3) +
     scale_x_discrete(breaks=seq(1980, 2010, 5)) +
     ylab("Avg. storage cost ($ per GB)") +
     xlab("Year") +
     theme_dark(base_size = 18) + theme(
          # get rid of panel grids
          panel.grid.major = element_line(colour = "lightgray"),
          panel.grid.minor = element_line(colour = "lightgray"),
          # Change plot and panel background
          plot.background=element_rect(fill = "black"),
          panel.background = element_rect(fill = 'black'),
          # Change legend 
         # legend.position = c(0.6, 0.07),
          #legend.direction = "horizontal",
          legend.background = element_rect(fill = "black", color = NA),
          legend.key = element_rect(color = "gray", fill = "black"),
          legend.title = element_text(color = "white"),
          legend.text = element_text(color = "white"),
         axis.title = element_text(color = "white"),
         axis.text = element_text(color = "white"))
     
     
storage_cost_plot_dark_ln <- 
     ggplot(df_tab2, aes(x=year, y=log(avgcost_gb_year))) +
     geom_point(color="#03e273", size = 3) +
     scale_x_discrete(breaks=seq(1980, 2010, 5)) +
     ylab("Ln Avg. storage cost ($ per GB)") +
     xlab("Year") +
     theme_dark(base_size = 18) + theme(
          # get rid of panel grids
          panel.grid.major = element_line(colour = "lightgray"),
          panel.grid.minor = element_line(colour = "lightgray"),
          # Change plot and panel background
          plot.background=element_rect(fill = "black"),
          panel.background = element_rect(fill = 'black'),
          # Change legend 
          # legend.position = c(0.6, 0.07),
          #legend.direction = "horizontal",
          legend.background = element_rect(fill = "black", color = NA),
          legend.key = element_rect(color = "gray", fill = "black"),
          legend.title = element_text(color = "white"),
          legend.text = element_text(color = "white"),
          axis.title = element_text(color = "white"),
          axis.text = element_text(color = "white"))
