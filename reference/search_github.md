# Search GitHub

The `search_github()` and `search_gh()` functions both search
[GitHub](https://github.com) using:
`https://github.com/search?q=<query>+language\%3Ar+type\%3Aissue&type=Issues`

## Usage

``` r
search_github(query = geterrmessage(), rlang = TRUE)

search_gh(query = geterrmessage(), rlang = TRUE)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- rlang:

  Search for results written in R. Default is `TRUE`

## Value

The generated search URL or an empty string.

## Details

For additional details regarding [GitHub](https://github.com)'s search
interface please see:
<https://docs.github.com/en/enterprise-cloud@latest/search-github/getting-started-with-searching-on-github/about-searching-on-github>
and
<https://docs.github.com/en/search-github/searching-on-github/searching-code/>

## See also

Other code repositories:
[`search_bitbucket()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_bitbucket.md),
[`search_grep()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/search_grep.md)

## Examples

``` r
# Search GitHub Issues for bivariate normal in the language:r
search_github("bivariate normal")
#> Please type into your browser:
#> https://github.com/search?q=bivariate%20normal%20language%3Ar%20type%3Aissue&type=Issues

# Search all languages on GitHub Issues for bivariate normal
search_github("bivariate normal", rlang = FALSE)
#> Please type into your browser:
#> https://github.com/search?q=bivariate%20normal&type=Issues
```
