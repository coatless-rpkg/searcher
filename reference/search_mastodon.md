# Search Mastodon

The `search_mastodon()` functions search Mastodon using:
`https://mastodon.social/search?q=%23rstats+<query>`

## Usage

``` r
search_mastodon(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## See also

Other community sites:
[`search_bluesky()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_bluesky.md),
[`search_posit_community()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_posit_community.md),
[`search_stackoverflow()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_stackoverflow.md),
[`search_twitter()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_twitter.md)

## Examples

``` r
# Search Mastodon
search_mastodon("searcher")
#> Please type into your browser:
#> https://mastodon.social/search?q=searcher %23rstats
```
