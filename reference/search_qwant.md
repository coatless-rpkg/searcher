# Search Qwant

The `search_qwant()` function searches Qwant using:
`https://www.qwant.com/?q=<query>`

## Usage

``` r
search_qwant(query = geterrmessage(), rlang = TRUE)
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
[`search_bing()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_bing.md),
[`search_brave()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_brave.md),
[`search_duckduckgo()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_duckduckgo.md),
[`search_ecosia()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_ecosia.md),
[`search_google()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_google.md),
[`search_kagi()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_kagi.md),
[`search_rseek()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_rseek.md),
[`search_startpage()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_startpage.md)

## Examples

``` r
# Search Qwant
search_qwant("Quarto")
#> Please type into your browser:
#> https://www.qwant.com/?q=Quarto%20r%20programming
```
