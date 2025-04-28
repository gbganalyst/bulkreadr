#' Export Excel Sheets to CSV Files
#'
#' This function reads an Excel file, converts each sheet into a data frame, and writes each sheet
#' to a CSV file in the specified output directory.
#'
#' @param excel_path A character string specifying the path to the Excel file.
#' @param output_dir A character string specifying the directory where CSV files will be saved.
#'   Defaults to "data/".
#'
#' @return A list of file paths corresponding to the exported CSV files.
#' @export
#'
#' @importFrom readxl excel_sheets read_xlsx
#' @importFrom purrr map imap
#' @importFrom readr write_csv
#'
#' @examples
#' # Path to the example Excel file shipped with the package
#' excel_file <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr")
#'
#' # Export each sheet to its own CSV in a temporary directory
#' output_dir <- tempdir()
#' write_excel_sheets_to_csv(excel_file, output_dir)
#'
write_excel_sheets_to_csv <- function(excel_path, output_dir = "data/") {
  # Create the output directory if it doesn't exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  # Read all sheets from the Excel file into a list of data frames
  sheets <- readxl::excel_sheets(excel_path)
  df_list <- purrr::map(sheets, ~ readxl::read_xlsx(excel_path, sheet = .x))
  names(df_list) <- sheets

  # Write each data frame to a CSV file in the output directory and collect file paths
  file_paths <- purrr::imap(df_list, function(df, sheet_name) {
    out <- file.path(output_dir, paste0(sheet_name, ".csv"))
    readr::write_csv(df, out)
    out
  })

  message(
    "Exported CSV file paths are:\n  ",
    paste(file_paths, collapse = "\n  ")
  )

  invisible(file_paths)
}
