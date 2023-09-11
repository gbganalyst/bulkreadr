test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("fill_missing_values fill missingness in data frame columns", {

  path_test_mean <- test_path("extdata", "airquality_mean.csv")

  path_test_median <- test_path("extdata", "airquality_median.csv")

  train_data_mean <- fill_missing_values(tibble(airquality), use_mean = TRUE)

  train_data_median <- fill_missing_values(tibble( airquality), use_mean = FALSE)


  test_data_mean <- readr::read_csv(path_test_mean, show_col_types = FALSE)


  test_data_median <- readr::read_csv(path_test_median, show_col_types = FALSE)

  expect_equal(train_data_mean, test_data_mean)

  expect_equal(train_data_median, test_data_median)


})
