# bulkreadr

> The Ultimate Tool for Reading Data in Bulk

## About the package

`bulkreadr` is an R package designed to simplify and streamline the
process of reading and processing large volumes of data. With a
collection of functions tailored for bulk data operations, the package
allows users to efficiently read multiple sheets from Microsoft
Excel/Google Sheets workbooks and multiple CSV files from a directory.
It returns the data as organized data frames, making it convenient for
further analysis and manipulation.

Whether dealing with extensive data sets or batch processing tasks,
“bulkreadr” empowers users to effortlessly handle data in bulk, saving
time and effort in data preparation workflows.

Additionally, the package seamlessly works with labelled data from SPSS
and Stata. For a quick video tutorial, I gave a talk at the
International Association of Statistical Computing webinar. The recorded
session is available
[here](https://isi-web.org/webinar/iasc-bulkreadr-ultimate-tool-reading-data-bulk)
and the webinar resources
[here](https://github.com/gbganalyst/bulkreadr-webinar).

## The Concept Map

![Concept map of the bulkreadr package showing three data categories and
related functions. Under Spreadsheets, Excel links to
read_excel_workbook() and read_excel_files_from_dir(), and Google Sheets
links to read_gsheets(). Under Flat files, CSV links to
read_csv_files_from_dir(). Under Labelled data, SPSS and Stata link to
read_spss_data() and read_stata_data(), which connect to
generate_dictionary() and look_for(). The map also lists other bulkreadr
functions: pull_out(), convert_to_date(), fill_missing_values(), and
inspect_na().](reference/figures/concept-map.png)

## Installation

You can install `bulkreadr` package from
[CRAN](https://cran.r-project.org/) with:

``` r
install.packages("bulkreadr")
```

or the development version from [GitHub](https://github.com/) with

``` r
if(!require("devtools")){
 install.packages("devtools")
}

devtools::install_github("gbganalyst/bulkreadr")
```

## Usage

Now that you have installed `bulkreadr` package, you can simply load it
by using:

``` r
library(bulkreadr)
```

To get started with `bulkreadr`, read the
[docs](https://gbganalyst.github.io/bulkreadr/articles/index.html).

## Context

bulkreadr is designed to integrate with and augment the capabilities of
established packages such as `readxl`, `readr`, and `googlesheets4`,
offering enhanced functionality for reading bulk data within the R
programming environment.

- [readxl](https://readxl.tidyverse.org) is the tidyverse package for
  reading Excel files (xls or xlsx) into an R data frame.

- [readr](https://readr.tidyverse.org) is the tidyverse package for
  reading delimited files (e.g., csv or tsv) into an R data frame.

- [googlesheets4](https://cran.r-project.org/package=googlesheets) is
  the package to interact with Google Sheets through the Sheets API v4
  <https://developers.google.com/sheets/api>.
