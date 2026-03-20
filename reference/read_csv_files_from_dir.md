# Reads all CSV files from a directory

`read_csv_files_from_dir` reads all csv files from the `"~/data"`
directory and returns an appended dataframe. The resulting dataframe
will be in the same order as the CSV files in the directory.

## Usage

``` r
read_csv_files_from_dir(dir_path = ".", col_types = NULL, .id = NULL)
```

## Arguments

- dir_path:

  Path to the directory containing the CSV files.

- col_types:

  One of `NULL`, a
  [`cols()`](https://readr.tidyverse.org/reference/cols.html)
  specification, or a string. See `vignette("readr")` for more details.

  If `NULL`, all column types will be inferred from `guess_max` rows of
  the input, interspersed throughout the file. This is convenient (and
  fast), but not robust. If the guessed types are wrong, you'll need to
  increase `guess_max` or supply the correct types yourself.

  Column specifications created by
  [`list()`](https://rdrr.io/r/base/list.html) or
  [`cols()`](https://readr.tidyverse.org/reference/cols.html) must
  contain one column specification for each column. If you only want to
  read a subset of the columns, use
  [`cols_only()`](https://readr.tidyverse.org/reference/cols.html).

  Alternatively, you can use a compact string representation where each
  character represents one column:

  - c = character

  - i = integer

  - n = number

  - d = double

  - l = logical

  - f = factor

  - D = date

  - T = date time

  - t = time

  - ? = guess

  - \_ or - = skip

  By default, reading a file without a column specification will print a
  message showing what `readr` guessed they were. To remove this
  message, set `show_col_types = FALSE` or set
  `options(readr.show_col_types = FALSE)`.

- .id:

  The name of a column in which to store the file path. This is useful
  when reading multiple input files and there is data in the file paths,
  such as the data collection date. If `NULL` (the default) no extra
  column is created.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html).
If there is any column type mismatch during data frames row binding, an
error will occur. This is because R cannot combine columns of different
types. For example, you cannot combine a column of integers with a
column of characters.

## See also

[`read_excel_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_files_from_dir.md)
which reads Excel workbooks data from a directory.

## Examples

``` r
directory <- system.file("csvfolder",  package = "bulkreadr")

read_csv_files_from_dir(dir_path = directory, .id = "cut")
#> # A tibble: 260 × 10
#>    cut                   carat color clarity depth table price     x     y     z
#>    <chr>                 <dbl> <chr> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1 /home/runner/work/_t…  2    I     SI1      65.9    60 13764  7.8   7.73  5.12
#>  2 /home/runner/work/_t…  0.7  H     SI1      65.2    58  2048  5.49  5.55  3.6 
#>  3 /home/runner/work/_t…  1.51 E     SI1      58.4    70 11102  7.55  7.39  4.36
#>  4 /home/runner/work/_t…  0.7  D     SI2      65.5    57  1806  5.56  5.43  3.6 
#>  5 /home/runner/work/_t…  0.35 F     VVS1     54.6    59  1011  4.85  4.79  2.63
#>  6 /home/runner/work/_t…  0.5  E     VS2      64.9    56  1397  5.01  4.95  3.23
#>  7 /home/runner/work/_t…  1    E     SI1      65.1    61  4435  6.15  6.08  3.98
#>  8 /home/runner/work/_t…  1.09 J     VS2      64.6    58  3443  6.48  6.41  4.16
#>  9 /home/runner/work/_t…  0.98 H     SI2      67.9    60  2777  6.05  5.97  4.08
#> 10 /home/runner/work/_t…  0.7  F     SI1      65.3    54  1974  5.58  5.54  3.63
#> # ℹ 250 more rows

# Column types mismatch error --------------------------------------
# If the `read_csv_files_from_dir()` function complains about a data type mismatch,
# then set the `col_types` argument to `"c"`.
# This will make all the column types in the resulting dataframe be characters.

```
