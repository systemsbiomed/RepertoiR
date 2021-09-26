
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RepertoireGraphs

<!-- badges: start -->

[![R-CMD-check](https://github.com/IdoHassonJ/RepertoireGraphs/workflows/R-CMD-check/badge.svg)](https://github.com/IdoHassonJ/RepertoireGraphs/actions)
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
#>                     A         B         C           D
#> GEWACDILMP  0.9960813 0.6650530  4.418319  0.73922065
#> MKGHLTDWCA  4.4845792 2.4032516  1.453428  3.17342473
#> DPVSNITMEF  9.6958134 0.9101618  2.325893  0.05546815
#> MEAWVTRHSP 11.8190387 0.4985074  1.605471 21.94881172
#> NIKSEHPLTY  5.8258307 1.3677063 26.471218  0.59619467
#> WNAMFQEVKG  1.9115071 1.8200938  2.770713  3.53339572
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
