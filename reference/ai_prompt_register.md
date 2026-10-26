# Register a New AI Prompt

Adds a new prompt to the prompt library.

## Usage

``` r
ai_prompt_register(name, prompt_text, overwrite = FALSE)
```

## Arguments

- name:

  Name for the new prompt.

- prompt_text:

  The prompt text to register.

- overwrite:

  Whether to overwrite an existing prompt with the same name. Default is
  FALSE.

## Value

Invisibly returns the updated prompt library.

## Examples

``` r
if (FALSE) { # \dontrun{
# Register a new prompt
ai_prompt_register(
  "tidyverse",
  paste("As a tidyverse expert, explain how to solve this problem using",
        "dplyr, tidyr, and other tidyverse packages:"
 )
)
} # }
```
