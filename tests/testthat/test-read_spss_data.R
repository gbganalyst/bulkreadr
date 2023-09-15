test_that("read_spss_data imports data from SPSS file", {

  path_train <- test_path("extdata", "Wages.sav")

  train_data <- read_spss_data(file = path_train)

  test_data <- haven::read_sav(path_train)

  expect_equal(dim(test_data) , dim(test_data))

})

