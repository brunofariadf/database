# database
![lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-lightgrey)![status:
development](https://img.shields.io/badge/status-development-blue)

# Overview

This is a repository of dataset collected via web scraping. Below you can check the datasets collected and the format that is available.

| id | dataset | year |                 csv                 | sql |
|:--:|:-------:|:----:|:-----------------------------------:|:---:|
| 01 | agency  | 2022 | <span style="color:orange">x</span> |     |

The data are in the public domain and can be used without any restrictions.

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

MIT
