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
#' \dontrun{
#' # Export CSV files from an Excel file "Diamonds.xlsx" into the "exported/" directory
#' write_excel_sheets_to_csv("inst/extdata/Diamonds.xlsx", "inst/exported")
#' }
write_excel_sheets_to_csv <- function(excel_path, output_dir = "data/") {
  # Check if required packages are installed
  if (!requireNamespace("readxl", quietly = TRUE)) stop("Package 'readxl' is required.")
  if (!requireNamespace("readr", quietly = TRUE)) stop("Package 'readr' is required.")
  if (!requireNamespace("purrr", quietly = TRUE)) stop("Package 'purrr' is required.")

  # Create the output directory if it doesn't exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  # Read all sheets from the Excel file into a list of data frames
  sheets <- readxl::excel_sheets(excel_path)
  list_of_dfs <- purrr::map(sheets, ~ readxl::read_xlsx(excel_path, sheet = .x))
  names(list_of_dfs) <- sheets

  # Write each data frame to a CSV file in the output directory and collect file paths
  file_paths <- purrr::imap(list_of_dfs, function(data, sheet_name) {
    file_path <- file.path(output_dir, paste0(sheet_name, ".csv"))
    readr::write_csv(data, file_path)
    file_path
  })

  return(file_paths)
}
