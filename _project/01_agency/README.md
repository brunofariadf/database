# agency
![lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-lightgrey)![status:
development](https://img.shields.io/badge/status-development-blue)

# Overview

The agency dataset is a credit rating used by funds and investors to assess credit quality in a country. The rating agencies available are Standard & Poor's, Moody's Fitch and DBRS.

However, moody's and DBRS's rating rating has a different nomenclature for each country, so it was considered the standard set on the [countryeconomy](https://countryeconomy.com/ratings) website. However, such standardization was only up to the C rating given that all agencies start to diverge from this rating down.

In addition, also based on the [countryeconomy](https://countryeconomy.com/ratings) website, a new column was created to map the degree of each rating rating of each agency. The data were collected from the [tradingeconomics](https://tradingeconomics.com/) website by web data scraping techniques.

# Usage

- r
``` r
url_i <- "https://raw.githubusercontent.com/brunofariadf/database/main/csv/agency.csv"
data_i <- data.table::fread(url_i)
head(data_i, 2)

#          date country rating        agency              grade  outlook
# 1: 2016-02-05 albania     B+ standardPoors highly speculative   stable
# 2: 2014-10-10 albania      B standardPoors highly speculative positive
```

- python
``` python
from pandas import read_csv as pandas_readCSV

url_i = "https://raw.githubusercontent.com/brunofariadf/database/main/csv/agency.csv"
data_i = pandas_readCSV(url_i, sep = ";")
print(data_i.head(2))

#          date  country rating         agency               grade   outlook
# 0  2016-02-05  albania     B+  standardPoors  highly speculative    stable
# 1  2014-10-10  albania      B  standardPoors  highly speculative  positive
```

# Code of Conduct

Please note that the project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

# License

[MIT](https://github.com/brunofariadf/database/blob/main/LICENSE)