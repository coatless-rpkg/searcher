# Search with Meta AI

Searches Meta AI, which provides general-purpose AI assistance with a
focus on conversational responses.

## Usage

``` r
ask_meta_ai(query = geterrmessage(), prompt = NULL)
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
[`ask_mistral()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_mistral.md),
[`ask_perplexity()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_perplexity.md)

## Examples

``` r
# Basic query
ask_meta_ai("What are the best R packages for visualization?")
#> Please type into your browser:
#> https://www.meta.ai/?q=What%20are%20the%20best%20R%20packages%20for%20visualization%3F

# Using a custom prompt
ask_meta_ai("How to create a heatmap in R",
            prompt = "Compare ggplot2 and base R approaches:")
#> Using prompts: function call
#> Please type into your browser:
#> https://www.meta.ai/?q=Compare%20ggplot2%20and%20base%20R%20approaches%3A%20How%20to%20create%20a%20heatmap%20in%20R
```
