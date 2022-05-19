## ------------------------------------------
##                          Date: 2022-05-15
## ------------------------------------------
## Project: 
## Author: 
## 
## GUI: vscode (1.67.1)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

# rscript::rscript_create("./_project/01_agency/2022-01_version/R", 
#     name_script = "01_data-get", open_script = FALSE, set_ide = FALSE)

# dir.create("./_project/01_agency/2022-01_version/R")

# rscript::rscript_create("./_project/01_agency/2022-01_version/engineer", name_script = "02-data-treatment")

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

## --------------------------------------------------------------------------------
## create tbl - date: 2022-05-15 17:36:08
## --------------------------------------------------------------------------------

df_i <- data.frame(
            id = c("01"),
            dataset = c("agency"),
            year = c("2022"),
            csv = c(.get_color("x")),
            sql = c(.get_color(""))
        )

## --------------------------------------------------------------------------------
## export tbl - date: 2022-05-15 17:37:35
## --------------------------------------------------------------------------------

knitr::kable(df_i, align = "c", format = "markdown") |> 
    writeClipboard()
