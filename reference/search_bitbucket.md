# Search BitBucket

The `search_bitbucket()` and `search_bb()` functions both search
[BitBucket](https://bitbucket.org) using:
`https://bitbucket.org/search?q=lang\%3Ar+<query>`

## Usage

``` r
search_bitbucket(query = geterrmessage(), rlang = TRUE)

search_bb(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## Details

For additional details regarding [BitBucket](https://bitbucket.org)'s
search interface please see:
<https://confluence.atlassian.com/bitbucket/code-search-in-bitbucket-873876782.html>

## See also

Other code repositories:
[`search_github()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_github.md),
[`search_grep()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_grep.md)

## Examples

``` r
# Search BitBucket for assertions
search_bitbucket("assertions")
#> Please type into your browser:
#> https://bitbucket.com/search?q=assertions%20lang%3Ar

# Search all languages on BitBucket for assertions
search_bitbucket("assertions", rlang = FALSE)
#> Please type into your browser:
#> https://bitbucket.com/search?q=assertions
```
