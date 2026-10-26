# Generate a Searcher function for use with Error Handling

Constructs a function object that will search the last R error message
on search portals by opening a browser.

## Usage

``` r
searcher(site, keyword = getOption("searcher.default_keyword"))
```

## Arguments

- site:

  Name of site to search on. Supported options: `"google"` (default),
  `"bing"`, `"duckduckgo"` or `"ddg"`, `"startpage"` (formerly
  `"ixquick"`) or `"sp"`, `"qwant"`, `"rseek"`, `"brave"`, `"kagi"`,
  `"posit community"` (formerly `"rstudio community"`) or `"posit"`,
  `"twitter"` or `"x"`, `"bluesky"`, `"mastodon"`, `"stackoverflow"`,
  `"github"`, `"grep"`, `"bitbucket"`, `"chatgpt"`, `"claude"`,
  `"perplexity"`, `"mistral"` or `"le chat"`, `"bing copilot"` or
  `"copilot"`, and `"grok"` or `"xai"`, `"meta ai"` or `"meta"`.

- keyword:

  Opt to search under different default terms.

## Details

This function acts as a closure. Thus, you will receive a function back
when only specifying the `site` parameter. To call the function, add a
second set of parentheses.

## Generic Error Search

The `searcher` function grabs the last error message and tries to search
it. This function will ensure that R language is the primary search
context.

## Examples

``` r
### Manually
searcher("google")()
#> Please type into your browser:
#> https://google.com/search?q=test.r%3A1%3A1%3A%20unexpected%20%27%3C%27%0A1%3A%20%3C%0A%20%20%20%20%5E%20r%20programming

if (FALSE) { # \dontrun{
### Automatically
# On error, automatically search the message on google
options(error = searcher("google"))
} # }
```
