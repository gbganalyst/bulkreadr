test_that("convert_to_date parsing an input vector into POSIXct date-time object", {

  train <- convert_to_date(c(44869, "22.09.2022", NA))

  test <- as.Date(c("2022-11-04 UTC", "2022-09-22 UTC", NA),  "%Y-%m-%d")

  expect_equal(train, test)
})

