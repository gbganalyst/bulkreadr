test_that("read_csv_files_from_dir reads all CSV files from a directory", {

  path_train <- test_path("csvfolder")

  path_test <- test_path("extdata", "read_csv_files_from_dir.csv")

  train_data <- read_csv_files_from_dir(path_train)

  test_data <- readr::read_csv(path_test, show_col_types = FALSE)

  expect_equal(dim(train_data) , dim(test_data))

})


