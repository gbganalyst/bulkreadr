read_csv_files_in_folder <- function(folder_path = ".", col_types = NULL, .id = NULL) {
  dir_ls(path = folder_path, regexp = "csv") %>%
    map_df(read_csv, col_types = col_types, .id = .id, show_col_types = FALSE)
}
