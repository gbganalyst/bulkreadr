# Other functions in bulkreadr

The `bulkreadr` package in R includes specialized functions beyond bulk
data reading, aimed at enhancing data analysis efficiency. These
functions are designed to operate on individual vectors, except for
[`inspect_na()`](https://gbganalyst.github.io/bulkreadr/reference/inspect_na.md)
and
[`fill_missing_values()`](https://gbganalyst.github.io/bulkreadr/reference/fill_missing_values.md),
which work on data frames.

## pull_out()

[`pull_out()`](https://gbganalyst.github.io/bulkreadr/reference/aliases.md)
is similar to \[. It acts on vectors, matrices, arrays and lists to
extract or replace parts. It is pleasant to use with the magrittr
(`⁠%>%`⁠) and base(`|>`) operators.

``` r

library(bulkreadr)
library(dplyr)

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

## convert_to_date()

[`convert_to_date()`](https://gbganalyst.github.io/bulkreadr/reference/convert_to_date.md)
parses an input vector into POSIXct date-time object. It is also
powerful to convert from excel date number like `42370` into date value
like `2016-01-01`.

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
#> [1] "2026-03-20"
```

## inspect_na()

[`inspect_na()`](https://gbganalyst.github.io/bulkreadr/reference/inspect_na.md)
summarizes the rate of missingness in each column of a data frame. For a
grouped data frame, the rate of missingness is summarized separately for
each group.

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
```

**Grouped dataframe summary**

``` r
airquality %>% 
  group_by(Month) %>% 
  inspect_na()
#> # A tibble: 25 × 4
#>   Month col_name   cnt  pcnt
#>   <int> <chr>    <int> <dbl>
#> 1     5 Ozone        5  16.1
#> 2     5 Solar.R      4  12.9
#> 3     5 Wind         0   0  
#> 4     5 Temp         0   0  
#> 5     5 Day          0   0  
#> # ℹ 20 more rows
```

## fill_missing_values()

[`fill_missing_values()`](https://gbganalyst.github.io/bulkreadr/reference/fill_missing_values.md)
is an efficient function that addresses missing values in a data frame.
It uses imputation by function, also known as column-based imputation,
to impute the missing values. It supports various imputation methods for
continuous variables, including `minimum`, `maximum`, `mean`, `median`,
`harmonic mean`, and `geometric mean`. For categorical variables,
missing values are replaced with the `mode` of the column. This approach
ensures accurate and consistent replacements derived from individual
columns, resulting in a complete and reliable dataset for improved
analysis and decision-making.

``` r

df <- tibble::tibble(
  Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
  Sepal.Width = c(4.1, 3.6, 3, 3, 2.9, 2.5, 2.4),
  Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
  Petal_Width = c(NA, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
  Species = c("setosa", NA, "versicolor", "setosa",
    NA, "virginica", "setosa"
  )
)
```

``` r
df
#> # A tibble: 7 × 5
#>   Sepal_Length Sepal.Width Petal_Length Petal_Width Species   
#>          <dbl>       <dbl>        <dbl>       <dbl> <chr>     
#> 1          5.2         4.1          1.5        NA   setosa    
#> 2          5           3.6          1.4         0.2 NA        
#> 3          5.7         3            4.2         1.2 versicolor
#> 4         NA           3            1.4         0.2 setosa    
#> 5          6.2         2.9         NA           1.3 NA        
#> # ℹ 2 more rows
```

**Impute using the mean method for continuous variables**

``` r

#' df <- tibble::tibble(
#' Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
#' Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
#' Petal_Width = c(NA, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
#' Species = c("setosa", NA, "versicolor", "setosa",
#'            NA, "virginica", "setosa")
#' )
```

``` r
result_df_mean <- fill_missing_values(df, method = "mean")

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
```

**Impute using the geometric mean for continuous variables and specify
variables `Petal_Length` and `Petal_Width`**

``` r

result_df_geomean <- fill_missing_values(df, selected_variables = c
("Petal_Length", "Petal_Width"), method = "geometric")

result_df_geomean
#> # A tibble: 7 × 5
#>   Sepal_Length Sepal.Width Petal_Length Petal_Width Species   
#>          <dbl>       <dbl>        <dbl>       <dbl> <chr>     
#> 1          5.2         4.1         1.5        0.732 setosa    
#> 2          5           3.6         1.4        0.2   NA        
#> 3          5.7         3           4.2        1.2   versicolor
#> 4         NA           3           1.4        0.2   setosa    
#> 5          6.2         2.9         2.22       1.3   NA        
#> # ℹ 2 more rows
```

### Impute missing values (NAs) in a grouped data frame

You can use the
[`fill_missing_values()`](https://gbganalyst.github.io/bulkreadr/reference/fill_missing_values.md)
in a grouped data frame by using other grouping and map functions. Here
is an example of how to do this:

``` r
sample_iris <- tibble::tibble(
Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
Petal_Width = c(0.3, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
Species = c("setosa", "setosa", "versicolor", "setosa",
          "virginica", "virginica", "setosa")
)
```

``` r
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
```

``` r
sample_iris %>%
  group_by(Species) %>%
  group_split() %>%
  map_df(fill_missing_values, method = "median")
#> # A tibble: 7 × 4
#>   Sepal_Length Petal_Length Petal_Width Species   
#>          <dbl>        <dbl>       <dbl> <chr>     
#> 1          5.2          1.5         0.3 setosa    
#> 2          5            1.4         0.2 setosa    
#> 3          5.2          1.4         0.2 setosa    
#> 4          5.5          3.7         0.2 setosa    
#> 5          5.7          4.2         1.2 versicolor
#> # ℹ 2 more rows
```
