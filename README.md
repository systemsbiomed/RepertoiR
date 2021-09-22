
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RepertoireGraphs

<!-- badges: start -->
<!-- badges: end -->

This package provides visualization options of TCR/BCR repertoire
datasets.

## Installation

For RepertoireGraphs installation execute the following command:

``` r
install.packages("RepertoireGraphs")
```

or

``` r
library(devtools)
devtools::install_github("IdoHassonJ/RepertoireGraphs")
```

## Example

Load the package and create TCR/BCR dataset with arbitrary sequences &
values:

``` r
library(RepertoireGraphs)
data <- matrix(rexp(400,1/4), ncol = 4)
aa <- c("G", "A", "V", "L", "I", "P", "F", "Y", "W", "S",
        "T", "N", "Q", "C", "M", "D", "E", "H", "K", "R") # amino acid symbols
seq <- replicate(nrow(data), paste0(sample(aa, 10), collapse = ""))
rownames(data) <- seq
colnames(data) <- LETTERS[seq(ncol(data))]

head(data)
#>                     A        B         C         D
#> HLCTPRADIE  0.1864028 3.132790 2.9118531 1.1476071
#> SQDLGHCNFM  5.1790652 2.490808 4.5123107 8.3769079
#> KRHVDFYCGI  1.3837080 4.645174 2.9888848 2.3483323
#> PDITEWRVNS 12.1558195 8.851447 3.1157216 0.5885532
#> KHVRCGEMSL  6.2795384 2.351688 0.7946035 0.4920479
#> WCKHSIYATF  3.3369664 0.541102 0.1406660 5.7886058
```

Now we can execute sunflower function:

``` r
sunflower(data)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

More examples are available in package help:

``` r
?network
?cr_source
```
