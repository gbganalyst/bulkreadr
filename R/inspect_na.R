#' Summarize missingness in data frame columns
#'
#' @description
#' `inspect_na()` summarizes the rate of missingness in each column of a data frame. For a grouped data frame, the rate of missingness is summarized separately for each group.
#'
#' @details
#' The tibble returned contains the columns:
#' - **col_name**, a character vector containing column names of df1.
#'
#' - **cnt**, an integer vector containing the number of missing values by column.
#'
#' - **pcnt**, the percentage of records in each columns that is missing.
#'
#'
#' @param df A data frame
#'
#' @return
#' A tibble summarizing the count and percentage of columnwise missingness for a data frame.
#'
#' @export
#'
#' @examples
#'
#' library(dplyr)
#'
#' # dataframe summary
#'
#' inspect_na(airquality)
#'
#' # grouped dataframe summary
#'
#' airquality %>%
#' group_by(Month) %>%
#'  inspect_na()
#'
inspect_na <- function(df) {
  inspectdf::inspect_na(df)
}

