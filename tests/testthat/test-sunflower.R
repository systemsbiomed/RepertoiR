test_that("check no error has occurred", {
  # d <- read.csv("~/R/data/combined_mats/comb_mat_cut.csv", header=T, row.names=1,check.names = FALSE)
  data <- data.frame(a = 1:100, b = 1:100, c = 1:100, d = 1:100) / 10

  # skip("This test hasn't been written yet")
  expect_identical(sunflower(data), NULL)
})
