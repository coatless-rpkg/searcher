# Search Kagi

The `search_kagi()` function searches Kagi using:
`https://kagi.com/search?q=<query>`

## Usage

``` r
search_kagi(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## Details

This is a paid search engine, and you will need to sign up for an
account to use it.

## See also

Other search engines:
[`search_bing()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_bing.md),
[`search_brave()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_brave.md),
[`search_duckduckgo()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_duckduckgo.md),
[`search_ecosia()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_ecosia.md),
[`search_google()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_google.md),
[`search_qwant()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_qwant.md),
[`search_rseek()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_rseek.md),
[`search_startpage()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_startpage.md)

## Examples

``` r
# Search Kagi
search_kagi("advanced R programming")
#> Please type into your browser:
#> https://kagi.com/search?q=advanced%20R%20programming%20r%20programming
```
