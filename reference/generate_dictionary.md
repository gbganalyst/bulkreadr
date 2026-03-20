# Create a data dictionary from labelled data

`generate_dictionary()` creates a data dictionary from a specified data
frame. This function is particularly useful for understanding and
documenting the structure of your dataset, similar to data dictionaries
in Stata or SPSS.

## Usage

``` r
generate_dictionary(data)
```

## Arguments

- data:

  a data frame or a survey object

## Value

A tibble representing the data dictionary. Each row corresponds to a
variable in the original data frame, providing detailed information
about the variable's characteristics.

## Details

The function returns a tibble (a modern version of R's data frame) with
the following columns:

- **position**: An integer vector indicating the column position in the
  data frame.

- **variable**: A character vector containing the names of the variables
  (columns).

- **description**: A character vector with a human-readable description
  of each variable.

- **column type**: A character vector specifying the data type (e.g.,
  numeric, character) of each variable.

- **missing**: An integer vector indicating the count of missing values
  for each variable.

- **levels**: A list vector containing the levels for categorical
  variables, if applicable.

## Examples

``` r
# Creating a data dictionary from an SPSS file

file_path <- system.file("extdata", "Wages.sav", package = "bulkreadr")

wage_data <- read_spss_data(file = file_path)

generate_dictionary(wage_data)
#> # A tibble: 9 × 6
#>   position variable description                     `column type` missing levels
#>      <int> <chr>    <chr>                           <chr>           <int> <name>
#> 1        1 id       Worker ID                       dbl                 0 <NULL>
#> 2        2 educ     Number of years of education    dbl                 0 <NULL>
#> 3        3 south    Live in south                   fct                 0 <chr> 
#> 4        4 sex      Gender                          fct                 0 <chr> 
#> 5        5 exper    Number of years of work experi… dbl                 0 <NULL>
#> 6        6 wage     Wage (dollars per hour)         dbl                 0 <NULL>
#> 7        7 occup    Occupation                      fct                 0 <chr> 
#> 8        8 marr     Marital status                  fct                 0 <chr> 
#> 9        9 ed       Highest education level         fct                 0 <chr> 

```
