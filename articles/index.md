# Articles

### Get started

- [Importing & exporting bulk
  data](https://gbganalyst.github.io/bulkreadr/articles/intro-to-bulkreadr.md):

  This article is your quick-start guide to the core import/export
  functions in `bulkreadr`. You’ll learn how to bring in data from
  multi-sheet Excel workbooks
  ([`read_excel_workbook()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_workbook.md),
  [`read_excel_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_excel_files_from_dir.md)),
  Google Sheets
  ([`read_gsheets()`](https://gbganalyst.github.io/bulkreadr/reference/read_gsheets.md)),
  and directories of CSV files
  ([`read_csv_files_from_dir()`](https://gbganalyst.github.io/bulkreadr/reference/read_csv_files_from_dir.md)).
  Then, you’ll see how to automate exporting every sheet of an Excel
  file to individual CSVs with
  [`write_excel_sheets_to_csv()`](https://gbganalyst.github.io/bulkreadr/reference/write_excel_sheets_to_csv.md).

- [Introduction to labelled
  data](https://gbganalyst.github.io/bulkreadr/articles/labelled-data.md):

  The R ecosystem, through packages like `foreign` and `haven`,
  facilitates the importation of labelled data from software like SPSS
  and Stata, ensuring a smooth transition into R. This vignette
  introduces you to other functions in bulkreadr, such as
  [`read_spss_data()`](https://gbganalyst.github.io/bulkreadr/reference/read_spss_data.md),
  which extends this functionality by leveraging `haven` to streamline
  the process further.

- [Other functions in
  bulkreadr](https://gbganalyst.github.io/bulkreadr/articles/other-functions.md):

  The `bulkreadr` package includes specialized functions beyond bulk
  data reading, aimed at enhancing data analysis efficiency. These
  functions are designed to operate on individual vectors, except for
  [`inspect_na()`](https://gbganalyst.github.io/bulkreadr/reference/inspect_na.md)
  and
  [`fill_missing_values()`](https://gbganalyst.github.io/bulkreadr/reference/fill_missing_values.md),
  which work on data frames.
