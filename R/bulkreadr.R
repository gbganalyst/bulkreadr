# Load Packages

# bulkdataR  bulkreadr

# Title: The Ultimate Tool for Reading Data in Bulk

# Description:

# "bulkreadr" is an R package designed to simplify and streamline the process of reading and processing large volumes of data. With a collection of functions tailored for bulk data operations, the package allows users to efficiently read multiple sheets from Excel workbooks and multiple CSV files from a directory. It returns the data as organized data frames, making it convenient for further analysis and manipulation. Whether dealing with extensive data sets or batch processing tasks, "bulkreadr" empowers users to effortlessly handle data in bulk, saving time and effort in data preparation workflows.
  
install.load::install_load(c("tidyverse", "googlesheets4", "janitor", "readxl", "writexl", "here", "fs", "openxlsx", "forstringr"))

# Reads all the data from the sheets of an Excel workbook

# path: excel_file_path: The path to the Excel workbook file.

# This function will read all the data from the sheets of the Excel workbook  and return a list of dataframes. 

read_excel_workbook <- function(path, col_types = NULL, .id = NULL) {
  path %>%
    excel_sheets() %>% 
    set_names() %>% 
    map_df(read_xlsx, path = path, col_types = col_types, .id = .id)
}


# Reads all Excel workbooks in a folder and returns appended DataFrames.

# Reads all Excel workbooks in a folder and returns a list of DataFrames

# This function would read all Excel workbooks in the `./data` directory and return a list of DataFrames. Each DataFrame would contain the data from one Excel workbook.

read_excel_files_in_folder <- function(directory, col_types = NULL, .id = NULL) {
  dir_ls(path = directory, regexp = "xlsx") %>%
    map_df(read_excel_workbook, col_types = col_types, .id = .id)
}



# To read all csv data in a folder

# Reads all CSV files in a folder and returns a list of DataFrames.

# This function will read all CSV files in the ./data folder and return a list of DataFrames. The DataFrames will be in the same order as the CSV files in the folder.

# folder_path: The path to the workbook file.

read_csv_files_in_folder <- function(folder_path = ".", col_types = NULL, .id = NULL) {
  dir_ls(path = folder_path, regexp = "csv") %>% 
    map_df(read_csv, col_types = col_types, .id = .id, show_col_types = FALSE)
}
