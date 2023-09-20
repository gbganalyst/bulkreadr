#' Fill missing values in a dataframe
#'
#' `fill_missing_values()` is an efficient function that addresses missing values in a dataframe. It uses imputation by function, also known as column-based imputation, to fill numeric variables with the mean or median, and non-numeric variables with the mode. This approach ensures accurate and consistent replacements derived from individual columns, resulting in a complete and reliable dataset for improved analysis and decision-making.
#'
#' @param df The input dataframe to be processed.
#' @param use_mean Logical. If `TRUE`, missing values in numeric columns will be replaced with the mean.
#'  If `FALSE`, missing values in numeric columns will be replaced with the median.
#'
#' @return A dataframe with missing values filled.
#' @export
#' @examples
#'
#' library(dplyr)
#'
#' # Assuming 'df' is the dataframe you want to process
#'
#' df <- tibble::tibble(
#' Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
#' Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
#' Petal_Width = c(NA, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
#' Species = c("setosa", NA, "versicolor", "setosa",
#'            NA, "virginica", "setosa")
#' )
#'
#' # Using mean to fill missing values for numeric variables
#'
#' result_df_mean <- fill_missing_values(df, use_mean = TRUE)
#'
#' result_df_mean
#'
#' # Using median to fill missing values for numeric variables
#'
#' result_df_median <- fill_missing_values(df, use_mean = FALSE)
#'
#' result_df_median
#'
#' # Impute missing values (NAs) in a grouped data frame
#' # You can do that by using the following:
#'
#' sample_iris <- tibble::tibble(
#' Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
#' Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
#' Petal_Width = c(0.3, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
#' Species = c("setosa", "setosa", "versicolor", "setosa",
#'            "virginica", "virginica", "setosa")
#' )
#'
#' sample_iris %>%
#' group_by(Species) %>%
#' group_split() %>%
#' map_df(fill_missing_values)
#'
#'
fill_missing_values <- function(df, use_mean = TRUE) {
  if (missing(df)) {
    stop("argument 'df' is missing, with no default")
  } else {
    # Loop over each column in the dataframe
    for (col in names(df)) {
      if (is.numeric(df[[col]])) { # Check if column is numeric
        # Fill missing values with mean or median based on the flag 'use_mean'
        if (use_mean) {
          df[[col]][is.na(df[[col]])] <- mean(df[[col]], na.rm = TRUE)
        } else {
          df[[col]][is.na(df[[col]])] <- median(df[[col]], na.rm = TRUE)
        }
      } else {
        # Fill missing values with mode
        df[[col]][is.na(df[[col]])] <- names(which.max(table(df[[col]])))
      }
    }
    return(df)
  }
}

