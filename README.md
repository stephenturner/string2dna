
<!-- README.md is generated from README.Rmd. Please edit that file -->

# string2dna

<!-- badges: start -->

[![R-CMD-check](https://github.com/stephenturner/string2dna/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/stephenturner/string2dna/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The string2dna provides a function to encode strings as nucleotide
sequences and decode nucleotide sequences into their original text.

## Installation

You can install the development version of string2dna from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stephenturner/string2dna")
```

## Example

The code below shows a simple example to encode a string and decode the
same DNA sequence back to the original text.

``` r
library(string2dna)
string2dna("Stephen Turner", method="encode")
#> [1] "TGATAGCTAGAGCGTCTACTCAGCTAGGATCACCTCCTACAC"
string2dna("TGATAGCTAGAGCGTCTACTCAGCTAGGATCACCTCCTACAC", method="decode")
#> [1] "STEPHEN TURNER"
```

Download the full text of [*Pride and
Prejudice*](https://www.gutenberg.org/ebooks/1342) by Jane Austen, and
encode it into a \~2 megabase DNA sequence.

``` r
pride <- readr::read_lines("https://www.gutenberg.org/cache/epub/1342/pg1342.txt")
pride <- paste(pride, collapse=" ")
string2dna(pride, method="encode")
```
