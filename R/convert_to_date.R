#' User friendly date parsing function
#'
#' @description
#' `convert_to_date()` parses an input vector into POSIXct date object. It is also powerful to convert from excel date number like `42370` into date value like `2016-01-01`.
#'
#' @param date_num_char A character or numeric vector of dates
#' @inheritParams lubridate::ymd
#'
#' @return
#' a vector of class Date
#'
#' @export
#'
#' @examples
#'
#' ## ** heterogeneous dates **
#'
#' dates <- c(
#'   44869, "22.09.2022", NA, "02/27/92", "01-19-2022",
#'   "13-01-  2022", "2023", "2023-2", 41750.2, 41751.99,
#'   "11 07 2023", "2023-4"
#' )
#'
#' convert_to_date(dates)
#'
convert_to_date <- function(date_num_char, tz = "UTC") {
  if (missing(date_num_char)) {
    stop("argument 'date_num_char' is missing, with no default")
  } else {
    map_vec(date_num_char, to_date, tz) %>%
      lubridate::as_date() %>%
      suppressWarnings()
  }
}
