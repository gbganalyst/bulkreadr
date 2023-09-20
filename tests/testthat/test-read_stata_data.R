test_that("read_stata_data imports data from Stata file", {

  path_train <- test_path("extdata", "Wages.dta")

  train_data <- read_stata_data(file = path_train)

  test_data <- haven::read_dta(path_train)

  expect_equal(dim(test_data) , dim(test_data))

})

