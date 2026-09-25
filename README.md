
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `artcatr`

`artcatr` calculates sample size and power for a two-arm randomized
trial with an ordinal outcome, analysed by the
proportional-odds model. It uses the `ologit` method
of White, Marley-Zagar, Morris, Parmar, Royston & Babiker (2023). This
packages implements the Stata functions (`artcat`) into R (`artcatr`).

## Installation

`artcatr` is easiest to install via

<!-- ```{r, eval = FALSE} -->

<!-- install.packages('CTUtemplate', repos = c('https://dcr-unibe-ch.r-universe.dev', 'https://cloud.r-project.org')) -->

<!-- ``` -->

Linux users might have to install from source:

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
