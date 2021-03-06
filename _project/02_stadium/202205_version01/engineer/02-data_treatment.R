## ------------------------------------------
##                          Date: 2022-05-29
## ------------------------------------------
## Project: stadium
## Author: Bruno Faria
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

## --------------------------------------------------------------------------------
## import data-raw - date: 2022-05-29 12:20:52
## --------------------------------------------------------------------------------

df_i <- as.data.frame(data.table::fread("./_project/02_stadium/202205_version01/data-raw/stadiumRaw.csv"))

## --------------------------------------------------------------------------------
## treatment from dataset - date: 2022-05-29 12:21:48
## --------------------------------------------------------------------------------

## ------------------------------------------
## rename
## ------------------------------------------

colnames(df_i) <- tolower(colnames(df_i))

## ------------------------------------------
## create escape unicode
## ------------------------------------------

stadium_i <- as.data.frame(apply(df_i, 2, stringi::stri_escape_unicode))

## ------------------------------------------
## special case: save to package
## ------------------------------------------

# export for package
stadium <- stadium_i
colnames(stadium) <- c("country","name","city","club","capacity")
stadium <- subset(stadium, 
    select = c(country, city, name, club, capacity))
save(stadium, file = "./_project/02_stadium/202205_version01/data/stadium.rda")
rm(stadium)

## ------------------------------------------
## clubs
## ------------------------------------------

df_i <- df_i |> 
    dplyr::mutate(clubs = dplyr::case_when(
        clubs == "-" ~ NA_character_,
        TRUE ~ clubs
    )) |> 
    as.data.frame()

## ------------------------------------------
## capacity
## ------------------------------------------

df_i <- df_i |> 
    dplyr::mutate(capacity = as.numeric(gsub("\\ ", "\\", capacity))) |> 
    dplyr::rename(club = clubs) |> 
    dplyr::select(country, city, name, club, capacity) |> 
    as.data.frame()

## --------------------------------------------------------------------------------
## export - date: 2022-05-29 13:07:07
## --------------------------------------------------------------------------------

# export
write.csv2(df_i, row.names = FALSE,
    file = "./csv/stadium.csv")

# remove
rm(df_i)
