# AI Prompt Management System

A set of functions to manage and apply prompts for AI search services.
These functions allow you to create, maintain, and use a library of
effective prompts for different AI assistants and scenarios.

## Details

The prompt management system works with multiple levels of prompts:

1.  System-level prompt: Set with
    [`ai_prompt()`](https://r-pkg.thecoatlessprofessor.com/searcher/reference/ai_prompt.md),
    applies across all AI services

2.  Service-specific prompts: Set with
    [`options()`](https://rdrr.io/r/base/options.html) or in function
    calls

3.  Default prompts: Built-in prompts that ship with the package

When a search is performed, prompts are applied in this order, with the
query at the end.
