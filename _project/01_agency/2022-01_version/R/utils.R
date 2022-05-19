## ------------------------------------------
##                          Date: 2022-05-19
## ------------------------------------------
## Project: 
## Author: 
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

# get tbl
# experimental

extract_table <- function(url, xpath) {
    url_i <- httr::GET(url)
    read_i <- xml2::read_html(url_i)
    filter_i <- xml2::xml_find_all(read_i, xpath = xpath)
    name_i <- basename(dirname(url))
    data.frame(country = name_i, 
       tryCatch(rvest::html_table(filter_i)[[1]],
        error = function(i)data.frame(error = NA)))
}

# get link
# experimental

extract_link <- function(url, xpath) {
    url_i <- httr::GET(url)
    read_i <- xml2::read_html(url_i)
    filter_i <- xml2::xml_find_all(read_i, xpath = xpath)
    rvest::html_table(filter_i)
}

# format date
# experimental

parse_date <- function(x) {
    .format_month <- function(x) {
        switch(x,
            "Jan" = "01",
            "Feb" = "02",
            "Mar" = "03",
            "Apr" = "04",
            "May" = "05",
            "Jun" = "06",
            "Jul" = "07",
            "Aug" = "08",
            "Sep" = "09",
            "Oct" = "10",
            "Nov" = "11",
            "Dec" = "12",
            NA_character_
        )
    }

    .format_date <- function(x) {
        if (is.na(x)) {
            NA
        } else {
            x_i <- unlist(strsplit(x, split = " "))
            paste(x_i[3], .format_month(x_i[1]), x_i[2], sep = "-")
        }
    }

    unlist(lapply(x, .format_date))
}

# format rating
# experimental

parse_rating <- function(x) {
    .format_rating <- function(x) {
        switch(x,
            "Aaa" = "AAA",
            "Aa1" = "AA+",
            "Aa2" = "AA",
            "Aa3" = "AA-",
            "Aa" = "AA",
            "Baa" = "BBB",
            "A1" = "A+",
            "A2" = "A",
            "A3" = "A-",
            "Baa1" = "BBB+",
            "Baa2" = "BBB",
            "Baa3" = "BBB-",
            "Ba1" = "BB+",
            "Ba2" = "BB",
            "Ba3" = "BB-",
            "B1" = "B+",
            "B2" = "B",
            "B3" = "B-",
            "Caa1" = "CCC+",
            "Caa2" = "CCC",
            "Caa3" = "CCC-",
            "Ca" = "CC",
            "BBB (high)" = "BBB+",
            "AA (high)" = "AA+",
            "AA (low)" = "AA-",
            "A (high)" = "A+",
            "A (low)" = "A-",
            "BBB(low)" = "BBB-",
            "BBB (low)" = "BBB-",
            "BB (high)" = "BB+",
            "BB (low)" = "BB-",
            "B (high)" = "B+",
            "B (low)" = "B-",
            "CCC (high)" = "CCC+",
            "N/A" = "",
            x
        )
    }

    if (is.na(x) && length(x) >= 1) {
        NA
    } else {
        unlist(lapply(x, .format_rating))
    }
}

# create grade
# experimental

parse_grade <- function(x) {
    .format_grade <- function(x) {
        switch(x,
            "AAA" = "prime",
            "AA+" = "high grade",
            "AA" = "high grade",
            "AA-" = "high grade",
            "A+" = "upper medium grade",
            "A" = "upper medium grade",
            "A-" = "upper medium grade",
            "BBB+" = "lower medium grade",
            "BBB" = "lower medium grade",
            "BBB-" = "lower medium grade",
            "BB+" = "non-investment grade speculative",
            "BB" = "non-investment grade speculative",
            "BB-" = "non-investment grade speculative",
            "B+" = "highly speculative",
            "B" = "highly speculative",
            "B-" = "highly speculative",
            "CCC+" = "substantial risks",
            "CCC" = "substantial risks",
            "CCC-" = "substantial risks",
            "CC" = "extremely speculative",
            "SD" = "In default with little prospect for recovery",
            "RD" = "In default with little prospect for recovery",
            "D" = "in default",
            "DD" = "in default",
            "DDD" = "in default",
            "WR" = "not rated",
            "NR" = "not rated",
            NA_character_
        )
    }

    if (is.na(x) && length(x) >= 1) {
        NA
    } else {
        unlist(lapply(x, .format_grade))
    }
}
