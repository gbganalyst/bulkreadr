# Package index

## Spreadsheets

Functions for importing and exporting bulk data in spreadsheets

- [`read_excel_workbook()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_workbook.md)
  : Import data from multiple sheets of an Excel workbook
- [`read_excel_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_files_from_dir.md)
  : Read Excel Workbooks data from a directory
- [`write_excel_sheets_to_csv()`](https://gbganalyst.github.io/bulkreadr/reference/write_excel_sheets_to_csv.md)
  : Export Excel Sheets to CSV Files

## Google Sheets

A function for reading and appending data across multiple sheets within
Google Sheets.

- [`read_gsheets()`](https://gbganalyst.github.io/bulkreadr/reference/read_gsheets.md)
  : Import data from multiple sheets in Google Sheets

## Flat files

A function designed to read and consolidate multiple CSV files within a
specified directory.

- [`read_csv_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_csv_files_from_dir.md)
  : Reads all CSV files from a directory

## Labelled data

Functions that read labelled data and make it easier to work with.

- [`read_spss_data()`](https://gbganalyst.github.io/bulkreadr/reference/read_spss_data.md)
  : Read SPSS data file
- [`read_stata_data()`](https://gbganalyst.github.io/bulkreadr/reference/read_stata_data.md)
  : Read Stata data file

## Data dictionary

Functions that provide descriptions of the labelled data

- [`generate_dictionary()`](https://gbganalyst.github.io/bulkreadr/reference/generate_dictionary.md)
  : Create a data dictionary from labelled data
- [`look_for()`](https://gbganalyst.github.io/bulkreadr/reference/look_for.md)
  : Look for keywords variable names and descriptions in labelled data

## Other functions in bulkreadr

Unlike other functions in bulkreadr, these functions operate on
individual vectors, not on data frames, with the exceptions of
[`inspect_na()`](https://gbganalyst.github.io/bulkreadr/reference/inspect_na.md)
and
[`fill_missing_values()`](https://gbganalyst.github.io/bulkreadr/reference/fill_missing_values.md).

- [`pull_out`](https://gbganalyst.github.io/bulkreadr/reference/aliases.md)
  : Extract or replace parts of an object
- [`convert_to_date()`](https://gbganalyst.github.io/bulkreadr/reference/convert_to_date.md)
  : User friendly date parsing function
- [`fill_missing_values()`](https://gbganalyst.github.io/bulkreadr/reference/fill_missing_values.md)
  : Fill missing values in a data frame
- [`inspect_na()`](https://gbganalyst.github.io/bulkreadr/reference/inspect_na.md)
  : Summarize missingness in data frame columns
