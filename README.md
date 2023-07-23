
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bulkreadr <a><img src='man/figures/logo.png' align="right" height="138.5" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/gbganalyst/bulkreadr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/gbganalyst/bulkreadr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

`bulkreadr` is an R package designed to simplify and streamline the
process of read and processing large volumes of data. With a collection
of functions tailored for bulk data operations, the package allows users
to efficiently read multiple sheets from Microsoft Excel/Google Sheets
workbooks and multiple CSV files from a directory. It returns the data
as organized data frames, making it convenient for further analysis and
manipulation. Whether dealing with extensive data sets or batch
processing tasks, “bulkreadr” empowers users to effortlessly handle data
in bulk, saving time and effort in data preparation workflows.

## Installation

You can install the development version of `bulkreadr` from
[GitHub](https://github.com/) with:

``` r
if(!require("devtools")){
 install.packages("devtools")
}

devtools::install_github("gbganalyst/bulkreadr")
```

## Usage

This section provides a concise overview of the different functions
available in the `bulkreadr` package. These functions serve various
purposes and are designed to handle importing of data in bulk.

- [`read_excel_workbook()`](#read_excel_workbook)

- [`read_excel_files_from_dir()`](#read_csv_files_from_dir)

- [`read_csv_files_from_dir()`](#read_csv_files_from_dir)

- [`read_gsheets()`](#read_gsheets)

## Other functions in `bulkreadr` package:

- [`pull_out()`](#pull_out)

- [`convert_to_date()`](#convert_to_date)

``` r
# load bulkreadr package

library(bulkreadr)
```

## `read_excel_workbook()`

`read_excel_workbook()` reads all the data from the sheets of an Excel
workbook and return an appended dataframe.

``` r

# path to the xls/xlsx file.

path <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr", mustWork = TRUE)

# read the sheets

read_excel_workbook(path = path)
#> # A tibble: 260 × 9
#>   carat color clarity depth table price     x     y     z
#>   <dbl> <chr> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  2    I     SI1      65.9    60 13764  7.8   7.73  5.12
#> 2  0.7  H     SI1      65.2    58  2048  5.49  5.55  3.6 
#> 3  1.51 E     SI1      58.4    70 11102  7.55  7.39  4.36
#> 4  0.7  D     SI2      65.5    57  1806  5.56  5.43  3.6 
#> 5  0.35 F     VVS1     54.6    59  1011  4.85  4.79  2.63
#> # ℹ 255 more rows
```

## `read_excel_files_from_dir()`

`read_excel_files_from_dir()` reads all Excel workbooks in the
`"~/data"` directory and returns an appended dataframe.

``` r

# path to the directory containing the xls/xlsx files.

directory <- system.file("xlsxfolder",  package = "bulkreadr")

# import the workbooks

read_excel_files_from_dir(dir_path = directory)
#> # A tibble: 260 × 10
#>   cut   carat color clarity depth table price     x     y     z
#>   <chr> <dbl> <chr> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 Fair   2    I     SI1      65.9    60 13764  7.8   7.73  5.12
#> 2 Fair   0.7  H     SI1      65.2    58  2048  5.49  5.55  3.6 
#> 3 Fair   1.51 E     SI1      58.4    70 11102  7.55  7.39  4.36
#> 4 Fair   0.7  D     SI2      65.5    57  1806  5.56  5.43  3.6 
#> 5 Fair   0.35 F     VVS1     54.6    59  1011  4.85  4.79  2.63
#> # ℹ 255 more rows
```

## `read_csv_files_from_dir()`

`read_csv_files_from_dir()` reads all csv files from the `"~/data"`
directory and returns an appended dataframe. The resulting dataframe
will be in the same order as the CSV files in the directory.

``` r
# path to the directory containing the CSV files.

directory <- system.file("csvfolder",  package = "bulkreadr")

# import the csv files

read_csv_files_from_dir(dir_path = directory)
#> # A tibble: 260 × 10
#>   cut   carat color clarity depth table price     x     y     z
#>   <chr> <dbl> <chr> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 Fair   2    I     SI1      65.9    60 13764  7.8   7.73  5.12
#> 2 Fair   0.7  H     SI1      65.2    58  2048  5.49  5.55  3.6 
#> 3 Fair   1.51 E     SI1      58.4    70 11102  7.55  7.39  4.36
#> 4 Fair   0.7  D     SI2      65.5    57  1806  5.56  5.43  3.6 
#> 5 Fair   0.35 F     VVS1     54.6    59  1011  4.85  4.79  2.63
#> # ℹ 255 more rows
```

## `read_gsheets()`

The `read_gsheets()` function imports data from multiple sheets in a
Google Sheets spreadsheet and appends the resulting dataframes from each
sheet together to create a single dataframe. This function is a powerful
tool for data analysis, as it allows you to easily combine data from
multiple sheets into a single dataset.

``` r

# Google Sheet ID or the link to the sheet

sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"

# read all the sheets

read_gsheets(ss = sheet_id)
#> # A tibble: 260 × 9
#>   carat color clarity depth table price     x     y     z
#>   <dbl> <chr> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  2    I     SI1      65.9    60 13764  7.8   7.73  5.12
#> 2  0.7  H     SI1      65.2    58  2048  5.49  5.55  3.6 
#> 3  1.51 E     SI1      58.4    70 11102  7.55  7.39  4.36
#> 4  0.7  D     SI2      65.5    57  1806  5.56  5.43  3.6 
#> 5  0.35 F     VVS1     54.6    59  1011  4.85  4.79  2.63
#> # ℹ 255 more rows
```

## `pull_out()`

`pull_out()` is similar to \[. It acts on vectors, matrices, arrays and
lists to extract or replace parts. It is pleasant to use with the
magrittr (`⁠%>%`⁠) and base(`|>`) operators.

``` r

top_10_richest_nig <- c("Aliko Dangote", "Mike Adenuga", "Femi Otedola", "Arthur Eze", "Abdulsamad Rabiu", "Cletus Ibeto", "Orji Uzor Kalu", "ABC Orjiakor", "Jimoh Ibrahim", "Tony Elumelu")

top_10_richest_nig %>% 
  pull_out(c(1, 5, 2))
#> [1] "Aliko Dangote"    "Abdulsamad Rabiu" "Mike Adenuga"
```

``` r
top_10_richest_nig %>% 
  pull_out(-c(1, 5, 2))
#> [1] "Femi Otedola"   "Arthur Eze"     "Cletus Ibeto"   "Orji Uzor Kalu"
#> [5] "ABC Orjiakor"   "Jimoh Ibrahim"  "Tony Elumelu"
```

## `convert_to_date()`

`convert_to_date()` parses an input vector into POSIXct date-time
object. It is also powerful to convert from excel date number like
`42370` into date value like `2016-01-01`.

``` r

## ** heterogeneous dates **

dates <- c(
  44869, "22.09.2022", NA, "02/27/92", "01-19-2022",
  "13-01-  2022", "2023", "2023-2", 41750.2, 41751.99,
  "11 07 2023", "2023-4"
  )

# Convert to POSIXct or Date object

convert_to_date(dates)
#>  [1] "2022-11-04" "2022-09-22" NA           "1992-02-27" "2022-01-19"
#>  [6] "2022-01-13" "2023-01-01" "2023-02-01" "2014-04-21" "2014-04-22"
#> [11] "2023-07-11" "2023-04-01"

# It can also convert date time object to date object 

convert_to_date(lubridate::now())
#> [1] "2023-07-23"
```

## Context

bulkreadr draws on and complements / emulates other packages such as
readxl, readr, and googlesheets4 to read bulk data in R.

- [readxl](https://readxl.tidyverse.org) is the tidyverse package for
  reading Excel files (xls or xlsx) into an R data frame.

- [readr](https://readr.tidyverse.org) is the tidyverse package for
  reading delimited files (e.g., csv or tsv) into an R data frame.

- [googlesheets4](https://cran.r-project.org/package=googlesheets) is
  the package to interact with Google Sheets through the Sheets API v4
  <https://developers.google.com/sheets/api>.
