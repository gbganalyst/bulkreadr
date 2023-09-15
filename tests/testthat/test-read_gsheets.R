test_that("read_gsheets import data from multiple sheets in Google Sheets", {

  googlesheets4::gs4_deauth()

  sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"

  train_data <-  read_gsheets(ss = sheet_id, .id = "sheet.name")

  path_test <- test_path("extdata", "GDiamonds.xlsx")

  test_data <- readxl::read_xlsx(path_test)

  expect_equal(dim(test_data), dim(test_data))

})



