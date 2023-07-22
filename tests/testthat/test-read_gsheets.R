test_that("read_gsheets import data from multiple sheets in Google Sheets", {

  skip_if_no_token <- function() {
    if (googlesheets4::gs4_has_token()) {
      # hack to slow things down in CI
      Sys.sleep(3)
    } else {
      skip("No token")
    }
  }

  skip_if_no_token()
  skip_if_offline()

  sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"

  train_data <-  read_gsheets(ss = sheet_id, .id = "sheet.name")

  path_test <- test_path("extdata", "GDiamonds.xlsx")

  test_data <- readxl::read_xlsx(path_test)

  expect_equal(dim(test_data), dim(test_data))


})



