test_that("multiplication works", {

  # default arguments
  seq_n <- c(5, 9)
  seq_len <- 10
  # Create data
  human_l <- c(); mouse_l <- c()
  for (i in 1:seq_n[1]) human_l[i] <- paste(sample(c("A", "G", "C", "T"), seq_len, replace = T), collapse = '')
  for (i in 1:seq_n[2]) mouse_l[i] <- paste(sample(c("A", "G", "C", "T"), seq_len, replace = T), collapse = '')

  cr_source.default(human_l, mouse_l)
  expect_identical("data", "data")
})
