# Search Startpage

The `search_startpage()` function searches
[startpage](https://startpage.com) using:
`https://startpage.com/do/dsearch?query=<query>`

## Usage

``` r
search_startpage(query = geterrmessage(), rlang = TRUE)

search_sp(query = geterrmessage(), rlang = TRUE)
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
[`search_qwant()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_qwant.md),
[`search_rseek()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_rseek.md)

## Examples

``` r
# Search startpage
search_startpage("VS Code")
#> Please type into your browser:
#> https://startpage.com/do/dsearch?query=VS%20Code%20r%20programming
```
