test_that("look_for searches variable in a data frame", {

  train_data <- look_for(iris)

  expect_equal(dim(train_data), c(5,7))

})
