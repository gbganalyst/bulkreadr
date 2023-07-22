test_that("read_excel_files_in_folder reads Excel Workbooks data from a directory", {

  path_train <- test_path("xlsxfolder")

  path_test <- test_path("extdata", "read_excel_files_in_folder.xlsx")

  train_data <- read_excel_files_from_dir(path_train)

  test_data <- readxl::read_xlsx(path_test)

  expect_equal(dim(test_data) , dim(test_data))

})

