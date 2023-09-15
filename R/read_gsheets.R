#' Import data from multiple sheets in Google Sheets
#'
#' @description
#'
#' The `read_gsheets()` function imports data from multiple sheets in a Google Sheets spreadsheet and appends the resulting dataframes from each sheet together to create a single dataframe. This function is a powerful tool for data analysis, as it allows you to easily combine data from multiple sheets into a single dataset.
#'
#' @inheritParams dplyr::bind_rows
#' @inheritParams googlesheets4::read_sheet
#' @return
#' A [tibble][tibble::tibble-package]. If there is any column type mismatch during data frames row binding, an error will occur. This is because R cannot combine columns of different types. For example, you cannot combine a column of integers with a column of characters.
#'
#' @seealso
#' [read_sheet()] which reads a Google (spread)Sheet into a data frame.
#'
#' @export
#' @examplesIf googlesheets4::gs4_has_token()
#'
#' sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"
#'
#' read_gsheets(ss = sheet_id, .id = "sheet.name")
#'
#' # Column types mismatch error --------------------------------------
#'# If the `read_gsheets()` function complains about a data type mismatch,
#'# then set the `col_types` argument to `"c"`.
#'# This will make all the column types in the resulting dataframe be characters.
#'
#'# For example,
#' @examplesIf googlesheets4::gs4_has_token()
#' sheet_id <- "1rrjKAV05POre9lDVtHtZePTa8VROf1onVO47cHnhrTU"
#'
#' try(read_gsheets(ss = sheet_id)) # error, column types mismatch
#'
#' read_gsheets(ss = sheet_id, col_types = "c")
#'
#'
read_gsheets <- function(ss, col_types = NULL, .id = NULL) {
  if (missing(ss)) {
    stop("argument 'ss' is missing, with no default")
  }
  if (!has_internet()) {
    stop("No internet! Please check your internet connection")
  } else {
    ss %>%
      googlesheets4::sheet_names() %>%
      purrr::set_names() %>%
      purrr::map_df(read_sheet, ss = ss, col_types = col_types, .id = .id)
  }
}

