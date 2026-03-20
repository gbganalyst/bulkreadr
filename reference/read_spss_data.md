# Read SPSS data file

`read_spss_data()` is designed to seamlessly import data from an SPSS
data (`.sav` or `.zsav`) files. It converts labelled variables into
factors, a crucial step that enhances the ease of data manipulation and
analysis within the R programming environment.

## Usage

``` r
read_spss_data(file, label = FALSE)
```

## Arguments

- file:

  The path to the SPSS data file.

- label:

  Logical indicating whether to use variable labels as column names
  (default is FALSE).

## Value

A tibble containing the data from the SPSS file.

## See also

[`read_stata_data()`](https://gbganalyst.github.io/bulkreadr/reference/read_stata_data.md)
which reads Stata data file and converts labelled variables into
factors.

## Examples

``` r
# Read an SPSS data file without converting variable labels as column names

file_path <- system.file("extdata", "Wages.sav", package = "bulkreadr")

data <- read_spss_data(file = file_path)

data
#> # A tibble: 400 × 9
#>       id  educ south                  sex   exper  wage occup marr        ed    
#>    <dbl> <dbl> <fct>                  <fct> <dbl> <dbl> <fct> <fct>       <fct> 
#>  1     3    12 does not live in South Male     17  7.5  Other Married     High …
#>  2     4    13 does not live in South Male      9 13.1  Other Not married Some …
#>  3     5    10 lives in South         Male     27  4.45 Other Not married Less …
#>  4    12     9 lives in South         Male     30  6.25 Other Not married Less …
#>  5    13     9 lives in South         Male     29 20.0  Other Married     Less …
#>  6    14    12 does not live in South Male     37  7.3  Other Married     High …
#>  7    17    11 does not live in South Male     16  3.65 Other Not married Less …
#>  8    20    12 does not live in South Male      9  3.75 Other Not married High …
#>  9    21    11 lives in South         Male     14  4.5  Other Married     Less …
#> 10    23     6 lives in South         Male     45  5.75 Other Married     Less …
#> # ℹ 390 more rows

# Read an SPSS data file and convert variable labels as column names

data <- read_spss_data(file = file_path, label = TRUE)

data
#> # A tibble: 400 × 9
#>    `Worker ID` `Number of years of education` `Live in south`        Gender
#>          <dbl>                          <dbl> <fct>                  <fct> 
#>  1           3                             12 does not live in South Male  
#>  2           4                             13 does not live in South Male  
#>  3           5                             10 lives in South         Male  
#>  4          12                              9 lives in South         Male  
#>  5          13                              9 lives in South         Male  
#>  6          14                             12 does not live in South Male  
#>  7          17                             11 does not live in South Male  
#>  8          20                             12 does not live in South Male  
#>  9          21                             11 lives in South         Male  
#> 10          23                              6 lives in South         Male  
#> # ℹ 390 more rows
#> # ℹ 5 more variables: `Number of years of work experience` <dbl>,
#> #   `Wage (dollars per hour)` <dbl>, Occupation <fct>, `Marital status` <fct>,
#> #   `Highest education level` <fct>
```
