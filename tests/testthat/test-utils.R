test_that("to_date parsing an input scalar into POSIXct date object", {

  train <- suppressWarnings(to_date("2022-09-22"))

  test <- as.POSIXct("2022-09-22",tz = "UTC")

  expect_equal(train, test)
})


test_that("is_string() works", {
  expect_true(is_string("string"))
})


x <- c(1, 2, 3, 4, 3, 2, 3, 2, 3, 4)

test_that("harmonic_mean() return an harmonic mean of a vector", {
  expect_equal(harmonic_mean(x), 2.3076923)
})

test_that("geometric_mean() returns geometric mean of a vector", {
  expect_equal(geometric_mean(x), 2.5209806)
})

test_that("get_mode() returns the mode of a vector", {
  expect_equal(get_mode(x), 3)
})
