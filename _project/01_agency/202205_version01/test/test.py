## ------------------------------------------
##                          Date: 2022-05-21
## ------------------------------------------
## Project: agency
## Author: Bruno Faria
## 
## GUI: vscode (1.67.2)
## Version Python: 3.9.6
## Platform: windows (10.0.14393)
## ------------------------------------------

from pandas import read_csv as pandas_readCSV

url_i = "https://raw.githubusercontent.com/brunofariadf/database/main/csv/agency.csv"
data_i = pandas_readCSV(url_i, sep = ";")
print(data_i.head(2))

#          date  country rating         agency               grade   outlook
# 0  2016-02-05  albania     B+  standardPoors  highly speculative    stable
# 1  2014-10-10  albania      B  standardPoors  highly speculative  positive