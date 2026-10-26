# Search Bing

The `search_bing()` function searches [Bing](https://www.bing.com/)
using: `https://www.bing.com/search?q=<query>`

## Usage

``` r
search_bing(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## See also

Other search engines:
[`search_brave()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_brave.md),
[`search_duckduckgo()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_duckduckgo.md),
[`search_ecosia()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_ecosia.md),
[`search_google()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_google.md),
[`search_kagi()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_kagi.md),
[`search_qwant()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_qwant.md),
[`search_rseek()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_rseek.md),
[`search_startpage()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_startpage.md)

## Examples

``` r
# Search Bing
search_bing("Microsoft R")
#> Please type into your browser:
#> https://bing.com/search?q=Microsoft%20R%20r%20programming
```
