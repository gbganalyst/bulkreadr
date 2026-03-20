# User friendly date parsing function

`convert_to_date()` parses an input vector into POSIXct date object. It
is also powerful to convert from excel date number like `42370` into
date value like `2016-01-01`.

## Usage

``` r
convert_to_date(date_num_char, tz = "UTC")
```

## Arguments

- date_num_char:

  A character or numeric vector of dates

- tz:

  Time zone indicator. If `NULL` (default), a Date object is returned.
  Otherwise a POSIXct with time zone attribute set to `tz`.

## Value

a vector of class Date

## Examples

``` r
## ** heterogeneous dates **

dates <- c(
  44869, "22.09.2022", NA, "02/27/92", "01-19-2022",
  "13-01-  2022", "2023", "2023-2", 41750.2, 41751.99,
  "11 07 2023", "2023-4"
)

convert_to_date(dates)
#>  [1] "2022-11-04" "2022-09-22" NA           "1992-02-27" "2022-01-19"
#>  [6] "2022-01-13" "2023-01-01" "2023-02-01" "2014-04-21" "2014-04-22"
#> [11] "2023-07-11" "2023-04-01"
```
