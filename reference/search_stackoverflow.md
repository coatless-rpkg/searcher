# Search StackOverflow

The `search_stackoverflow()` and `search_so()` functions both search
[StackOverflow](https://stackoverflow.com) using:
`https://stackoverflow.com/search?q=\%5Br\%5D+<query>`

## Usage

``` r
search_stackoverflow(query = geterrmessage(), rlang = TRUE)

search_so(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## Details

For additional details regarding
[StackOverflow](https://stackoverflow.com)'s search interface please
see:

    https://stackoverflow.com/help/searching

## See also

Other community sites:
[`search_bluesky()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_bluesky.md),
[`search_mastodon()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_mastodon.md),
[`search_posit_community()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_posit_community.md),
[`search_twitter()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_twitter.md)

## Examples

``` r
# Search StackOverflow for Convolutions in the r tag
search_stackoverflow("convolutions")
#> Please type into your browser:
#> https://stackoverflow.com/search?q=convolutions%20%5Br%5D

# Search all languages on StackOverflow for convolutions
search_stackoverflow("convolutions", rlang = FALSE)
#> Please type into your browser:
#> https://stackoverflow.com/search?q=convolutions
```
