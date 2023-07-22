test_that("read_excel_workbook imports data from multiple sheets of an Excel workbook and append them as a dataframe", {

  path_train <- test_path("extdata", "Diamonds.xlsx")

  path_test <- test_path("extdata", "read_excel_workbook.xlsx")

  train_data <- read_excel_workbook(path = path_train, .id = "Year")

 test_data <- readxl::read_xlsx(path_test)

   expect_equal(dim(test_data) , dim(test_data))

  })

