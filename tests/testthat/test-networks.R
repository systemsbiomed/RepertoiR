test_that("no error has occurred", {
  aa <- c('G', 'A', 'V', 'L', 'I', 'P', 'F', 'Y', 'W', 'S',
          'T', 'N', 'Q', 'C', 'M', 'D', 'E', 'H', 'K', 'R')
  data <- matrix(rexp(1/2, n=1000), ncol = 4)
  cons <- sample(aa, 10)
  aavec <- c()

  while(length(aavec) < nrow(data)) {
    aaseq <- cons
    index <- sample(length(aaseq), sample(length(aaseq)/3, 1))
    aaseq[index] <- sample(aa, length(index), replace = TRUE)
    aaseq <- paste0(aaseq, collapse = "")
    aavec <- unique(append(aavec, aaseq))
  }

  rownames(data) <- aavec
  colnames(data) <- LETTERS[1:ncol(data)]
  # skip("This test hasn't been written yet")
  expect_identical(network(data), NULL)
})
