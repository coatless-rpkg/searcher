# Search with Bing Copilot

Searches Microsoft Bing Copilot, which combines web search results with
AI-generated responses. This makes it useful for queries that benefit
from current web information.

## Usage

``` r
ask_bing_copilot(query = geterrmessage(), prompt = NULL)

ask_copilot(query = geterrmessage(), prompt = NULL)
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
[`ask_chatgpt()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_chatgpt.md),
[`ask_claude()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_claude.md),
[`ask_grok()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_grok.md),
[`ask_meta_ai()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_meta_ai.md),
[`ask_mistral()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_mistral.md),
[`ask_perplexity()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_perplexity.md)

## Examples

``` r
# Basic query
ask_bing_copilot("Latest R package for geospatial analysis")
#> Please type into your browser:
#> https://www.bing.com/search?showconv=1&sendquery=1&q=Latest%20R%20package%20for%20geospatial%20analysis

# Using a custom prompt
ask_bing_copilot("Write a function to calculate the median",
                 prompt = "Show multiple approaches:")
#> Using prompts: function call
#> Please type into your browser:
#> https://www.bing.com/search?showconv=1&sendquery=1&q=Show%20multiple%20approaches%3A%20Write%20a%20function%20to%20calculate%20the%20median
```
