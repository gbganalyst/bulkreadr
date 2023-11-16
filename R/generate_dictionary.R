#' Create a data dictionary from labelled data
#'
#' @description
#' `generate_dictionary()` creates a data dictionary from a specified data frame.
#' This function is particularly useful for understanding and documenting the
#' structure of your dataset, similar to data dictionaries in Stata or SPSS.
#'
#' @details
#' The function returns a tibble (a modern version of R's data frame) with the following columns:
#'
#' - **position**: An integer vector indicating the column position in the data frame.
#'
#' - **variable**: A character vector containing the names of the variables (columns).
#'
#' - **description**: A character vector with a human-readable description of each variable.
#'
#' - **column type**: A character vector specifying the data type (e.g., numeric, character) of each variable.
#'
#' - **missing**: An integer vector indicating the count of missing values for each variable.
#'
#' - **levels**: A list vector containing the levels for categorical variables, if applicable.
#'
#'
#' @inheritParams labelled::generate_dictionary
#'
#' @return
#' A tibble representing the data dictionary. Each row corresponds to a variable in the original
#' data frame, providing detailed information about the variable's characteristics.
#'
#' @export
#'
#' @examples
#'
#' # Creating a data dictionary from an SPSS file
#'
#' file_path <- system.file("extdata", "Wages.sav", package = "bulkreadr")
#'
#' wage_data <- read_spss_data(file = file_path)
#'
#' generate_dictionary(wage_data)
#'
#'
generate_dictionary <- function(data) {
  if (missing(data)) {
    stop("argument 'data' is missing, with no default")
  } else {
    output <- labelled::generate_dictionary(data)

    output %>%
      rename(
        position = "pos",
        description = "label",
        `column type` = "col_type"
      ) %>%
      select(-"value_labels")
  }
}
