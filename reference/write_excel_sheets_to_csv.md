# Export Excel Sheets to CSV Files

This function reads an Excel workbook, converts each sheet into a data
frame, and writes each sheet to a CSV file in the specified output
directory.

## Usage

``` r
write_excel_sheets_to_csv(excel_path, output_dir = "data/", na = "")
```

## Arguments

- excel_path:

  A character string specifying the path to the Excel file.

- output_dir:

  A character string specifying the directory where CSV files will be
  saved. Defaults to "data/".

- na:

  A character string to use for missing values in the CSV. Defaults to
  `""` (blank cells).

## Value

A list of file paths corresponding to the exported CSV files.

## Examples

``` r
# Path to the example Excel file shipped with the package
excel_file <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr")

# Export each sheet to its own CSV in a temporary directory
output_dir <- tempdir()
write_excel_sheets_to_csv(excel_file, output_dir)
#> Exported CSV file paths are:
#>   /tmp/RtmpzXtE1P/Fair.csv
#>   /tmp/RtmpzXtE1P/Good.csv
#>   /tmp/RtmpzXtE1P/Very Good.csv
#>   /tmp/RtmpzXtE1P/Premium.csv
#>   /tmp/RtmpzXtE1P/Ideal.csv
```
