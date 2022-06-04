## ------------------------------------------
##                          Date: 2022-06-01
## ------------------------------------------
## Project: stadium
## Author: Bruno Faria
## 
## GUI: vscode (1.67.2)
## Version Python: 3.9.6
## Platform: windows (10.0.14393)
## ------------------------------------------

from pandas import read_csv as pandas_readCSV

url_i = "https://raw.githubusercontent.com/brunofariadf/database/main/csv/stadium.csv"
data_i = pandas_readCSV(url_i, sep = ";", encoding = "latin1")
print(data_i.head(2))

#      country       city             name               club  capacity
# 0  Australia  Melbourne   Marvel Stadium  Melbourne Victory     56347
# 1  Australia   Brisbane  Suncorp Stadium      Brisbane Roar     53223