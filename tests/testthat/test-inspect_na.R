test_that("inspect_na summarizes missingness in data frame columns", {

  path_test <- test_path("extdata", "airquality.csv")

  train_data <- inspect_na(airquality)

  test_data <- readr::read_csv(path_test, show_col_types = FALSE)

  expect_equal(dim(train_data) , dim(test_data))

})
