#' Extract or replace parts of an object
#'
#' `pull_out()` is similar to `[`. It acts on vectors, matrices, arrays and lists to extract or replace parts. It is pleasant to use with the magrittr (`%>%`) and base (`|>`) operators.
#'
#' @usage NULL
#' @export
#' @rdname aliases
#' @name pull_out
#' @return `pull_out()` will return an object of the same class as the input object.
#' @examples
#'
#' good_choice <- letters %>%
#'   pull_out(c(5, 2, 1, 4))
#'
#' good_choice
#'
#' iris %>%
#'   pull_out(, 1:4) %>%
#'   head()
#'
pull_out <- .Primitive("[")


