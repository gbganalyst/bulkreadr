
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
#> [1] "2023-08-10"
```

## `inspect_na()`

`inspect_na()` summarizes the rate of missingness in each column of a
data frame. For a grouped data frame, the rate of missingness is
summarized separately for each group.

``` r

# dataframe summary

inspect_na(airquality)
#> # A tibble: 6 × 3
#>   col_name   cnt  pcnt
#>   <chr>    <int> <dbl>
#> 1 Ozone       37 24.2 
#> 2 Solar.R      7  4.58
#> 3 Wind         0  0   
#> 4 Temp         0  0   
#> 5 Month        0  0   
#> # ℹ 1 more row

# grouped dataframe summary

airquality %>% 
  group_by(Month) %>% 
  inspect_na()
#> # A tibble: 25 × 4
#> # Groups:   Month [5]
#>   Month col_name   cnt  pcnt
#>   <int> <chr>    <int> <dbl>
#> 1     5 Ozone        5  16.1
#> 2     5 Solar.R      4  12.9
#> 3     5 Wind         0   0  
#> 4     5 Temp         0   0  
#> 5     5 Day          0   0  
#> # ℹ 20 more rows
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
#> # A tibble: 7 × 5
#>   Sepal_Length Sepal.Width Petal_Length Petal_Width Species   
#>          <dbl>       <dbl>        <dbl>       <dbl> <chr>     
#> 1          5.2         4.1          1.5        NA   setosa    
#> 2          5           3.6          1.4         0.2 <NA>      
#> 3          5.7         3            4.2         1.2 versicolor
#> 4         NA           3            1.4         0.2 setosa    
#> 5          6.2         2.9         NA           1.3 <NA>      
#> # ℹ 2 more rows

# Using mean to fill missing values for numeric variables

result_df_mean <- fill_missing_values(df, use_mean = TRUE)

result_df_mean
#> # A tibble: 7 × 5
#>   Sepal_Length Sepal.Width Petal_Length Petal_Width Species   
#>          <dbl>       <dbl>        <dbl>       <dbl> <chr>     
#> 1         5.2          4.1          1.5        0.94 setosa    
#> 2         5            3.6          1.4        0.2  setosa    
#> 3         5.7          3            4.2        1.2  versicolor
#> 4         5.72         3            1.4        0.2  setosa    
#> 5         6.2          2.9          3          1.3  setosa    
#> # ℹ 2 more rows

# Using median to fill missing values for numeric variables

result_df_median <- fill_missing_values(df, use_mean = FALSE)

result_df_median
#> # A tibble: 7 × 5
#>   Sepal_Length Sepal.Width Petal_Length Petal_Width Species   
#>          <dbl>       <dbl>        <dbl>       <dbl> <chr>     
#> 1          5.2         4.1          1.5         1.2 setosa    
#> 2          5           3.6          1.4         0.2 setosa    
#> 3          5.7         3            4.2         1.2 versicolor
#> 4          5.6         3            1.4         0.2 setosa    
#> 5          6.2         2.9          2.6         1.3 setosa    
#> # ℹ 2 more rows
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
#> # A tibble: 7 × 4
#>   Sepal_Length Petal_Length Petal_Width Species   
#>          <dbl>        <dbl>       <dbl> <chr>     
#> 1          5.2          1.5         0.3 setosa    
#> 2          5            1.4         0.2 setosa    
#> 3          5.7          4.2         1.2 versicolor
#> 4         NA            1.4         0.2 setosa    
#> 5          6.2         NA           1.3 virginica 
#> # ℹ 2 more rows

sample_iris %>%
  group_by(Species) %>%
  group_split() %>%
  map_df(fill_missing_values)
#> # A tibble: 7 × 4
#>   Sepal_Length Petal_Length Petal_Width Species   
#>          <dbl>        <dbl>       <dbl> <chr>     
#> 1         5.2           1.5       0.3   setosa    
#> 2         5             1.4       0.2   setosa    
#> 3         5.23          1.4       0.2   setosa    
#> 4         5.5           3.7       0.233 setosa    
#> 5         5.7           4.2       1.2   versicolor
#> # ℹ 2 more rows
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
