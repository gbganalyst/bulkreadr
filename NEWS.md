# What is New in *bulkreadr*?

## bulkreadr 1.1.0 (2023-11-13)

This update includes the following new features:

- `generate_dictionary()`: This function is designed to automatically create a comprehensive data dictionary from labelled datasets. The generated dictionary provides detailed insights into each variable, aiding in better data understanding and management.

- `look_for()`: This enhances the capability to efficiently search within labelled datasets. It allows users to quickly find variable names and their descriptions by searching for specific keywords. This feature streamlines data exploration and analysis, particularly in large datasets with extensive variables.

These enhancements aim to improve the user experience in data management and exploration within `bulkreadr`. We hope these new features will assist our users in more effectively navigating and understanding their labelled datasets.

## bulkreadr 1.0.0 (2023-09-20)

This update includes the following new features and improvements:

- Developed `read_stata_data()` to import Stata data file (`.dta`) into an R data frame, converting labeled variables into factors.

- Reduced dependency packages to optimize efficiency.


## 0.2.0 (2023-09-11) 

This update includes the following new features and improvements:

- Developed bulkreadr vignette

- Developed `read_spss_data()` to seamlessly import data from an SPSS data (`.sav` or  `.zsav`) files and converting labelled variables into factors, a crucial step that enhances the ease of data manipulation and analysis within the R programming environment.

- Added more unit tests

## 0.1.0 (2023-07-24) 

This update includes the following new features and improvements:

- Improved error handling by adding meaningful error messages for all functions within `bulkreadr` package. This will make it easier for users to identify and troubleshoot issues that may arise during their use of the package.

- Added package-level documentation. The user can now use `?bulkreadr::bulkreadr` for basic package-level documentation.

- Added `inspect_na()` to summarize missingness in data frame columns and `fill_missing_values()` to impute missing values in a dataframe.

## 0.0.0.9 (2023-07-03)

The development version of bulkreadr is now on Githhub.

