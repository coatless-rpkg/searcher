# searcher 0.1.0

## Features

- Added GenAI Search Portals: 
    - `ask_chatgpt()`: Discuss with OpenAI's ChatGPT
    - `ask_claude()`: Discuss with Anthropic's Claude AI
    - `ask_perplexity()`: Discuss with Perplexity AI
    - `ask_mistral()`/`ask_le_chat()`: Discuss with Mistral AI's Le Chat
    - `ask_copilot()`: Discuss with Microsoft Bing's Copilot
    - `ask_xai()`/`ask_grok()`: Discuss with xAI's Grok
    - `ask_meta_ai()`: Discuss with Meta AI
- Added an AI Prompt Management System with Persona Prompts:
    - `ai_prompt()`: Set a prompt for the AI
    - `ai_prompt_active()`: View the active prompt
    - `ai_prompt_clear()`: Clear the active prompt
    - `ai_prompt_list()`: List all prompts
    - `ai_prompt_register()`: Add a custom prompt
    - `ai_prompt_remove()`: Remove a prompt
- Added new vignettes:
    - `using-ai-assistants-with-searcher.Rmd`: Overview of the AI Searching Techniques
    - `managing-ai-prompts.Rmd`: Overview of `searcher`'s AI Prompt Management System
- Added search portals:
    - `search_brave()`: Searches on Brave. 
      ([#42](https://github.com/coatless-rpkg/searcher/pull/42))
    - `search_kagi()`: Searches on Kagi. 
      ([#42](https://github.com/coatless-rpkg/searcher/pull/42))
    - `search_mastodon()`: Searches on Mastodon. 
      ([#45](https://github.com/coatless-rpkg/searcher/pull/45))
    - `search_bluesky()`: Searches on BlueSky. 
      ([#45](https://github.com/coatless-rpkg/searcher/pull/45))
- Added searcher logo ([#40](https://github.com/coatless-rpkg/searcher/pull/40))

## Documentation

### Package Website

- Enhanced `_pkgdown.yml` with a more organized structure and improved navigation
  - Set the theme to use Bootstrap 5's Flatly theme for a modern look
- Added categorized function reference sections for better discoverability

### Function Documentation

- Reorganized search functions into separate help pages by category:
  - Search engines (Google, Bing, etc.)
  - AI assistants (ChatGPT, Claude, etc.)
  - Community sites (StackOverflow, Twitter, etc.) 
  - Code repositories (GitHub, BitBucket, etc.)
- Implemented `@family` tags to group related functions in the "See also" section
- Added more specific, relevant examples for each function
- Added brief descriptions of each AI service's strengths and characteristics

## Deprecations

- Deprecated `search_rstudio_community()` and `search_rscom()` functions. ([#43](https://github.com/coatless-rpkg/searcher/pull/43))
  - These functions are now replaced by `search_posit_community()`/`search_posit()`
    which searches [Posit Community](https://forum.posit.co/search). 

# searcher 0.0.7

## Features

- Added search portals:
    - `search_grep()`: Searches on grep.app. 
      ([#35](https://github.com/coatless-rpkg/searcher/issues/35), 
       [#37](https://github.com/coatless-rpkg/searcher/pull/37))
    - `search_qwant()`: Searches on Qwant. 
      ([#36](https://github.com/coatless-rpkg/searcher/issues/36))

# searcher 0.0.6

## Features

- Added search portals:
    - `search_ecosia()`: Searches on Ecosia. 
      ([#31](https://github.com/coatless-rpkg/searcher/issues/31), 
       [#32](https://github.com/coatless-rpkg/searcher/pull/32))
    - `search_rseek()`: Searches on [rseek](https://rseek.org/). 
      ([#32](https://github.com/coatless-rpkg/searcher/pull/33), thanks [@rossellhayes](https://github.com/rossellhayes)!)
      
## Bug Fixes

- Modified URLs to search engines to pass CRAN checks.
- Removed documentation URLs to Ecosia search engine as they return `404: Not Found`.
      
## Deployment

- Updated [GitHub Actions for R](https://github.com/r-lib/actions) workflows
  ([#34](https://github.com/coatless-rpkg/searcher/pull/34)).
- Added pkgdown website ([#34](https://github.com/coatless-rpkg/searcher/pull/34)).

# searcher 0.0.5

## Features

- Added search portal:
    - `search_twitter()`: Searches on Twitter. 
      ([#19](https://github.com/coatless-rpkg/searcher/issues/19), 
       [#30](https://github.com/coatless-rpkg/searcher/pull/30))
- Added ability to set default package actions.
  ([#7](https://github.com/coatless-rpkg/searcher/issues/7),
   [#20](https://github.com/coatless-rpkg/searcher/pull/20))
  - `searcher.launch_delay` controls how long the user remains in _R_ prior
    to the browser opening. Default is `0.5` seconds.
  - `searcher.use_rstudio_viewer` specifies whether RStudio's viewer pane should
    open the link instead of a web browser. Default is `FALSE` until RStudio's
    [sandbox issue](https://github.com/rstudio/rstudio/issues/2252) is resolved.
  - `searcher.default_keyword`: Suffix keyword to focus search results
    between either `"base"` or `"tidyverse"`. Default is `"base"`.
- Added option to launch RStudio's Viewer pane to display search results.
  - Note: This feature requires a patch per [rstudio/rstudio#2252](https://github.com/rstudio/rstudio/issues/2252). 
  ([#21](https://github.com/coatless-rpkg/searcher/issues/21),
   [#22](https://github.com/coatless-rpkg/searcher/pull/22))

## Breaking Changes

- Function factory or a closure approach-based approach is now used to create
  search portal functions `search_*()` through `searcher()`. 
- `searcher()` function has lost the ability to specify `rlang` to address
  an unevaluated promise issue.
  
## Fixes

- Addressed internal vignette index name being used as the title.

## Deployment

- Switched from using [TravisCI](https://www.travis-ci.com/) to using
  [GitHub Actions for R](https://github.com/r-lib/actions). 
  ([#25](https://github.com/coatless-rpkg/searcher/issues/25),
   [#27](https://github.com/coatless-rpkg/searcher/pull/27))
- Improved code coverage of unit tests ([#29](https://github.com/coatless-rpkg/searcher/pull/29))

# searcher 0.0.4

## Features

- Added search portal:
    - `search_rstudio_community()` or `search_rscom()`: Searches on RStudio Community. 
      (#13, #17)
- Added vignette on search patterns (#18).

## Changes

- Renamed search portal:
    - Changed `search_ixquick()` to `search_startpage()` due to the 
      merging of ixquick into startpage. (#15)
- Update the README overview for the project. (#16)

## Deployment

- Improved TravisCI testing deployments by testing across an array and using
  all CPUs allotted to build the container. (#16)
- Modify thresholding for code coverage rejections. (#16)

# searcher 0.0.3

## Features

- Added search portal:
    - `search_ixquick()`: Searches with ixquick. (#8, #6)

## Changes

- Append `r programming` to major search engines by default (#11, #10)
- Add `ixquick` as a valid engine to `search_site()`. (#8, #6)
- Included link to repository and bug tracker to `DESCRIPTION`.

# searcher 0.0.2

## Features

- Added search portal functions
    - `search_site()`: Looks up search portal and _then_ searches with it.
    - `search_google()`: Searches with [Google](https://www.google.com)
    - `search_bing()`: Searches with [Bing](https://www.bing.com)
    - `search_duckduckgo()` or `search_ddg()`: Searches with [DuckDuckGo](https://duckduckgo.com/)
    - `search_github()` or `search_gh()`: Searches issues on [GitHub](https://github.com/)
    - `search_bitbucket()` or `search_bb()`: Searches issues on [BitBucket](https://bitbucket.org/)
    - `search_stackoverflow()` or `search_so()`: Searches questions on [StackOverflow](https://stackoverflow.com/)
- Add function generator `searcher()` to create function objects that can be
  used as error handlers in `option(error = )` and task call-backs.

## UX

- Created a `browse_url()` that checks to see if it is in interactive mode before
  trying to open a web browser 0.5 seconds after call. 
