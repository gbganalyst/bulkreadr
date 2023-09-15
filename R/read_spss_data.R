#' Read SPSS data File
#'
#' `read_spss_data()` is designed to seamlessly import data from an SPSS data (`.sav` or  `.zsav`) files. It converts labelled variables into factors, a crucial step that enhances the ease of data manipulation and analysis within the R programming environment.
#'
#' @param file The path to the SPSS data file.
#' @param label Logical indicating whether to use variable labels as column names (default is FALSE).
#'
#' @return
#'
#' A tibble containing the data from the SPSS file.
#'
#' @examples
#' # Read an SPSS data file without converting variable labels as column names
#'
#' file_path <- system.file("extdata", "Wages.sav", package = "bulkreadr")
#'
#' data <- read_spss_data(file = file_path)
#'
#' # Read an SPSS data file and convert variable labels as column names
#'
#' data <- read_spss_data(file = file_path, label = TRUE)
#'
#' @export
#' @seealso [read_sav()] which reads spss data file without converting labelled variables into factors.
#'
#'
read_spss_data <- function(file, label = FALSE) {
  if (label) {
    data <- read_sav(file = file)
    data %>%
      mutate(across(haven::is.labelled, haven::as_factor)) %>%
      sjlabelled::label_to_colnames()
  } else {
    data <- read_sav(file = file)
    data %>%
      mutate(across(haven::is.labelled, haven::as_factor))
  }
}



