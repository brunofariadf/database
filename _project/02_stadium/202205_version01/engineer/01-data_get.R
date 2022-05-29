## ------------------------------------------
##                          Date: 2022-05-29
## ------------------------------------------
## Project: 
## Author: 
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

# "http://stadiumdb.com/stadiums" |> 
#     httr::GET() |> 
#     xml2::read_html() |> 
#     xml2::xml_find_all(xpath = paste0("//a[contains(@href, '", "stadiums/", "')]")) |> 
#     xml2::xml_attr("href")

# "http://stadiumdb.com/stadiums" |> 
#     httr::GET() |> 
#     xml2::read_html() |> 
#     xml2::xml_find_all(xpath = paste0("//a[contains(@href, '", "stadiums/", "')]")) |> 
#     xml2::xml_contents() |> 
#     {function(i)Filter(function(x)!grepl(x, pattern = "<span>"), i)}()

## --------------------------------------------------------------------------------
## import function - date: 2022-05-29 11:45:13
## --------------------------------------------------------------------------------

# get path from function and import
path_r <- list.files("./_project/02_stadium/202205_version01/R", full.names = TRUE)
path_r <- suppressWarnings(normalizePath(path_r))
invisible(lapply(path_r, base::source))

## --------------------------------------------------------------------------------
## construct path - date: 2022-05-29 11:49:25
## --------------------------------------------------------------------------------

# set variable
url_i <- "http://stadiumdb.com/stadiums"
xpath_i <- "//table"
reference_name <- "/html/body/div[2]/main/article/h1"
reference_link <- "stadiums/"

# extract the link
link_i <- extract_link(url_i, reference = reference_link)

# check the error in url
check_i <- lapply(link_i, httr::http_error)
all(unlist(check_i))

## --------------------------------------------------------------------------------
## get data - date: 2022-05-29 11:55:25
## --------------------------------------------------------------------------------

# get dataset
list_i <- lapply(link_i, function(x)
    extract_table(x, xpath = xpath_i, reference = reference_name))

## --------------------------------------------------------------------------------
## create dataset - date: 2022-05-29 12:16:18
## --------------------------------------------------------------------------------

df_i <- do.call(base::rbind, list_i);dim(df_i)

## --------------------------------------------------------------------------------
## export - date: 2022-05-29 12:17:25
## --------------------------------------------------------------------------------

# export
write.csv2(df_i, row.names = FALSE,
    file = "./_project/02_stadium/202205_version01/data-raw/stadiumRaw.csv")

# remove
rm(check_i, df_i, extract_link, extract_name, 
    extract_name_all, extract_table, link_i, list_i, 
    path_r, reference_link, reference_name, url_i, xpath_i)
