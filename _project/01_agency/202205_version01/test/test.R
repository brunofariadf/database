## ------------------------------------------
##                          Date: 2022-06-04
## ------------------------------------------
## Project: 
## Author: 
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

url_i <- "https://raw.githubusercontent.com/brunofariadf/database/main/csv/agency.csv"
data_i <- data.table::fread(url_i)
head(data_i, 2)

#          date country rating        agency              grade  outlook
# 1: 2016-02-05 albania     B+ standardPoors highly speculative   stable
# 2: 2014-10-10 albania      B standardPoors highly speculative positive