url_i <- "https://raw.githubusercontent.com/brunofariadf/database/main/csv/agency.csv"
data_i <- data.table::fread(url_i)
head(data_i, 2)