
<!-- README.md is generated from README.Rmd. Please edit that file -->

# palette <img src="man/figures/logo.png" align="right" height="138" alt="" />

<!-- badges: start -->
<!-- badges: end -->

`palette` provides a lightweight infrastructure for working with color
palettes in R. The primary goal is to place colors directly next to
their character representations. To do this, we create a palette class
based on [`vctrs`](https://vctrs.r-lib.org/index.html). We then provide
methods for this class, including `print()`, `plot()`, and
[`pillar`](https://pillar.r-lib.org/). To keep it lightweight and usable
in other packages, the only direct dependencies are `vctrs`, `cli`, and
`pillar`.

## Installation

You can install the development version of palette from
[GitHub](https://github.com/) with:

``` r
# install.packages('pak')
pak::pak('christopherkenny/palette')
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(palette)
#> 
#> Attaching package: 'palette'
#> The following object is masked from 'package:grDevices':
#> 
#>     palette
## basic example code
```