# searcher: Query Search Interfaces and AI Assistants

Provides search interfaces to look up terms on major search engines
including 'Google', 'Bing', 'DuckDuckGo', 'Startpage', 'Ecosia',
'Brave', 'Kagi', 'rseek', social platforms like 'X' (formerly Twitter),
'BlueSky', 'Mastodon', programming communities such as 'StackOverflow',
'Posit Community', and code repositories including 'GitHub', 'grep.app',
and 'BitBucket'. Additionally, provides direct integration with AI
assistants through specialized query functions for 'ChatGPT', 'Claude
AI', 'Perplexity AI', 'Mistral AI', 'Microsoft Copilot', and 'Meta AI',
complete with an AI prompt management system for R-optimized
interactions. Upon searching or querying, a browser window will open
with the search results or AI interface pre-populated with the specified
query.

## Package Customizations

`searcher` accesses a set of default values stored in
[`options()`](https://rdrr.io/r/base/options.html) on each call to keep
the function signatures small. By default, these options are given as:

- `searcher.launch_delay`: Amount of time to remain in *R* before
  opening a browser window. Default is `0.5` seconds.

- `searcher.use_rstudio_viewer`: Display search results in the RStudio
  viewer pane instead of a web browser. Default is `FALSE`.

- `searcher.default_keyword`: Suffix keyword to generate accurate
  results between either `"base"` or `"tidyverse"`. Default is `"base"`.

- Other options are used to set the default prompts for AI services

  - `searcher.chatgpt_prompt`: Default prompt for OpenAI's ChatGPT.

  - `searcher.claude_prompt`: Default prompt for Anthropic's Claude AI.

  - `searcher.perplexity_prompt`: Default prompt for Perplexity AI.

  - `searcher.mistral_prompt`: Default prompt for Mistral AI's Le Chat.

  - `searcher.bing_copilot_prompt`: Default prompt for Microsoft's
    (Bing) Copilot.

  - `searcher.grok_prompt`: Default prompt for xAI's Grok AI.

  - `searcher.meta_ai_prompt`: Default prompt for Meta's AI.

## See also

Useful links:

- <https://github.com/coatless-rpkg/searcher>

- <https://r-pkg.thecoatlessprofessor.com/searcher/>

- Report bugs at <https://github.com/coatless-rpkg/searcher/issues>

## Author

**Maintainer**: James Balamuta <balamut2@illinois.edu>
([ORCID](https://orcid.org/0000-0003-2826-8458))

Other contributors:

- Alex Rossell Hayes <alexander@rossellhayes.com>
  ([ORCID](https://orcid.org/0000-0001-9412-0457)) \[contributor\]
