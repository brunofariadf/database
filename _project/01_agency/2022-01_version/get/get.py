from pandas import read_csv as pandas_readCSV

url_i = "https://raw.githubusercontent.com/brunofariadf/database/main/csv/agency.csv"
data_i = pandas_readCSV(url_i, sep = ";")
print(data_i.head(2))