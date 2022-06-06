# stadium
![lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-lightgrey)![status:
development](https://img.shields.io/badge/status-development-blue)

# Overview

The stadium data set is a collection of stadium name, city and capacity of each stadium around the world. On some occasions the stadiums of clubs listed in the Federations of AFC, CAF, CONCACAF, CONMEBOL, OFC and UEFA are made available.

In the data collection, a coding problem with the name of cities, stadiums, among others was detected. Thus, it was decided not to fully treatment the data since it depends on the context of using the data set.

However, in some situations the import of the data by not detecting the encoding of the character registered the unicode of the character as an attempt to map divergence. In the background, a study on how to treatment the data may be carried out.

The data was collected from the [stadiumdb](http://stadiumdb.com/) website which is based on the website polish [stadiony](http://stadiony.net/). The data is also available on [Wikipedia](https://en.wikipedia.org/wiki/List_of_stadiums_by_capacity).

# Usage

- R
``` r
url_i <- "https://raw.githubusercontent.com/brunofariadf/database/main/csv/stadium.csv"
data_i <- data.table::fread(url_i)
head(data_i, 2)

#      country      city            name              club capacity
# 1: Australia Melbourne  Marvel Stadium Melbourne Victory    56347
# 2: Australia  Brisbane Suncorp Stadium     Brisbane Roar    53223
```

- Python
``` python
from pandas import read_csv as pandas_readCSV

url_i = "https://raw.githubusercontent.com/brunofariadf/database/main/csv/stadium.csv"
data_i = pandas_readCSV(url_i, sep = ";", encoding = "latin1")
print(data_i.head(2))

#      country       city             name               club  capacity
# 0  Australia  Melbourne   Marvel Stadium  Melbourne Victory     56347
# 1  Australia   Brisbane  Suncorp Stadium      Brisbane Roar     53223
```

# Code of Conduct

Please note that the project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

# License

[MIT](https://github.com/brunofariadf/database/blob/main/LICENSE)