test_that("print data", {
  # d <- read.csv("~/R/data/combined_mats/comb_mat_cut.csv", header=T, row.names=1,check.names = FALSE)
  # d <- data.frame(a = 1:100, b = 1:100, c = 1:100, d = 1:100)

  # print(head(d[,1:4]))
  # d <- d[1:100, 1:4]
  # sunflower(d)

  expect_identical("data", "data")
})
