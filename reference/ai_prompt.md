# Set or View Active System-level AI Prompt

Sets a system-level prompt to be used with all AI search functions. When
called with no arguments, returns the currently active prompt.

## Usage

``` r
ai_prompt(prompt_name = NULL)
```

## Arguments

- prompt_name:

  Name of a prompt from the prompt library, or a custom prompt text. Use
  [`ai_prompt_list()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ai_prompt_list.md)
  to see available prompt names. If NULL, returns the current active
  prompt without changing it.

## Value

Invisibly returns the active prompt text. If called without arguments,
returns the active prompt visibly.

## Examples

``` r
if (FALSE) { # \dontrun{
# Set a predefined prompt
ai_prompt("debugging")

# Set a custom prompt
ai_prompt("Explain this R error in simple terms with examples:")

# Check current active prompt
ai_prompt()

# Clear the system prompt
ai_prompt(NULL)
} # }
```
