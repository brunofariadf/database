## ------------------------------------------
##                          Date: 2022-06-01
## ------------------------------------------
## Project: stadium
## Author: Bruno Faria
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

url_i <- "https://raw.githubusercontent.com/brunofariadf/database/main/csv/stadium.csv"
data_i <- data.table::fread(url_i)
head(data_i, 2)

#      country      city            name              club capacity
# 1: Australia Melbourne  Marvel Stadium Melbourne Victory    56347
# 2: Australia  Brisbane Suncorp Stadium     Brisbane Roar    53223