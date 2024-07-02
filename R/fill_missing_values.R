#' Fill missing values in a data frame
#'
#' `fill_missing_values()` is an efficient function that addresses missing
#' values in a data frame. It uses imputation by function, also known as
#' column-based imputation, to impute the missing values. For continuous
#' variables, it supports various methods of imputation, including minimum,
#' maximum, mean, median, harmonic mean, and geometric mean. For categorical
#' variables, missing values are replaced with the mode of the column. This
#' approach ensures accurate and consistent replacements derived from individual
#' columns, resulting in a complete and reliable dataset for improved analysis
#' and decision-making.
#'
#' @param df A dataframe to process for missing value imputation.
#'
#' @param selected_variables An optional character vector of variable names within `df`
#' for which missing values should be imputed. If `NULL` (default), imputation
#' is applied to all variables in the data frame.
#'
#' @param method A character string specifying the imputation method for
#' continuous variables. Supported methods are `"min"`, `"max"`, `"mean"`,
#' `"median"`, `"harmonic"`, and `"geometric"`. The default method is `"mean"`.
#' For categorical variables, the `mode` is always used.
#'
#' @return  A data frame with missing values imputed according to the specified
#'  `method`.
#'
#' @export
#'
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
#' # If you do not specify `selected_variables` (i.e., leave it as `NULL`),
#' # the function will impute missing values for all columns in the dataframe.
#'
#' result_df_mean <- fill_missing_values(df, method = "mean")
#'
#' result_df_mean
#'
#' # If you specify column names, only those columns will be imputed. For
#' # example, impute for variables `Petal_Length` and `Petal_Width` using
#' # the geometric mean.
#'
#' result_df_geomean <- fill_missing_values(df, selected_variables = c
#' ("Petal_Length", "Petal_Width"), method = "geometric")
#'
#' result_df_geomean
#'
#' # If you specify column positions, only the columns at those positions will #' # be imputed.
#'
#' result_df_max <- fill_missing_values(df, selected_variables = c
#' (2, 3), method = "max")
#'
#' result_df_max
#'
#' # Impute missing values (NAs) in a grouped data frame
#'
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
#' map_df(fill_missing_values, method = "median")
#'
#'
fill_missing_values <- function(df, selected_variables = NULL, method = c("mean", "min", "max", "median", "harmonic", "geometric")) {

  # Check if df is a dataframe

  if (!is.data.frame(df)) {
    stop("fill_missing_values() is designed to operate exclusively on objects of the class 'dataframe'")
  }

  if (missing(df)) {
    stop("argument 'df' is missing, with no default")
  }

  # Validate method input for continuous variables

  method <- rlang::arg_match(method)

  # Calculate the replacement value based on the specified method

  impute_continuous <- function(x, method) {
    if (!is.numeric(x)) {
      return(x)
    } # Skip non-numeric columns

    replacement_value <- switch(method,
      min = min(x, na.rm = TRUE),
      max = max(x, na.rm = TRUE),
      mean = mean(x, na.rm = TRUE),
      median = median(x, na.rm = TRUE),
      harmonic = harmonic_mean(x),
      geometric = geometric_mean(x),
      x # Default to return x as is
    )

    # Explicitly cast the replacement value to the same type as x

    replacement_value_casted <- as(replacement_value, class(x[!is.na(x)][1]))

    # Use the casted replacement value for NA replacement

    replace_na(x, replacement_value_casted)
  }


  df %>%
    mutate(across(
      .cols = {{ selected_variables }} %||% everything(),
      .fns = ~ case_when(
        is.numeric(.) ~ impute_continuous(., method),
        TRUE ~ replace_na(., get_mode(.))
      )
    ))
}

