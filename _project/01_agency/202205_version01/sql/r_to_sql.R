## ------------------------------------------
##                          Date: 2022-05-21
## ------------------------------------------
## Project: 
## Author: 
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

## --------------------------------------------------------------------------------
## import data - date: 2022-05-21 12:04:46
## --------------------------------------------------------------------------------

url_i <- "https://raw.githubusercontent.com/brunofariadf/database/main/csv/agency.csv"
data_i <- as.data.frame(data.table::fread(url_i))
head(data_i, 2)

## --------------------------------------------------------------------------------
## create .db - date: 2022-05-21 12:18:28
## --------------------------------------------------------------------------------

# set variable
my_db <- "agency"
path_db <- "C:\\sqlite3\\db"

# construct path
my_db <- paste0(my_db, ".db")
path_db <- file.path(path_db, my_db)
path_db <- suppressWarnings(normalizePath(path_db))

# construct .db
sqldf::sqldf(paste0("attach '", path_db, "' as new")) |> 
    suppressWarnings()

## --------------------------------------------------------------------------------
## export - date: 2022-05-21 12:36:31
## --------------------------------------------------------------------------------

# create connect
con <- DBI::dbConnect(drv = RSQLite::SQLite(), dbname = path_db)

# export
data_i[["date"]] <- as.character(data_i[["date"]]) 
DBI::dbWriteTable(con, name = "tbl_agency_rating", data_i)

# desconnect
DBI::dbDisconnect(con)

# remove
rm(con,data_i,my_db,path_db,url_i)
