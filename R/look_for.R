#' Look for keywords variable names and descriptions in labelled data
#'
#' @description
#' The `look_for()` function is designed to emulate the functionality of the Stata `lookfor` command in R. It provides a powerful tool for searching through large datasets, specifically targeting variable names, variable label descriptions, factor levels, and value labels. This function is handy for users working with extensive and complex datasets, enabling them to quickly and efficiently locate the variables of interest.
#'
#' @inheritParams labelled::lookfor
#'
#' @return
#'
#' A tibble data frame featuring the variable position, name and description (if it exists) in the original data frame.
#'
#' @export
#'
#' @examples
#'
#' look_for(iris)
#'
#' # Look for a single keyword.
#'
#' look_for(iris, "petal")
#'
#' look_for(iris, "s")
#'
look_for <- function(data, ..., labels = TRUE, values = TRUE, ignore.case = TRUE, details = c("basic", "none", "full"))
  lookfor(
    data = data,
    ... = ...,
    labels = labels,
    values = values,
    ignore.case = ignore.case,
    details = details
  )
