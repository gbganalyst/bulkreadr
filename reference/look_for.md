# Look for keywords variable names and descriptions in labelled data

The `look_for()` function is designed to emulate the functionality of
the Stata `lookfor` command in R. It provides a powerful tool for
searching through large datasets, specifically targeting variable names,
variable label descriptions, factor levels, and value labels. This
function is handy for users working with extensive and complex datasets,
enabling them to quickly and efficiently locate the variables of
interest.

## Usage

``` r
look_for(
  data,
  ...,
  labels = TRUE,
  values = TRUE,
  ignore.case = TRUE,
  details = c("basic", "none", "full")
)
```

## Arguments

- data:

  a data frame or a survey object

- ...:

  optional list of keywords, a character string (or several character
  strings), which can be formatted as a regular expression suitable for
  a [`base::grep()`](https://rdrr.io/r/base/grep.html) pattern, or a
  vector of keywords; displays all variables if not specified

- labels:

  whether or not to search variable labels (descriptions); `TRUE` by
  default

- values:

  whether or not to search within values (factor levels or value
  labels); `TRUE` by default

- ignore.case:

  whether or not to make the keywords case sensitive; `TRUE` by default
  (case is ignored during matching)

- details:

  add details about each variable (full details could be time consuming
  for big data frames, `FALSE` is equivalent to `"none"` and `TRUE` to
  `"full"`)

## Value

A tibble data frame featuring the variable position, name and
description (if it exists) in the original data frame.

## Examples

``` r
look_for(iris)
#>  pos variable     label col_type missing values    
#>  1   Sepal.Length —     dbl      0                 
#>  2   Sepal.Width  —     dbl      0                 
#>  3   Petal.Length —     dbl      0                 
#>  4   Petal.Width  —     dbl      0                 
#>  5   Species      —     fct      0       setosa    
#>                                          versicolor
#>                                          virginica 

# Look for a single keyword.

look_for(iris, "petal")
#>  pos variable     label col_type missing values
#>  3   Petal.Length —     dbl      0             
#>  4   Petal.Width  —     dbl      0             

look_for(iris, "s")
#>  pos variable     label col_type missing values    
#>  1   Sepal.Length —     dbl      0                 
#>  2   Sepal.Width  —     dbl      0                 
#>  5   Species      —     fct      0       setosa    
#>                                          versicolor
#>                                          virginica 
```
