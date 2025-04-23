test_that("write_excel_sheets_to_csv exports all sheets correctly", {
  # Create a temporary directory and file paths
  tmp_dir <- tempdir()

  # Create a workbook with two sheets and write data
  df1 <- read_xlsx(test_path("extdata", "Diamonds.xlsx"), 1)

  df2 <- read_xlsx(test_path("extdata", "Diamonds.xlsx"), 2)


  # Run the function under test
  exported_files <- write_excel_sheets_to_csv(
    excel_path = test_path("extdata", "Diamonds.xlsx"),
    output_dir = tmp_dir
  )

  # Check that two files are returned
  expect_length(exported_files, 5)

  # Check that the CSV files exist
  expect_true(file.exists(file.path(tmp_dir, "Fair.csv")))
  expect_true(file.exists(file.path(tmp_dir, "Good.csv")))

  # Read back the CSVs and compare contents
  result1 <- read_csv(file.path(tmp_dir, "Fair.csv"), show_col_types = FALSE)

  result2 <- read_csv(file.path(tmp_dir, "Good.csv"), show_col_types = FALSE)

  expect_equal(result1, df1)
  expect_equal(result2, df2)
})
