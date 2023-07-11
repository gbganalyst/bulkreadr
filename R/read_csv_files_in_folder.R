#' Reads all CSV files in a folder
#'
#' @description
#' `read_csv_files_in_folder()` reads all csv files in the `"~/data"` directory and returns an appended dataframe. The resulting dataframe will be in the same order as the CSV files in the folder.
#'
#' @param folder_path Path to the directory containing the CSV files.
#' @inheritParams readr::read_csv
#' @inheritParams dplyr::bind_rows
#'
#' @return
#' A [tibble][tibble::tibble-package].
#'
#' @seealso
#' [read_excel_files_in_folder()] which reads Excel workbooks data from a directory.
#'
#' @export
#'
#' @examples
#'
#' directory <- system.file("csvfolder",  package = "bulkreadr")
#'
#' read_csv_files_in_folder(folder_path = directory, .id = "cut")
#'
#' # Column types mismatch error --------------------------------------
#'# If the `read_csv_files_in_folder()` function complains about a data type mismatch,
#'# then set the `col_types` argument to `"c"`.
#'# This will make all the column types in the resulting dataframe be characters.
#'
#'

read_csv_files_in_folder <- function(folder_path = ".", col_types = NULL, .id = NULL) {
  dir_ls(path = folder_path, regexp = "csv") %>%
    map_df(read_csv, col_types = col_types, .id = .id, show_col_types = FALSE)
}



