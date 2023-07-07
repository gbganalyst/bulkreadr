#' Import data from multiple sheets of an Excel workbook
#'
#' @description
#' This function will read all the data from the sheets of an Excel workbook and return an appended dataframe.
#'
#' @inheritParams readxl::read_xlsx
#' @inheritParams dplyr::bind_rows
#' @return
#' A [tibble][tibble::tibble-package].
#'
#' @seealso

#' [readxl::read_excel()], which reads a Sheet of an Excel file into a data frame, and [read_gsheets()], which imports data from multiple sheets in a Google Sheets spreadsheet.
#'
#' @export
#'
#' @examples
#' \donttest{
#' path <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr", mustWork = TRUE)
#'
#' read_excel_workbook(path = path, .id = "Year")
#'}

read_excel_workbook <- function(path, col_types = NULL, .id = NULL) {
  path %>%
    excel_sheets() %>%
    set_names() %>%
    map_df(read_xlsx, path = path, col_types = col_types, .id = .id)
}




