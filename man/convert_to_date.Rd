% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_to_date.R
\name{convert_to_date}
\alias{convert_to_date}
\title{User friendly date parsing function}
\usage{
convert_to_date(date_num_char, tz = "UTC")
}
\arguments{
\item{date_num_char}{A character or numeric vector of dates}

\item{tz}{Time zone indicator. If \code{NULL} (default), a Date object is
returned. Otherwise a POSIXct with time zone attribute set to \code{tz}.}
}
\value{
a vector of class Date
}
\description{
\code{convert_to_date()} parses an input vector into POSIXct date object. It is also powerful to convert from excel date number like \code{42370} into date value like \code{2016-01-01}.
}
\examples{

## ** heterogeneous dates **

dates <- c(
  44869, "22.09.2022", NA, "02/27/92", "01-19-2022",
  "13-01-  2022", "2023", "2023-2", 41750.2, 41751.99,
  "11 07 2023", "2023-4"
)

convert_to_date(dates)

}
