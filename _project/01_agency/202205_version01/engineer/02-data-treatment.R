## ------------------------------------------
##                          Date: 2022-05-19
## ------------------------------------------
## Project: agency
## Author: Bruno Faria
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

## --------------------------------------------------------------------------------
## import function - date: 2022-05-19 13:40:42
## --------------------------------------------------------------------------------

# import parse_date()
path_r <- list.files("./_project/01_agency/202205_version01/R", full.names = TRUE)
path_r <- suppressWarnings(normalizePath(path_r))
invisible(lapply(path_r, base::source))

## --------------------------------------------------------------------------------
## import data-raw - date: 2022-05-19 12:40:30
## --------------------------------------------------------------------------------

df_i <- as.data.frame(data.table::fread("./_project/01_agency/202205_version01/data-raw/agencyRaw.csv"))

## --------------------------------------------------------------------------------
## treatment from dataset - date: 2022-05-19 12:41:42
## --------------------------------------------------------------------------------

## ------------------------------------------
## rename
## ------------------------------------------

colnames(df_i) <- c("country", "agency", "rating", "outlook", "date")

## ------------------------------------------
## join error
## ------------------------------------------

df_error <- data.frame(country = "montserrat", agency = NA, rating = NA, outlook = NA, date = NA_character_)
df_i <- rbind(df_i, df_error)

## ------------------------------------------
## agency name
## ------------------------------------------

# check the name
unique(df_i[["agency"]])

# rename
df_i <- df_i |> 
    dplyr::mutate(agency = tolower(agency)) |> 
    dplyr::mutate(agency = dplyr::case_when(
        agency == "s&p" ~ "standardPoors",
        agency == "moody's" ~ "moodys",
        TRUE ~ agency)) |> 
    as.data.frame()

# check the name
unique(df_i[["agency"]])

## ------------------------------------------
## standard the rating
## ------------------------------------------

# check the name
unique(df_i[["rating"]])

df_i <- df_i |> 
    dplyr::mutate(rating = parse_rating(rating)) |> 
    dplyr::mutate(rating = dplyr::case_when(
        rating == "" ~ NA_character_,
        TRUE ~ rating)) |> 
    as.data.frame()

# check the name
unique(df_i[["rating"]])

## ------------------------------------------
## standard the outlook
## ------------------------------------------

# check the name
unique(df_i[["outlook"]])

df_i <- df_i |> 
    dplyr::mutate(outlook = tolower(outlook)) |> 
    dplyr::mutate(outlook = gsub("\\/", "\\-", outlook)) |> 
    dplyr::mutate(outlook = dplyr::case_when(
        outlook == "n-a" ~ NA_character_,
        TRUE ~ outlook)) |> 
    dplyr::mutate(outlook = dplyr::case_when(
        outlook == "" ~ NA_character_,
        TRUE ~ outlook)) |> 
    as.data.frame()

# check the name
unique(df_i[["outlook"]])

## ------------------------------------------
## format date
## ------------------------------------------

df_i <- df_i |> 
    dplyr::mutate(date = parse_date(date)) |> 
    as.data.frame()

## ------------------------------------------
## new column: grade
## ------------------------------------------

df_i <- df_i |> 
    dplyr::mutate(grade = parse_grade(rating)) |> 
    dplyr::select(date, country, rating, agency, grade, outlook) |> 
    as.data.frame()

## --------------------------------------------------------------------------------
## export - date: 2022-05-19 13:58:11
## --------------------------------------------------------------------------------

write.csv2(df_i, row.names = FALSE,
    file = "./csv/agency.csv")
