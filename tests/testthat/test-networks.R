test_that("multiplication works", {

    data <- matrix(rexp(1/2, n=4000), ncol = 4)
  aa <- c('G', 'A', 'V', 'L', 'I', 'P', 'F', 'Y', 'W', 'S',
          'T', 'N', 'Q', 'C', 'M', 'D', 'E', 'H', 'K', 'R')

  cons <- sample(aa, 10)

  aa_list <- c()
  while(length(aa_list)<nrow(data)) {
    aaseq <- cons
    index <- sample(length(aaseq), 3)
    aaseq[index] <- sample(aa, 3, replace = TRUE)
    aaseq <- paste0(aaseq, collapse = "")
    aa_list <- if (!(aaseq %in% aa_list)) append(aa_list, aaseq)
  }

  rownames(data) <- aa_list
  network(data, by = 3, nrow = 500)
  expect_identical("data", "data")
})
