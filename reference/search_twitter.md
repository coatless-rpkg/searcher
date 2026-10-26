# Search Twitter/X

The `search_twitter()` functions search Twitter using:
`https://twitter.com/search?q=<query>`

## Usage

``` r
search_twitter(query = geterrmessage(), rlang = TRUE)

search_x(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## Details

For additional details regarding Twitter's search interface please see:
<https://help.x.com/en/using-x/x-advanced-search>

## See also

Other community sites:
[`search_bluesky()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_bluesky.md),
[`search_mastodon()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_mastodon.md),
[`search_posit_community()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_posit_community.md),
[`search_stackoverflow()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_stackoverflow.md)

## Examples

``` r
# Search Twitter
search_twitter("searcher")
#> Please type into your browser:
#> https://twitter.com/search?q=searcher %23rstats
```
