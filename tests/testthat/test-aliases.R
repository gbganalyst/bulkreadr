test_that("pull_out() extract or replace parts of an object", {

  train <- good_choice <- letters %>%
    pull_out(c(5, 2, 1, 4))

  test <- c("e", "b", "a", "d")

  expect_equal(train, test)
})


