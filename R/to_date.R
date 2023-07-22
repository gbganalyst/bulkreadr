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

