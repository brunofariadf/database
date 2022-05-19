## ------------------------------------------
##                          Date: 2022-05-15
## ------------------------------------------
## Project: agency
## Author: Bruno Faria
## 
## GUI: vscode (1.67.1)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

## --------------------------------------------------------------------------------
## import function - date: 2022-05-19 10:38:37
## --------------------------------------------------------------------------------

# get path from function and import
path_r <- list.files("./_project/01_agency/2022-01_version/R", full.names = TRUE)
path_r <- suppressWarnings(normalizePath(path_r))
invisible(lapply(path_r, base::source))

## --------------------------------------------------------------------------------
## get reference - date: 2022-05-19 10:41:58
## --------------------------------------------------------------------------------

# get the name from country
reference_i <- extract_table(url = "https://tradingeconomics.com/country-list/rating", 
    xpath = '//*[@id="ctl00_ContentPlaceHolder1_ctl01_GridView1"]')[[1]][,1]

# treatment in names
reference_i <- trimws(tolower(reference_i[[1]]))
reference_i <- abjutils::rm_accent(reference_i)
reference_i <- gsub("\\ ", "\\-", reference_i)

## --------------------------------------------------------------------------------
## construct path - date: 2022-05-19 11:50:59
## --------------------------------------------------------------------------------

# construct path
url_i <- "https://tradingeconomics.com"
url_i <- paste0(url_i, "/", reference_i, "/rating")

# check the error in url
check_i <- lapply(url_i, httr::http_error)
all(unlist(check_i))

## --------------------------------------------------------------------------------
## get data - date: 2022-05-19 12:01:39
## --------------------------------------------------------------------------------

# get dataset
list_i <- lapply(url_i, function(x)extract_table(x, 
    xpath = '//*[@id="ctl00_ContentPlaceHolder1_ctl01_GridView1"]'))

# check error
error_i <- unlist(lapply(list_i, anyNA))
position_i <- which(error_i)
# montserrat is error
lapply(url_i[position_i], function(x)extract_table(x, 
    xpath = '//*[@id="ctl00_ContentPlaceHolder1_ctl01_GridView1"]'))

## --------------------------------------------------------------------------------
## create dataset - date: 2022-05-19 12:28:30
## --------------------------------------------------------------------------------

df_i <- do.call(base::rbind, list_i[-position_i])
dim(df_i)

## --------------------------------------------------------------------------------
## export - date: 2022-05-19 12:31:45
## --------------------------------------------------------------------------------

# export
write.csv2(df_i, row.names = FALSE,
    file = "./_project/01_agency/2022-01_version/data-raw/agencyRaw.csv")

# remove
rm(check_i, df_i, error_i, extract_link, 
    extract_table, list_i, path_i, path_r, 
    position_i, reference_i, url_i)
