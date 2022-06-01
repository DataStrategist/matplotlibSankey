
<!-- README.md is generated from README.Rmd. Please edit that file -->

# matplotlibSankey

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/matplotlibSankey)](https://CRAN.R-project.org/package=matplotlibSankey)
<!-- badges: end -->

The goal of matplotlibSankey is to create a sankey plot that’s wide in
format (the one from matplotlib).

## Installation

You can install the development version of matplotlibSankey from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DataStrategist/matplotlibSankey")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(matplotlibSankey)
#> Loading required package: reticulate
#> Warning: package 'reticulate' was built under R version 4.1.3

## install the python libraries:
# install_matplotlib()

## define data example
example2 <- data.frame(
  flows = c(15, 0, 60, -10, -20, -5, -15, -30, -20),
  labels = c('', '', '', 'First', 'Second', 'Third', 'Looooooong Fourth',
             'Fifth', 'Hurray!'),
  orientations = c(-1, 1, 0, 1, 1, 1, -1, 1, 0),
  pathlengths = c(0.25, 0.25, 0.25, 0.25, 0.25, 0.1, .5, 0.25,
                  0.25),
  color='r'
)

## create the sankey chart
#sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system")
```
