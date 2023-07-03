get_age <- function(date_born) {
  if (!is.Date(date_born)) {
    message("The date column you want to get age from is not in the date format")
  } else {
    (today() - date_born) / dyears()
  }
}
  

