# Search with Perplexity

Searches with Perplexity AI, which provides answers with citations to
sources. This makes it particularly useful for research-oriented
queries.

## Usage

``` r
ask_perplexity(query = geterrmessage(), prompt = NULL)
```

## Arguments

- query:

  Contents of string to send to AI Service. Default is the last error
  message.

- prompt:

  Optional prompt prefix to add before your query to guide how the AI
  Service responds. If NULL, uses the service-specific default prompt
  option.

## Value

The generated search URL or an empty string.

## See also

Other AI assistants:
[`ask_bing_copilot()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_bing_copilot.md),
[`ask_chatgpt()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_chatgpt.md),
[`ask_claude()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_claude.md),
[`ask_grok()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_grok.md),
[`ask_meta_ai()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_meta_ai.md),
[`ask_mistral()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_mistral.md)

## Examples

``` r
# Basic query
ask_perplexity("Compare dplyr vs data.table")
#> Using prompts: default (perplexity)
#> Please type into your browser:
#> https://www.perplexity.ai/search?q=Answer%20with%20a%20focus%20on%20R%20programming%20and%20statistics.%20Include%20reliable%20sources%20when%20possible.%20Compare%20dplyr%20vs%20data.table&focus=internet&copilot=false

# Using a custom prompt
ask_perplexity("Best packages for time series in R",
               prompt = "Provide citations and compare performance:")
#> Using prompts: function call
#> Please type into your browser:
#> https://www.perplexity.ai/search?q=Provide%20citations%20and%20compare%20performance%3A%20Best%20packages%20for%20time%20series%20in%20R&focus=internet&copilot=false
```
