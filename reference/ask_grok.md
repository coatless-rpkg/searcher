# Search with Grok

Searches xAI's Grok, which provides AI assistance focused on maximize
truth and objectivity.

## Usage

``` r
ask_grok(query = geterrmessage(), prompt = NULL)

ask_xai(query = geterrmessage(), prompt = NULL)
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
[`ask_meta_ai()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_meta_ai.md),
[`ask_mistral()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_mistral.md),
[`ask_perplexity()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_perplexity.md)

## Examples

``` r
# Basic query
ask_grok("What are the best practices for R package development?")
#> Using prompts: default (grok)
#> Please type into your browser:
#> https://www.grok.com/?q=As%20an%20R%20programming%20assistant%2C%20provide%20clear%20and%20concise%20answers%20with%20practical%20examples.%20What%20are%20the%20best%20practices%20for%20R%20package%20development%3F

# Using a custom prompt
ask_grok("How to optimize this R code for performance?",
                 prompt = "Focus on efficiency and best practices:")
#> Using prompts: function call
#> Please type into your browser:
#> https://www.grok.com/?q=Focus%20on%20efficiency%20and%20best%20practices%3A%20How%20to%20optimize%20this%20R%20code%20for%20performance%3F
```
