# Fill missing values in a data frame

`fill_missing_values()` is an efficient function that addresses missing
values in a data frame. It uses imputation by function, also known as
column-based imputation, to impute the missing values. For continuous
variables, it supports various methods of imputation, including minimum,
maximum, mean, median, harmonic mean, and geometric mean. For
categorical variables, missing values are replaced with the mode of the
column. This approach ensures accurate and consistent replacements
derived from individual columns, resulting in a complete and reliable
dataset for improved analysis and decision-making.

## Usage

``` r
fill_missing_values(
  df,
  selected_variables = NULL,
  method = c("mean", "min", "max", "median", "harmonic", "geometric")
)
```

## Arguments

- df:

  A dataframe to process for missing value imputation.

- selected_variables:

  An optional vector of variable names within `df` for which missing
  values should be imputed. If `NULL` (default), imputation is applied
  to all variables in the data frame. Variables must be quoted.

- method:

  A character string specifying the imputation method for continuous
  variables. Supported methods are `"min"`, `"max"`, `"mean"`,
  `"median"`, `"harmonic"`, and `"geometric"`. The default method is
  `"mean"`. For categorical variables, the `mode` is always used.

## Value

A data frame with missing values imputed according to the specified
`method`.

## Examples

``` r
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union

# Assuming 'df' is the dataframe you want to process

df <- tibble::tibble(
Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
Petal_Width = c(NA, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
Species = c("setosa", NA, "versicolor", "setosa",
           NA, "virginica", "setosa")
)

# Impute using the mean method for continuous variables

result_df_mean <- fill_missing_values(df, method = "mean")

result_df_mean
#> # A tibble: 7 × 4
#>   Sepal_Length Petal_Length Petal_Width Species   
#>          <dbl>        <dbl>       <dbl> <chr>     
#> 1         5.2           1.5        0.94 setosa    
#> 2         5             1.4        0.2  setosa    
#> 3         5.7           4.2        1.2  versicolor
#> 4         5.72          1.4        0.2  setosa    
#> 5         6.2           3          1.3  setosa    
#> 6         6.7           5.8        1.8  virginica 
#> 7         5.5           3.7        0.94 setosa    

# Impute using the geometric mean for continuous variables and specify
# variables `Petal_Length` and `Petal_Width`.

result_df_geomean <- fill_missing_values(df, selected_variables = c
("Petal_Length", "Petal_Width"), method = "geometric")

result_df_geomean
#> # A tibble: 7 × 4
#>   Sepal_Length Petal_Length Petal_Width Species   
#>          <dbl>        <dbl>       <dbl> <chr>     
#> 1          5.2         1.5        0.732 setosa    
#> 2          5           1.4        0.2   NA        
#> 3          5.7         4.2        1.2   versicolor
#> 4         NA           1.4        0.2   setosa    
#> 5          6.2         2.22       1.3   NA        
#> 6          6.7         5.8        1.8   virginica 
#> 7          5.5         3.7        0.732 setosa    

# Impute missing values (NAs) in a grouped data frame

# You can do that by using the following:

sample_iris <- tibble::tibble(
Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
Petal_Width = c(0.3, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
Species = c("setosa", "setosa", "versicolor", "setosa",
           "virginica", "virginica", "setosa")
)

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
#> 6          6.2          5.8         1.3 virginica 
#> 7          6.7          5.8         1.8 virginica 

```
