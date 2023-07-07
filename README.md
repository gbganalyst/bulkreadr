
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bulkreadr <a><img src='man/figures/logo.png' align="right" height="138.5" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/gbganalyst/forstringr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/gbganalyst/forstringr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

`bulkreadr` is an R package designed to simplify and streamline the
process of reading and processing large volumes of data. With a
collection of functions tailored for bulk data operations, the package
allows users to efficiently read multiple sheets from Microsoft
Excel/Google Sheets workbooks and multiple CSV files from a directory.
It returns the data as organized data frames, making it convenient for
further analysis and manipulation. Whether dealing with extensive data
sets or batch processing tasks, “bulkreadr” empowers users to
effortlessly handle data in bulk, saving time and effort in data
preparation workflows.

## Installation

You can install the development version of `bulkreadr` from
[GitHub](https://github.com/) with

``` r
if(!require("devtools")){
 install.packages("devtools")
}

devtools::install_github("gbganalyst/bulkreadr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(bulkreadr)
## basic example code
```
