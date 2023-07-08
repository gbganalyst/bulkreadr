#' Import data from multiple sheets in a Google Sheets
#'
#' @description
#' `read_gsheets()` imports data from multiple sheets in a Google Sheets spreadsheet and append the resulting dataframes from each sheet together to create a single dataframe.
#'
#' @inheritParams dplyr::bind_rows
#' @inheritParams googlesheets4::read_sheet
#' @return
#' A [tibble][tibble::tibble-package]. If there are parsing problems, a warning will alert you.
#' @seealso
#' [read_sheet()] which reads a Google (spread)Sheet into a data frame.
#'
#' @export
#' @examplesIf googlesheets4::gs4_has_token()
#' sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"
#'
#' read_gsheets(ss = sheet_id, .id = "sheet.name")
#'
#' # Column types mismatch error --------------------------------------
#'# If the `read_gsheets()` function complains about a data type mismatch,
#'# then set the `col_type` argument to `"c"`.
#'# This will make all the column types in the resulting DataFrame be characters.
#'
#'# For example,
#' @examplesIf googlesheets4::gs4_has_token()
#' sheet_id <- "1rrjKAV05POre9lDVtHtZePTa8VROf1onVO47cHnhrTU"
#'
#' read_gsheets(ss = sheet_id) # error, column types mismatch
#'
#' read_gsheets(ss = sheet_id, col_types = "c")


#'
read_gsheets <- function(ss, col_types = NULL, .id = NULL) {
  ss %>%
    googlesheets4::sheet_names() %>%
    purrr::set_names() %>%
    purrr::map_df(read_sheet, ss = ss, col_types = col_types, .id = .id)
}
