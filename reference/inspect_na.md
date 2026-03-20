# Summarize missingness in data frame columns

`inspect_na()` summarizes the rate of missingness in each column of a
data frame. For a grouped data frame, the rate of missingness is
summarized separately for each group.

## Usage

``` r
inspect_na(df)
```

## Arguments

- df:

  A data frame or grouped data frame.

## Value

A tibble.

## Details

The tibble returned contains the columns:

- **col_name**: column names of `df`.

- **cnt**: number of `NA` values per column.

- **pcnt**: percentage of records that are `NA`.

For grouped data frames the group key columns appear first, followed by
`col_name`, `cnt`, and `pcnt`. Rows are sorted by group keys (ascending)
then by `cnt` (descending) within each group.

## Examples

``` r
inspect_na(airquality)
#> # A tibble: 6 × 3
#>   col_name   cnt  pcnt
#>   <chr>    <int> <dbl>
#> 1 Ozone       37 24.2 
#> 2 Solar.R      7  4.58
#> 3 Wind         0  0   
#> 4 Temp         0  0   
#> 5 Month        0  0   
#> 6 Day          0  0   
# Grouped dataframe summary
airquality |>
  dplyr::group_by(Month) |>
  inspect_na()
#> # A tibble: 25 × 4
#>    Month col_name   cnt  pcnt
#>    <int> <chr>    <int> <dbl>
#>  1     5 Ozone        5  16.1
#>  2     5 Solar.R      4  12.9
#>  3     5 Wind         0   0  
#>  4     5 Temp         0   0  
#>  5     5 Day          0   0  
#>  6     6 Ozone       21  70  
#>  7     6 Solar.R      0   0  
#>  8     6 Wind         0   0  
#>  9     6 Temp         0   0  
#> 10     6 Day          0   0  
#> # ℹ 15 more rows
```
