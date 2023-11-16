test_that("generate_dictionary creates a data dictionary from a data frame", {

  path_train <- test_path("extdata", "Wages.sav")

  train_data <- read_spss_data(file = path_train)

  expect_equal(names(generate_dictionary(train_data)) , c("position", "variable", "description", "column type", "missing", "levels"))

})
