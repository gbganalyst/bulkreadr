# Import data from multiple sheets in Google Sheets

The `read_gsheets()` function imports data from multiple sheets in a
Google Sheets spreadsheet and appends the resulting dataframes from each
sheet together to create a single dataframe. This function is a powerful
tool for data analysis, as it allows you to easily combine data from
multiple sheets into a single dataset.

## Usage

``` r
read_gsheets(ss, col_types = NULL, .id = NULL)
```

## Arguments

- ss:

  Something that identifies a Google Sheet:

  - its file id as a string or
    [`drive_id`](https://googledrive.tidyverse.org/reference/drive_id.html)

  - a URL from which we can recover the id

  - a one-row
    [`dribble`](https://googledrive.tidyverse.org/reference/dribble.html),
    which is how googledrive represents Drive files

  - an instance of `googlesheets4_spreadsheet`, which is what
    [`gs4_get()`](https://googlesheets4.tidyverse.org/reference/gs4_get.html)
    returns

  Processed through
  [`as_sheets_id()`](https://googlesheets4.tidyverse.org/reference/sheets_id.html).

- col_types:

  Column types. Either `NULL` to guess all from the spreadsheet or a
  string of readr-style shortcodes, with one character or code per
  column. If exactly one `col_type` is specified, it is recycled. See
  Column Specification for more.

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

[`googlesheets4::read_sheet()`](https://googlesheets4.tidyverse.org/reference/range_read.html)
which reads a Google (spread)Sheet into a data frame.

## Examples

``` r
if (FALSE) { # googlesheets4::gs4_has_token()

sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"

read_gsheets(ss = sheet_id, .id = "sheet.name")

# Column types mismatch error --------------------------------------
# If the `read_gsheets()` function complains about a data type mismatch,
# then set the `col_types` argument to `"c"`.
# This will make all the column types in the resulting dataframe be characters.

# For example,
}
if (FALSE) { # googlesheets4::gs4_has_token()
sheet_id <- "1rrjKAV05POre9lDVtHtZePTa8VROf1onVO47cHnhrTU"

try(read_gsheets(ss = sheet_id)) # error, column types mismatch

read_gsheets(ss = sheet_id, col_types = "c")
}
```
