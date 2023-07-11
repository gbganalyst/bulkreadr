#' Read Excel Workbooks Data from a Directory
#'
#' @description
#' `read_excel_files_in_folder()` reads all Excel workbooks in the `"~/data"` directory and returns an appended dataframe.
#'
#' @param folder_path Path to the directory containing the xls/xlsx files.
#' @inheritParams readxl::read_xlsx
#' @inheritParams dplyr::bind_rows
#' @return
#' A [tibble][tibble::tibble-package].
#'
#' @seealso

#' [read_excel_workbook()] which imports data from multiple sheets of an Excel workbook
#'

#'
#' @export
#'
#' @examples
#' \donttest{
#' directory <- system.file("xlsxfolder",  package = "bulkreadr")
#'
#' read_excel_files_in_folder(folder_path = directory, .id = "cut")
#'}

#' # Column types mismatch error --------------------------------------
#'# If the `read_excel_files_in_folder()` function complains about a data type mismatch,
#'# then set the `col_types` argument to `"text"`.
#'# This will make all the column types in the resulting dataframe be characters.
#'
#'

read_excel_files_in_folder <- function(folder_path, col_types = NULL, .id = NULL) {
  fs::dir_ls(path = folder_path, regexp = "xlsx") %>%
    purrr::map_df(read_excel_workbook, col_types = col_types, .id = .id)
}



