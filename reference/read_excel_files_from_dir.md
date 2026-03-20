# Read Excel Workbooks data from a directory

`read_excel_files_from_dir()` reads all Excel workbooks in the
`"~/data"` directory and returns an appended dataframe.

## Usage

``` r
read_excel_files_from_dir(dir_path, col_types = NULL, .id = NULL)
```

## Arguments

- dir_path:

  Path to the directory containing the `xls`/`xlsx` files.

- col_types:

  Either `NULL` to guess all from the spreadsheet or a character vector
  containing one entry per column from these options: "skip", "guess",
  "logical", "numeric", "date", "text" or "list". If exactly one
  `col_type` is specified, it will be recycled. The content of a cell in
  a skipped column is never read and that column will not appear in the
  data frame output. A list cell loads a column as a list of length 1
  vectors, which are typed using the type guessing logic from
  `col_types = NULL`, but on a cell-by-cell basis.

- .id:

  The name of an optional identifier column. Provide a string to create
  an output column that identifies each input. The column will use names
  if available, otherwise it will use positions.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html).
If there is any column type mismatch during data frames row binding, an
error will occur. This is because R cannot combine columns of different
types. For example, you cannot combine a column of integers with a
column of characters.

## See also

[`read_excel_workbook()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_workbook.md)
which imports data from multiple sheets of an Excel workbook

## Examples

``` r
directory <- system.file("xlsxfolder",  package = "bulkreadr")

read_excel_files_from_dir(dir_path = directory, .id = "cut")
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
# If the `read_excel_files_from_dir()` function complains about a data type mismatch,
# then set the `col_types` argument to `"text"`.
# This will make all the column types in the resulting dataframe be characters.

```
