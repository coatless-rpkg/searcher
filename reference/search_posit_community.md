# Search Posit Community

The `search_posit_community()` and `search_posit()` functions both
search [Posit Community](https://forum.posit.co/) using:
`https://forum.posit.co/search?q=<query>`

## Usage

``` r
search_posit_community(query = geterrmessage(), rlang = TRUE)

search_posit(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## Details

For additional details regarding [Posit
Community](https://forum.posit.co/)'s search interface please see the
[Discourse](https://discourse.org) API documentation:
<https://docs.discourse.org/#tag/Search>

## See also

Other community sites:
[`search_bluesky()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_bluesky.md),
[`search_mastodon()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_mastodon.md),
[`search_stackoverflow()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_stackoverflow.md),
[`search_twitter()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_twitter.md)

## Examples

``` r
# Search Posit Community
search_posit_community("RStudio IDE")
#> Please type into your browser:
#> https://forum.posit.co/search?q=RStudio%20IDE
```
