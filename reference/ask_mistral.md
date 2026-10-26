# Search with Mistral AI

Launches Mistral AI with your query. Mistral is known for its strong
reasoning capabilities and efficiency.

## Usage

``` r
ask_mistral(query = geterrmessage(), prompt = NULL)

ask_le_chat(query = geterrmessage(), prompt = NULL)
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
[`ask_perplexity()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_perplexity.md)

## Examples

``` r
# Basic query
ask_mistral("How to handle missing data in R?")
#> Using prompts: default (mistral)
#> Please type into your browser:
#> https://chat.mistral.ai/chat?q=As%20an%20R%20expert%2C%20please%20help%20with%20this%20question.%20Include%20code%20examples%20if%20relevant.%20How%20to%20handle%20missing%20data%20in%20R%3F

# Using a custom prompt
ask_mistral("Fix this code: ggplot(mtcars, aes(x=mpg, y=hp) + geom_point()",
            prompt = "Explain the error and fix it:")
#> Using prompts: function call
#> Please type into your browser:
#> https://chat.mistral.ai/chat?q=Explain%20the%20error%20and%20fix%20it%3A%20Fix%20this%20code%3A%20ggplot%28mtcars%2C%20aes%28x%3Dmpg%2C%20y%3Dhp%29%20%2B%20geom_point%28%29
```
