test_that("to_date parsing an input scalar into POSIXct date object", {

  train <- suppressWarnings(to_date("2022-09-22"))

  test <- as.POSIXct("2022-09-22",tz = "UTC")

  expect_equal(train, test)
})


