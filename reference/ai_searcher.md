# Searcher Function Generator for AI Services

Creates a search function specifically for interacting with AI services.
Unlike regular search functions, AI searchers support custom prompts
that can guide how the AI responds to queries.

## Usage

``` r
ai_searcher(site)
```

## Arguments

- site:

  Name of the site to search on (e.g., "chatgpt", "claude")

## Value

A function that can be used to search the specified AI service with
optional prompt customization

## Details

The returned function will apply prompts in the following priority
order:

1.  System-level prompt set via
    [`ai_prompt()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ai_prompt.md)
    (if any)

2.  Function call prompt or service-specific option

3.  The query itself

The returned function accepts two parameters:

- `query`: The question or request to send to the AI (defaults to last
  error message)

- `prompt`: Custom prompt to guide the AI's response (optional)
