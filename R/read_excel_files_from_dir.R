#' Read Excel Workbooks Data from a Directory
#'
#' @description
#' `read_excel_files_from_dir()` reads all Excel workbooks in the `"~/data"` directory and returns an appended dataframe.
#'
#' @param dir_path Path to the directory containing the `xls`/`xlsx` files.
#' @inheritParams readxl::read_xlsx
#' @inheritParams dplyr::bind_rows
#' @return
#' A [tibble][tibble::tibble-package]. If there is any column type mismatch during data frames row binding, an error will occur. This is because R cannot combine columns of different types. For example, you cannot combine a column of integers with a column of characters.
#'
#' @seealso
#'
#' [read_excel_workbook()] which imports data from multiple sheets of an Excel workbook
#'
#'
#' @export
#'
#' @examples
#' \donttest{
#' directory <- system.file("xlsxfolder",  package = "bulkreadr")
#'
#' read_excel_files_from_dir(dir_path = directory, .id = "cut")
#'}

#' # Column types mismatch error --------------------------------------
#'# If the `read_excel_files_from_dir()` function complains about a data type mismatch,
#'# then set the `col_types` argument to `"text"`.
#'# This will make all the column types in the resulting dataframe be characters.
#'
#'

read_excel_files_from_dir <- function(dir_path, col_types = NULL, .id = NULL) {

  dir_path = check_file(dir_path)

  fs::dir_ls(path = dir_path, regexp = "xlsx") %>%
    purrr::map_df(read_excel_workbook, col_types = col_types, .id = .id)
}

