numeric_summary <- function(x, na.rm = FALSE){

  if(!is.numeric(x)){
    stop("data must be numeric")
  }

  data.frame(
    mean = mean(x, na.rm = na.rm),
      sd = sd(x, na.rm = na.rm),
   range = str_c(range(x, na.rm = na.rm),
                 collapse = "-"))
}


data_summary <- function(x, na.rm = FALSE){

  if(!na.rm & any(is.na(x))){
    warning("Data contains NA values!")
  }

  num_data <- select(x, where(is.numeric))

  map_df(num_data, .f = numeric_summary, na.rm = na.rm, .id = "num.vars")
}


# Display the structure of the dataframe

display_data <- function(df, title = "Data structure"){
  require(vtable)

  if(is.data.frame(df) == FALSE){
    stop("display_data() only works for dataframe object")
  }else{
    df %>%
      mutate(across(where(is.character), as.factor)) %>%
      vtable(factor.limit = 10, data.title = title)
    cat("Returns the First 6 rows\n")
    view(head(df))
  }

}







weather<- tibble::tribble(
   ~Day.T, ~emp, ~Weather,
       1L, 122L,   "Snow",
       2L, 219L,   "Snow",
       3L, 318L,    "Sun",
       4L, 424L,   "Rain",
       5L, 515L,   "Rain",
       6L, 621L,   "Snow",
       7L, 714L,   "Rain")


# data frame to practice

practise <- readxl::read_xlsx("../Stringr extension package/data to practise.xlsx")

display_data(practise)



# TO check if joining dataframe as a duplicate

# Check if joining has a duplicate
my_left_join <- function(x, y, ...){
  res <- dplyr::left_join(x, y, ...)

  if (nrow(res) > nrow(x)) warning("Duplicated records found")
  return(res)
}


a <- tibble(id = 1:3)
b <- tibble(id = c(1:3, 1), val = 7:10)


a %>% dplyr::left_join(b, by = "id")

a %>% my_left_join(b, by = "id")

