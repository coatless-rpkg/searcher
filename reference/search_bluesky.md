# Search BlueSky

The `search_bluesky()` functions search BlueSky using:
`https://bsky.app/search?q=%23rstats+<query>`

## Usage

``` r
search_bluesky(query = geterrmessage(), rlang = TRUE)
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
[`search_mastodon()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_mastodon.md),
[`search_posit_community()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_posit_community.md),
[`search_stackoverflow()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_stackoverflow.md),
[`search_twitter()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_twitter.md)

## Examples

``` r
# Search BlueSky
search_bluesky("searcher")
#> Please type into your browser:
#> https://bsky.app/search?q=searcher %23rstats
```
