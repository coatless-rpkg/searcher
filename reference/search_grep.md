# Search Grep.app

The `search_grep()` function searches all public code on
[GitHub](https://github.com) using [grep.app](https://grep.app) by
querying: `https://grep.app/search?q=<query-here>&filter[lang][0]=R`

## Usage

``` r
search_grep(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## See also

Other code repositories:
[`search_bitbucket()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_bitbucket.md),
[`search_github()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_github.md)

## Examples

``` r
# Search R code on GitHub for numerical optimization
search_grep("optim")
#> Please type into your browser:
#> https://grep.app/search?q=optim%20%26filter%5Blang%5D%5B0%5D%3DR

# Search all code on GitHub for numerical optimization
search_grep("optim", rlang = FALSE)
#> Please type into your browser:
#> https://grep.app/search?q=optim
```
