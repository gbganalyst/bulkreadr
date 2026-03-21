# Importing & exporting bulk data

## Introduction

Welcome to **bulkreadr**! This article demonstrates how to efficiently
import and export large-scale tabular data:

- **Excel workbooks**
  - [`read_excel_workbook()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_workbook.md)
    pulls in every sheet from a single `.xlsx` or `.xls` file and
    returns a combined data frame.  
  - [`read_excel_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_files_from_dir.md)
    searches a directory for all Excel files, reads each one, and
    appends their contents into one data frame.  
  - [`write_excel_sheets_to_csv()`](https://gbganalyst.github.io/bulkreadr/reference/write_excel_sheets_to_csv.md)
    takes any Excel workbook and writes each sheet out as its own CSV
    file in a folder you specify.
- **Google Sheets**
  - [`read_gsheets()`](https://gbganalyst.github.io/bulkreadr/reference/read_gsheets.md)
    retrieves one or more sheets from a Google Sheets document (by URL
    or sheet ID) and merges them into a single data frame.
- **CSV files**
  - [`read_csv_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_csv_files_from_dir.md)
    loads every `.csv` file in a given directory and binds them into one
    data frame, preserving the file order.

By the end of this article, you’ll have a reproducible pipeline for
moving data between Excel, Google Sheets, and CSV formats.

## Note on Example Data

> All examples below use sample files shipped with `bulkreadr` package
> (via [`system.file()`](https://rdrr.io/r/base/system.file.html)). To
> apply these in your own project, just replace those paths with the
> paths to your local files or folders.

``` r
library(bulkreadr)
library(dplyr)
```

## `read_excel_workbook()`

The
[`read_excel_workbook()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_workbook.md)
function reads **all sheets** from a single Excel workbook and combines
them into one tidy data frame. This is ideal when you have multiple
related sheets in one file and want to work with them as a single table.

``` r
# Path to the Excel workbook bundled with the package
path <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr")

# Import every sheet into one data frame
df_all_sheets <- read_excel_workbook(path = path)

# View the result
df_all_sheets
#> # A tibble: 260 × 9
#>   carat color clarity depth table price     x     y     z
#>   <dbl> <chr> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  2    I     SI1      65.9    60 13764  7.8   7.73  5.12
#> 2  0.7  H     SI1      65.2    58  2048  5.49  5.55  3.6 
#> 3  1.51 E     SI1      58.4    70 11102  7.55  7.39  4.36
#> 4  0.7  D     SI2      65.5    57  1806  5.56  5.43  3.6 
#> 5  0.35 F     VVS1     54.6    59  1011  4.85  4.79  2.63
#> # ℹ 255 more rows
```

## `read_excel_files_from_dir()`

[`read_excel_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_files_from_dir.md)
scans a directory for all `.xlsx`/`.xls` files, reads each workbook, and
appends their sheets into a single data frame. Great for
batch-processing multiple files at once.

``` r
# Directory containing multiple Excel workbooks
directory <- system.file("xlsxfolder", package = "bulkreadr")

# Read and combine all workbooks in that folder
combined_excel <- read_excel_files_from_dir(dir_path = directory)

# View the result
glimpse(combined_excel)
#> Rows: 260
#> Columns: 10
#> $ cut     <chr> "Fair", "Fair", "Fair", "Fair", "Fair", "Fair", "Fair", "Fair"…
#> $ carat   <dbl> 2.00, 0.70, 1.51, 0.70, 0.35, 0.50, 1.00, 1.09, 0.98, 0.70, 2.…
#> $ color   <chr> "I", "H", "E", "D", "F", "E", "E", "J", "H", "F", "F", "E", "F…
#> $ clarity <chr> "SI1", "SI1", "SI1", "SI2", "VVS1", "VS2", "SI1", "VS2", "SI2"…
#> $ depth   <dbl> 65.9, 65.2, 58.4, 65.5, 54.6, 64.9, 65.1, 64.6, 67.9, 65.3, 66…
#> $ table   <dbl> 60, 58, 70, 57, 59, 56, 61, 58, 60, 54, 57, 62, 59, 68, 53, 58…
#> $ price   <dbl> 13764, 2048, 11102, 1806, 1011, 1397, 4435, 3443, 2777, 1974, …
#> $ x       <dbl> 7.80, 5.49, 7.55, 5.56, 4.85, 5.01, 6.15, 6.48, 6.05, 5.58, 7.…
#> $ y       <dbl> 7.73, 5.55, 7.39, 5.43, 4.79, 4.95, 6.08, 6.41, 5.97, 5.54, 7.…
#> $ z       <dbl> 5.12, 3.60, 4.36, 3.60, 2.63, 3.23, 3.98, 4.16, 4.08, 3.63, 5.…
```

## `write_excel_sheets_to_csv()`

With a single call to
[`write_excel_sheets_to_csv()`](https://gbganalyst.github.io/bulkreadr/reference/write_excel_sheets_to_csv.md),
you can convert every worksheet in an Excel file into a separate CSV
file in a directory of your choice. The function reads each sheet from
the Excel file and writes it out as individual CSVs:

``` r
# Excel file with multiple sheets
excel_file <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr")

# Specify an output directory (will be created if it doesn't exist)
output_dir <- file.path(tempdir())

# Export each sheet to its own CSV and capture the file paths
write_excel_sheets_to_csv(
  excel_path = excel_file,
  output_dir = output_dir
)
#> Exported CSV file paths are:
#>   /tmp/Rtmp9kqQvv/Fair.csv
#>   /tmp/Rtmp9kqQvv/Good.csv
#>   /tmp/Rtmp9kqQvv/Very Good.csv
#>   /tmp/Rtmp9kqQvv/Premium.csv
#>   /tmp/Rtmp9kqQvv/Ideal.csv
```

This function ensures consistent file naming, automates the export
process, and supports reproducible reporting workflows.

## `read_csv_files_from_dir()`

[`read_csv_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_csv_files_from_dir.md)
reads every `.csv` in a specified directory and binds them row-wise into
one data frame, following the directory’s file order.

``` r
# Directory with CSV files
directory <- system.file("csvfolder", package = "bulkreadr")

# Import all CSVs at once
all_csv_data <- read_csv_files_from_dir(dir_path = directory)

# View the result
all_csv_data
#> # A tibble: 260 × 10
#>   cut   carat color clarity depth table price     x     y     z
#>   <chr> <dbl> <chr> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 Fair   2    I     SI1      65.9    60 13764  7.8   7.73  5.12
#> 2 Fair   0.7  H     SI1      65.2    58  2048  5.49  5.55  3.6 
#> 3 Fair   1.51 E     SI1      58.4    70 11102  7.55  7.39  4.36
#> 4 Fair   0.7  D     SI2      65.5    57  1806  5.56  5.43  3.6 
#> 5 Fair   0.35 F     VVS1     54.6    59  1011  4.85  4.79  2.63
#> # ℹ 255 more rows
```

## `read_gsheets()`

For Google Sheets data,
[`read_gsheets()`](https://gbganalyst.github.io/bulkreadr/reference/read_gsheets.md)
lets you pull data from one or more sheets in a spreadsheet and combines
them into a single data frame.

``` r
# De-authenticate since we're accessing a public or already-shared sheet
googlesheets4::gs4_deauth()

# Google Sheet ID (or full URL)
sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"

# Read and merge all sheets
gsheet_data <- read_gsheets(ss = sheet_id)

# Inspect the imported data
glimpse(gsheet_data)
#> Rows: 260
#> Columns: 9
#> $ carat   <dbl> 2.00, 0.70, 1.51, 0.70, 0.35, 0.50, 1.00, 1.09, 0.98, 0.70, 2.…
#> $ color   <chr> "I", "H", "E", "D", "F", "E", "E", "J", "H", "F", "F", "E", "F…
#> $ clarity <chr> "SI1", "SI1", "SI1", "SI2", "VVS1", "VS2", "SI1", "VS2", "SI2"…
#> $ depth   <dbl> 65.9, 65.2, 58.4, 65.5, 54.6, 64.9, 65.1, 64.6, 67.9, 65.3, 66…
#> $ table   <dbl> 60, 58, 70, 57, 59, 56, 61, 58, 60, 54, 57, 62, 59, 68, 53, 58…
#> $ price   <dbl> 13764, 2048, 11102, 1806, 1011, 1397, 4435, 3443, 2777, 1974, …
#> $ x       <dbl> 7.80, 5.49, 7.55, 5.56, 4.85, 5.01, 6.15, 6.48, 6.05, 5.58, 7.…
#> $ y       <dbl> 7.73, 5.55, 7.39, 5.43, 4.79, 4.95, 6.08, 6.41, 5.97, 5.54, 7.…
#> $ z       <dbl> 5.12, 3.60, 4.36, 3.60, 2.63, 3.23, 3.98, 4.16, 4.08, 3.63, 5.…
```

------------------------------------------------------------------------

With these functions in `bulkreadr`, you can effortlessly import and
export bulk data, leaving you more time for analysis and insight.
