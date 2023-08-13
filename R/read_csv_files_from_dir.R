#' Reads all CSV files from a directory
#'
#' @description
#' `read_csv_files_from_dir` reads all csv files from the `"~/data"` directory and returns an appended dataframe. The resulting dataframe will be in the same order as the CSV files in the directory.
#'
#' @param dir_path Path to the directory containing the CSV files.
#' @inheritParams readr::read_csv
#' @inheritParams dplyr::bind_rows
#'
#' @return
#' A [tibble][tibble::tibble-package]. If there is any column type mismatch during data frames row binding, an error will occur. This is because R cannot combine columns of different types. For example, you cannot combine a column of integers with a column of characters.
#'
#' @seealso
#' [read_excel_files_from_dir()] which reads Excel workbooks data from a directory.
#'
#' @export
#'
#' @examples
#'
#' directory <- system.file("csvfolder",  package = "bulkreadr")
#'
#' read_csv_files_from_dir(dir_path = directory, .id = "cut")
#'
#' # Column types mismatch error --------------------------------------
#'# If the `read_csv_files_from_dir()` function complains about a data type mismatch,
#'# then set the `col_types` argument to `"c"`.
#'# This will make all the column types in the resulting dataframe be characters.
#'
#'

read_csv_files_from_dir <- function(dir_path = ".", col_types = NULL, .id = NULL) {

  path <- check_file(dir_path)

  dir_ls(path = path, regexp = "csv") %>%
    map_df(read_csv, col_types = col_types, .id = .id, show_col_types = FALSE)
}




