# Search with ChatGPT

Opens a browser with OpenAI's ChatGPT interface and your query. This
function allows you to ask questions, get code help, or search for
information using ChatGPT.

## Usage

``` r
ask_chatgpt(query = geterrmessage(), prompt = NULL)
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
[`ask_claude()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_claude.md),
[`ask_grok()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_grok.md),
[`ask_meta_ai()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_meta_ai.md),
[`ask_mistral()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_mistral.md),
[`ask_perplexity()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ask_perplexity.md)

## Examples

``` r
# Basic query
ask_chatgpt("How to join two dataframes in R?")
#> Using prompts: default (chatgpt)
#> Please type into your browser:
#> https://chat.openai.com/?model=auto&q=You%20are%20an%20R%20programming%20expert.%20Please%20answer%20questions%20concisely%20with%20code%20examples%20when%20appropriate.%20How%20to%20join%20two%20dataframes%20in%20R%3F

# Using a custom prompt
ask_chatgpt("Error: object 'mtcrs' not found",
            prompt = "Debug this error step by step:")
#> Using prompts: function call
#> Please type into your browser:
#> https://chat.openai.com/?model=auto&q=Debug%20this%20error%20step%20by%20step%3A%20Error%3A%20object%20%27mtcrs%27%20not%20found

# Searching the last error
if (FALSE) { # \dontrun{
tryCatch(
  median("not a number"),
  error = function(e) ask_chatgpt()
)
} # }
```
