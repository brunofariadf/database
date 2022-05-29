## ------------------------------------------
##                          Date: 2022-05-15
## ------------------------------------------
## Project: database
## Author: Bruno Faria
## 
## GUI: vscode (1.67.1)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

## --------------------------------------------------------------------------------
## function - date: 2022-05-15 17:42:08
## --------------------------------------------------------------------------------

.get_color <- function(x) {
    if (x == "") {
        x
    } else {
        paste0('<span style="color:orange">', x, '</span>')
    }
}

.get_link <- function(x) {
    if (x == "") {
        x
    } else {
        paste0("[x](", x, ")")
    }
}

## --------------------------------------------------------------------------------
## create tbl - date: 2022-05-15 17:36:08
## --------------------------------------------------------------------------------

## ------------------------------------------
## link
## ------------------------------------------

# agency
agency_csv <- "https://raw.githubusercontent.com/brunofariadf/database/main/csv/agency.csv"
agency_sql <- "https://github.com/brunofariadf/database/raw/main/sql/agency.db"
dim_agency <- dim(data.table::fread(agency_csv))
dim_agency <- paste(dim_agency, collapse = "x")

# stadium
stadium_csv <- "https://raw.githubusercontent.com/brunofariadf/database/main/csv/stadium.csv"
stadium_sql <- ""
dim_stadium <- dim(data.table::fread(stadium_csv))
dim_stadium <- paste(dim_stadium, collapse = "x")

## ------------------------------------------
## tbl
## ------------------------------------------

df_i <- data.frame(
            id = c("01", "02"),
            dataset = c("agency", "stadium"),
            year = c("202205", "202205"),
            dimension = c(dim_agency, dim_stadium),
            csv = c(.get_link(agency_csv), .get_link(stadium_csv)),
            sql = c(.get_link(agency_sql), .get_link(stadium_sql))
        )

## --------------------------------------------------------------------------------
## export tbl - date: 2022-05-15 17:37:35
## --------------------------------------------------------------------------------

knitr::kable(df_i, align = "c", format = "markdown") |> 
    writeClipboard()
