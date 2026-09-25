
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `artcatr`

`artcatr` calculates sample size and power for a two-arm randomized
trial with an ordinal outcome, analysed by a proportional-odds model. It
uses the `ologit` method of White, Marley-Zagar, Morris, Parmar, Royston
& Babiker (2023). This package implements the Stata functions (`artcat`,
White et al. (2023)) into R (`artcatr`).

## Installation

`artcatr` is easiest to install via

``` r
remotes::install_github("dcr-unibe-ch/artcatr")
```

This may require `Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")`
if packages were built under a different R version to the one you are
using.

## Usage

``` r
library(artcatr)
```
