# Introduction to labelled data

## What is labelled data in R?

Labelled data in SPSS and Stata refers to datasets where each variable
(or column) and its values are assigned meaningful labels. These labels
provide context, such as descriptions or categories, making the data
easier to understand and analyze. For instance, a variable representing
gender might have numerical codes (1, 2) with labels (“Male”, “Female”).
This feature enhances data analysis by allowing researchers to work with
descriptive labels instead of deciphering codes or numeric values,
facilitating clearer interpretation and communication of statistical
results.

The R ecosystem, through packages like `foreign` and `haven`,
facilitates the importation of labelled data from software like SPSS and
Stata, ensuring a smooth transition into R. The `bulkreadr` package
extends this functionality by leveraging `haven` to further streamline
the process. It automatically converts labelled data into R’s factor
data type, eliminating the need for manual recoding. This enhancement
significantly improves the efficiency of the data analysis workflow
within the R environment.

### Note

> For the majority of functions within this package, we will utilize
> data stored in the system file by the `bulkreadr`, which can be
> accessed using the
> [`system.file()`](https://rdrr.io/r/base/system.file.html) function.
> If you wish to utilize your own data stored in your local directory,
> please ensure that you have set the appropriate file path prior to
> using any functions provided by the bulkreadr package.

### read_spss_data()

[`read_spss_data()`](https://gbganalyst.github.io/bulkreadr/reference/read_spss_data.md)
is designed to seamlessly import data from an SPSS data (`.sav` or
`.zsav`) files. It converts labelled variables into factors, a crucial
step that enhances the ease of data manipulation and analysis within the
R programming environment.

**Read the SPSS data file without converting variable labels as column
names**

``` r

library(bulkreadr)

file_path <- system.file("extdata", "Wages.sav", package = "bulkreadr")

data <- read_spss_data(file = file_path)

data
#> # A tibble: 400 × 9
#>      id  educ south                  sex   exper  wage occup marr        ed     
#>   <dbl> <dbl> <fct>                  <fct> <dbl> <dbl> <fct> <fct>       <fct>  
#> 1     3    12 does not live in South Male     17  7.5  Other Married     High s…
#> 2     4    13 does not live in South Male      9 13.1  Other Not married Some c…
#> 3     5    10 lives in South         Male     27  4.45 Other Not married Less t…
#> 4    12     9 lives in South         Male     30  6.25 Other Not married Less t…
#> 5    13     9 lives in South         Male     29 20.0  Other Married     Less t…
#> # ℹ 395 more rows
```

**Read the SPSS data file and convert variable labels as column names**

``` r

data <- read_spss_data(file = file_path, label = TRUE)

data
#> # A tibble: 400 × 9
#>   `Worker ID` `Number of years of education` `Live in south`        Gender
#>         <dbl>                          <dbl> <fct>                  <fct> 
#> 1           3                             12 does not live in South Male  
#> 2           4                             13 does not live in South Male  
#> 3           5                             10 lives in South         Male  
#> 4          12                              9 lives in South         Male  
#> 5          13                              9 lives in South         Male  
#> # ℹ 395 more rows
#> # ℹ 5 more variables: `Number of years of work experience` <dbl>,
#> #   `Wage (dollars per hour)` <dbl>, Occupation <fct>, `Marital status` <fct>,
#> #   `Highest education level` <fct>
```

### read_stata_data()

[`read_stata_data()`](https://gbganalyst.github.io/bulkreadr/reference/read_stata_data.md)
reads Stata data file (`.dta`) into an R data frame, converting labeled
variables into factors.

**Read the Stata data file without converting variable labels as column
names**

``` r

file_path <- system.file("extdata", "Wages.dta", package = "bulkreadr")

data <- read_stata_data(file = file_path)

data
#> # A tibble: 400 × 9
#>      id  educ south                  sex   exper  wage occup marr        ed     
#>   <dbl> <dbl> <fct>                  <fct> <dbl> <dbl> <fct> <fct>       <fct>  
#> 1     3    12 does not live in South Male     17  7.5  Other Married     High s…
#> 2     4    13 does not live in South Male      9 13.1  Other Not married Some c…
#> 3     5    10 lives in South         Male     27  4.45 Other Not married Less t…
#> 4    12     9 lives in South         Male     30  6.25 Other Not married Less t…
#> 5    13     9 lives in South         Male     29 20.0  Other Married     Less t…
#> # ℹ 395 more rows
```

**Read the Stata data file and convert variable labels as column names**

``` r

data <- read_stata_data(file = file_path, label = TRUE)

data
#> # A tibble: 400 × 9
#>   `Worker ID` `Number of years of education` `Live in south`        Gender
#>         <dbl>                          <dbl> <fct>                  <fct> 
#> 1           3                             12 does not live in South Male  
#> 2           4                             13 does not live in South Male  
#> 3           5                             10 lives in South         Male  
#> 4          12                              9 lives in South         Male  
#> 5          13                              9 lives in South         Male  
#> # ℹ 395 more rows
#> # ℹ 5 more variables: `Number of years of work experience` <dbl>,
#> #   `Wage (dollars per hour)` <dbl>, Occupation <fct>, `Marital status` <fct>,
#> #   `Highest education level` <fct>
```

### generate_dictionary()

[`generate_dictionary()`](https://gbganalyst.github.io/bulkreadr/reference/generate_dictionary.md)
creates a data dictionary from a specified data frame. This function is
particularly useful for understanding and documenting the structure of
your dataset, similar to data dictionaries in Stata or SPSS.

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
#> # ℹ 4 more rows
```

### look_for()

The
[`look_for()`](https://gbganalyst.github.io/bulkreadr/reference/look_for.md)
function is designed to emulate the functionality of the Stata `lookfor`
command in R. It provides a powerful tool for searching through large
datasets, specifically targeting variable names, variable label
descriptions, factor levels, and value labels. This function is handy
for users working with extensive and complex datasets, enabling them to
quickly and efficiently locate the variables of interest.

``` r

# Look for a single keyword.

look_for(wage_data, "south")
#>  pos variable label         col_type missing values                
#>  3   south    Live in south fct      0       does not live in South
#>                                              lives in South

look_for(wage_data, "^s")
#>  pos variable label         col_type missing values                
#>  3   south    Live in south fct      0       does not live in South
#>                                              lives in South        
#>  4   sex      Gender        fct      0       Male                  
#>                                              Female
```
