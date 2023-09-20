#' Read Stata data File
#'
#` read_stata_data()` reads Stata data file (`.dta`) into an R data frame, converting labeled variables into factors.

#' @param file The path to the Stata data file.
#' @param label Logical indicating whether to use variable labels as column names (default is FALSE).
#'
#' @return
#'
#' A data frame containing the Stata data, with labeled variables converted to factors.
#'
#' @examples
#' # Read Stata data file without converting variable labels as column names
#'
#' file_path <- system.file("extdata", "Wages.dta", package = "bulkreadr")
#'
#' data <- read_stata_data(file = file_path)
#'
#' data
#'
#' # Read Stata data file and convert variable labels as column names
#'
#' data <- read_stata_data(file = file_path, label = TRUE)
#'
#' data
#'
#' @export
#' @seealso [read_spss_data()] which reads SPSS data file and converts labelled variables into factors.
#'
#'
read_stata_data <- function(file, label = FALSE) {

  file = check_file(file)

  if (label) {
    data <- read_dta(file = file)
    data %>%
      mutate(across(haven::is.labelled, haven::as_factor)) %>%
      sjlabelled::label_to_colnames()
  } else {
    data <- read_dta(file = file)
    data %>%
      mutate(across(haven::is.labelled, haven::as_factor))
  }
}

