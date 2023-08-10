
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bulkreadr <a><img src='man/figures/logo.png' align="right" height="138.5" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/gbganalyst/bulkreadr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/gbganalyst/bulkreadr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

`bulkreadr` is an R package designed to simplify and streamline the
process of reading and processing large volumes of data. With a
collection of functions tailored for bulk data operations, the package
allows users to efficiently read multiple sheets from Microsoft
Excel/Google Sheets workbooks and multiple CSV files from a directory.
It returns the data as organized data frames, making it convenient for
further analysis and manipulation. Whether dealing with extensive data
sets or batch processing tasks, “bulkreadr” empowers users to
effortlessly handle data in bulk, saving time and effort in data
preparation workflows.

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

- [`inspect_na()`](#inspect_na)

- [`fill_missing_values()`](#fill_missing_values)

## `read_excel_workbook()`

`read_excel_workbook()` reads all the data from the sheets of an Excel
workbook and return an appended dataframe.

``` r

# load bulkreadr package

library(bulkreadr)

# path to the xls/xlsx file.

path <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr", mustWork = TRUE)

# read the sheets

read_excel_workbook(path = path)
```

## `read_excel_files_from_dir()`

`read_excel_files_from_dir()` reads all Excel workbooks in the
`"~/data"` directory and returns an appended dataframe.

``` r

# path to the directory containing the xls/xlsx files.

directory <- system.file("xlsxfolder",  package = "bulkreadr")

# import the workbooks

read_excel_files_from_dir(dir_path = directory)
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
```

## `pull_out()`

`pull_out()` is similar to \[. It acts on vectors, matrices, arrays and
lists to extract or replace parts. It is pleasant to use with the
magrittr (`⁠%>%`⁠) and base(`|>`) operators.

``` r

top_10_richest_nig <- c("Aliko Dangote", "Mike Adenuga", "Femi Otedola", "Arthur Eze", "Abdulsamad Rabiu", "Cletus Ibeto", "Orji Uzor Kalu", "ABC Orjiakor", "Jimoh Ibrahim", "Tony Elumelu")

top_10_richest_nig %>% 
  pull_out(c(1, 5, 2))
```

``` r
top_10_richest_nig %>% 
  pull_out(-c(1, 5, 2))
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

# It can also convert date time object to date object 

convert_to_date(lubridate::now())
```

## `inspect_na()`

`inspect_na()` summarizes the rate of missingness in each column of a
data frame. For a grouped data frame, the rate of missingness is
summarized separately for each group.

``` r

# dataframe summary

inspect_na(airquality)

# grouped dataframe summary

airquality %>% 
  group_by(Month) %>% 
  inspect_na()
```

## `fill_missing_values()`

`fill_missing_values()` in an efficient function that addresses missing
values in a dataframe. It uses imputation by function, meaning it
replaces missing data in numeric variables with either the mean or the
median, and in non-numeric variables with the mode. The function takes a
column-based imputation approach, ensuring that replacement values are
derived from the respective columns, resulting in accurate and
consistent data. This method enhances the integrity of the dataset and
promotes sound decision-making and analysis in data processing
workflows.

``` r

df <- tibble(
  Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
  Sepal.Width = c(4.1, 3.6, 3, 3, 2.9, 2.5, 2.4),
  Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
  Petal_Width = c(NA, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
  Species = c("setosa", NA, "versicolor", "setosa",
    NA, "virginica", "setosa"
  )
)

df

# Using mean to fill missing values for numeric variables

result_df_mean <- fill_missing_values(df, use_mean = TRUE)

result_df_mean

# Using median to fill missing values for numeric variables

result_df_median <- fill_missing_values(df, use_mean = FALSE)

result_df_median
```

### Impute missing values (NAs) in a grouped data frame

You can use the `fill_missing_values()` in a grouped data frame by using
other grouping and map functions. Here is an example of how to do this:

``` r
sample_iris <- tibble(
Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
Petal_Width = c(0.3, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
Species = c("setosa", "setosa", "versicolor", "setosa",
          "virginica", "virginica", "setosa")
)

sample_iris

sample_iris %>%
  group_by(Species) %>%
  group_split() %>%
  map_df(fill_missing_values)
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
