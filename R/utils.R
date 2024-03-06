is_string <- function(x) {
  length(x) == 1 && is.character(x)
}


check_file <- function(path) {
  if (!is_string(path)) {
    stop("`path` must be a string", call. = FALSE)
  }

  if (!file.exists(path)) {
    stop("`path` does not exist: ", sQuote(path), call. = FALSE)
  }
  path
}

# For date

to_date <- function(x, origin = "1900-01-01", ...) {
  if (is.Date(x)) {
    return(x)
  }
  if(is.na(x)){
    return(as_date(x))
  }
  if(class(x)[1] == "POSIXct"){
    return(as_date(x))
  }
  if (str_length(x) >= 4 && is.na(as.numeric(x))) {
    return(lubridate::parse_date_time(x, orders = c("dmy", "ymd", "mdy", "ym")))
  }
  if (str_length(x) == 4) {
    return(lubridate::parse_date_time(x, orders = "y"))
  }
  else {
    return(openxlsx::convertToDate(x))
  }
}


# For descriptive statistics

# Define the harmonic_mean function if not already defined
harmonic_mean <- function(x) {
  n <- length(x)
  sum_reciprocal <- sum(1 / x, na.rm = TRUE)
  n / sum_reciprocal
}

# Define the geometric_mean function
geometric_mean <- function(x) {
  x_positive <- x[x > 0] # Ensure only positive values are considered
  if(length(x_positive) == 0) return(NA) # Avoid -Inf or NaN for non-positive sets
  (prod(x_positive, na.rm = TRUE))^(1 / length(x_positive))
}

# Define the get_mode function for categorical imputation
get_mode <- function(x) {
  ux <- unique(x[!is.na(x)])
  ux[which.max(tabulate(match(x, ux)))]
}


