test_that("fill_missing_values() fill missingness in data frame columns", {

  path_test_mean <- test_path("extdata", "airquality_mean.csv")

  train_data_mean <- fill_missing_values(tibble(airquality))

  test_data_mean <- readr::read_csv(path_test_mean, show_col_types = FALSE)


  expect_equal(train_data_mean, test_data_mean)

  })
