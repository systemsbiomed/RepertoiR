
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RepertoireGraphs

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/IdoHassonJ/RepertoireGraphs.svg?branch=main)](https://travis-ci.com/IdoHassonJ/RepertoireGraphs)
<!-- badges: end -->

The goal of RepertoireGraphs is to… Repertoire Graphical Visualization

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
#>                    A         B        C        D
#> GSKPECVNQI 12.944249 0.9312361 4.214433 1.655875
#> YVCSGDNWRM  1.464611 0.8165296 0.574519 7.495995
#> YDFIAHSMKN  3.482440 0.2761332 3.106985 1.401014
#> QELGWDCIFS 12.541312 1.5449392 7.832853 0.468031
#> WMERFCNPDY  3.055389 1.5423529 4.863527 3.505666
#> YTAKLWCPIS  5.210536 3.7179394 3.872300 1.125345
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
