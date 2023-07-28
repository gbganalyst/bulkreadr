% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fill_missing_values.R
\name{fill_missing_values}
\alias{fill_missing_values}
\title{Fill missing values in a dataframe}
\usage{
fill_missing_values(df, use_mean = TRUE)
}
\arguments{
\item{df}{The input dataframe to be processed.}

\item{use_mean}{Logical. If \code{TRUE}, missing values in numeric columns will be replaced with the mean.
If \code{FALSE}, missing values in numeric columns will be replaced with the median.}
}
\value{
The dataframe with missing values filled.
}
\description{
\code{fill_missing_values()} is an efficient function that addresses missing values in a dataframe. It uses imputation by function, also known as column-based imputation, to fill numeric variables with the mean or median, and non-numeric variables with the mode. This approach ensures accurate and consistent replacements derived from individual columns, resulting in a complete and reliable dataset for improved analysis and decision-making.
}
\examples{
# Assuming 'df' is the dataframe you want to process

df <- tibble(
Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
Petal_Width = c(NA, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
Species = c("setosa", NA, "versicolor", "setosa",
           NA, "virginica", "setosa")
)

# Using mean to fill missing values for numeric variables

result_df_mean <- fill_missing_values(df, use_mean = TRUE)

result_df_mean

# Using median to fill missing values for numeric variables

result_df_median <- fill_missing_values(df, use_mean = FALSE)

result_df_median

}