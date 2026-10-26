# Search a Query on a Search Portal in a Web Browser

Creates an appropriate query string for a search engine and then opens
up the resulting page in a web browser.

## Usage

``` r
search_site(
  query,
  site = c("google", "bing", "duckduckgo", "ddg", "startpage", "sp", "qwant", "rseek",
    "brave", "kagi", "posit community", "posit", "twitter", "x", "bluesky", "mastodon",
    "stackoverflow", "so", "github", "gh", "grep", "bitbucket", "bb", "chatgpt",
    "claude", "perplexity", "mistral", "bing copilot", "copilot", "grok", "meta ai",
    "meta"),
  rlang = TRUE,
  prompt = NULL
)
```

## Arguments

- query:

  Contents of string to search. Default is the error message.

- site:

  Name of site to search on. Supported options: `"google"` (default),
  `"bing"`, `"duckduckgo"` or `"ddg"`, `"startpage"` (formerly
  `"ixquick"`) or `"sp"`, `"qwant"`, `"rseek"`, `"brave"`, `"kagi"`,
  `"posit community"` (formerly `"rstudio community"`) or `"posit"`,
  `"twitter"` or `"x"`, `"bluesky"`, `"mastodon"`, `"stackoverflow"`,
  `"github"`, `"grep"`, `"bitbucket"`, `"chatgpt"`, `"claude"`,
  `"perplexity"`, `"mistral"` or `"le chat"`, `"bing copilot"` or
  `"copilot"`, and `"grok"` or `"xai"`, `"meta ai"` or `"meta"`.

- rlang:

  Search for results written in R. Default is `TRUE`

- prompt:

  Optional prompt prefix to add before your query to guide how the AI
  responds. If `NULL`, uses the service-specific default prompt option.

## Value

The generated search URL or an empty string.

## Examples

``` r
# Search in a generic way
search_site("r-project", "google")
#> Please type into your browser:
#> https://google.com/search?q=r-project%20r%20programming
```
