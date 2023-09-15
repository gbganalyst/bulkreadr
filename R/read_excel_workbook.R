#' Import data from multiple sheets of an Excel workbook
#'
#' @description
#' `read_excel_workbook()` reads all the data from the sheets of an Excel workbook and return an appended dataframe.
#'
#' @inheritParams readxl::read_xlsx
#' @inheritParams dplyr::bind_rows
#' @return
#' A [tibble][tibble::tibble-package]. If there is any column type mismatch during data frames row binding, an error will occur. This is because R cannot combine columns of different types. For example, you cannot combine a column of integers with a column of characters.
#'
#' @seealso

#' [read_excel()], which reads a Sheet of an Excel file into a data frame, and [read_gsheets()], which imports data from multiple sheets in a Google Sheets.
#' @export
#'
#' @examples
#'
#' path <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr", mustWork = TRUE)
#'
#' read_excel_workbook(path = path, .id = "Year")
#'
#'
#' # Column types mismatch error --------------------------------------
#'# If the `read_excel_workbook()` function complains about a data type mismatch,
#'# then set the `col_types` argument to `"text"`.
#'# This will make all the column types in the resulting DataFrame be characters.
#'

read_excel_workbook <- function(path, col_types = NULL, .id = NULL) {

  path <- check_file(path)

  path %>%
    readxl::excel_sheets() %>%
    purrr::set_names() %>%
    purrr::map_df(read_xlsx, path = path, col_types = col_types, .id = .id)
}




