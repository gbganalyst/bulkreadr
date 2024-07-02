# bulkreadr 1.1.1 (2024-03-01)

We are pleased to announce the release of `bulkreadr` version 1.1.1. This version introduces significant enhancements and features aimed at improving the functionality and user experience of the package.

* **Enhanced `fill_missing_values()` Functionality**: 

The `fill_missing_values()` function has been significantly improved to support various imputation methods, empowering users to handle missing data with greater precision and flexibility. In addition to the previously supported "mean" imputation method, the function now accommodates the following strategies:

`Minimum Value (Min)`: Imputes missing entries with the minimum value observed within each respective column.

`Maximum Value (Max)`: Fills missing data points with the maximum value found in each column.
Mean: Continues to offer the average value imputation, replacing missing values with the mean of the available data in each column.

`Median`: Imputes missing entries by employing the median value of each column, providing a robust alternative to mean imputation, especially in the presence of outliers.

`Harmonic Mean`: Offers a sophisticated option for imputing missing values using the harmonic mean, ideal for data distributions where this approach is more representative.

`Geometric Mean`: Completes our enhanced range of imputation methods by allowing for the replacement of missing values with the geometric mean, suited for datasets where the product of values is of interest.

These enhancements are designed to provide users with a comprehensive toolkit for data imputation, ensuring that `fill_missing_values()` can be effectively tailored to meet the unique demands of diverse datasets and analysis requirements.


* **Package Website Launch:** 

To better serve our users and provide detailed documentation, we have launched the official `bulkreadr` package website. The website offers comprehensive guides, function references, and examples to help users maximize the package's potential. Visit us at <https://gbganalyst.github.io/bulkreadr/> for more information.

We believe these updates will significantly enhance your data analysis workflows and look forward to your feedback.

# bulkreadr 1.1.0 (2023-11-13)

This update includes the following new features:

* `generate_dictionary()`: This function is designed to automatically create a comprehensive data dictionary from labelled datasets. The generated dictionary provides detailed insights into each variable, aiding in better data understanding and management.

* `look_for()`: This enhances the capability to efficiently search within labelled datasets. It allows users to quickly find variable names and their descriptions by searching for specific keywords. This feature streamlines data exploration and analysis, particularly in large datasets with extensive variables.

These enhancements aim to improve the user experience in data management and exploration within `bulkreadr`. We hope these new features will assist our users in more effectively navigating and understanding their labelled datasets.

# bulkreadr 1.0.0 (2023-09-20)

This update includes the following new features and improvements:

* Developed `read_stata_data()` to import Stata data file (`.dta`) into an R data frame, converting labeled variables into factors.

* Reduced dependency packages to optimize efficiency.


# bulkreadr 0.2.0 (2023-09-11) 

This update includes the following new features and improvements:

* Developed bulkreadr vignette

* Developed `read_spss_data()` to seamlessly import data from an SPSS data (`.sav` or  `.zsav`) files and converting labelled variables into factors, a crucial step that enhances the ease of data manipulation and analysis within the R programming environment.

* Added more unit tests

# bulkreadr 0.1.0 (2023-07-24) 

This update includes the following new features and improvements:

* Improved error handling by adding meaningful error messages for all functions within `bulkreadr` package. This will make it easier for users to identify and troubleshoot issues that may arise during their use of the package.

* Added package-level documentation. The user can now use `?bulkreadr::bulkreadr` for basic package-level documentation.

* Added `inspect_na()` to summarize missingness in data frame columns and `fill_missing_values()` to impute missing values in a dataframe.

# 0.0.0.9 (2023-07-03)

The development version of bulkreadr is now on Githhub.

