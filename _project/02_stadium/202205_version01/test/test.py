## ------------------------------------------
##                          Date: 2022-06-01
## ------------------------------------------
## Project: 
## Author: 
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

from pandas import read_csv as pandas_readCSV

url_i = "https://raw.githubusercontent.com/brunofariadf/database/main/csv/stadium.csv"
data_i = pandas_readCSV(url_i, sep = ";", encoding = "latin1")
print(data_i.head(2))
