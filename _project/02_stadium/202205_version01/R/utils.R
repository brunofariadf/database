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

# rscript::rscript_create("./_project/02_stadium/202205_version01/engineer", name_script = "02-data_treatment")

# extract link to access
# not export

extract_link <- function(url, reference) {
    url_i <- httr::GET(url)
    read_i <- xml2::read_html(url_i)
    filter_i <- xml2::xml_find_all(read_i, xpath = paste0("//a[contains(@href, '", reference, "')]"))
    xml2::xml_attr(filter_i, "href")
}

# extract the name of all countries
# not export

extract_name_all <- function(url, reference) {
    url_i <- httr::GET(url)
    read_i <- xml2::read_html(url_i)
    filter_i <- xml2::xml_find_all(read_i, xpath = paste0("//a[contains(@href, '", reference, "')]"))
    filter_i <- xml2::xml_contents(filter_i)
    as.character(Filter(function(x)!grepl(x, pattern = "<span>"), filter_i))
}

# extract the country name
# not export

extract_name <- function(url, reference) {
    url_i <- httr::GET(url)
    read_i <- xml2::read_html(url_i)
    read_i <- xml2::xml_find_all(read_i, xpath = reference)
    gsub("\\Stadiums in ", "\\", xml2::xml_text(read_i))
}

# extract the table
# not export

extract_table <- function(url, xpath, reference) {
    url_i <- httr::GET(url)
    read_i <- xml2::read_html(url_i)
    filter_i <- xml2::xml_find_all(read_i, xpath = xpath)
    data.frame(country = extract_name(url, reference),
        do.call(base::rbind, rvest::html_table(filter_i)))
}
