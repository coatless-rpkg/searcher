# Search with Claude

Opens Anthropic's Claude AI assistant with your query. Claude can
provide thorough answers to complex questions and offers excellent code
explanations.

## Usage

``` r
ask_claude(query = geterrmessage(), prompt = NULL)
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
[`ask_grok()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_grok.md),
[`ask_meta_ai()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_meta_ai.md),
[`ask_mistral()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_mistral.md),
[`ask_perplexity()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_perplexity.md)

## Examples

``` r
# Basic query
ask_claude("Explain what purrr::map_df does")
#> Using prompts: default (claude)
#> Please type into your browser:
#> https://claude.ai/new?q=You%20are%20an%20R%20programming%20assistant.%20Focus%20on%20providing%20clear%20explanations%20and%20efficient%20code%20solutions.%20Explain%20what%20purrr%3A%3Amap_df%20does

# Using a custom prompt
ask_claude("Compare tidyr::pivot_wider vs tidyr::spread",
           prompt = "Provide examples of when to use each:")
#> Using prompts: function call
#> Please type into your browser:
#> https://claude.ai/new?q=Provide%20examples%20of%20when%20to%20use%20each%3A%20Compare%20tidyr%3A%3Apivot_wider%20vs%20tidyr%3A%3Aspread
```
