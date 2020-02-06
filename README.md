
<!-- README.md is generated from README.Rmd. Please edit that file -->

# patools

Tools to make a HR analyt’s work easier.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("flatsilver/patools")
```

## Example

Replace 半角カナ with 全角カナ via `hankana_to_zenkana()`:

``` r
library(patools)
x <- "ﾊﾝｶｸｶﾅﾊｱﾌﾞﾅｲ"
hankana_to_zenkana(x)
#> [1] "ハンカクカナハアブナイ"
```

Do not convert single-byte symbols and numbers.

``` r
y <- "123."
hankana_to_zenkana(y)
#> [1] "123."
```
