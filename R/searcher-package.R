#' @aliases searcher-package
#' @section Package Customizations:
#'
#' `searcher` accesses a set of default values stored in [options()] on each
#' call to keep the function signatures small. By default, these options are given as:
#'
#' - `searcher.launch_delay`: Amount of time to remain in _R_ before opening
#'    a browser window. Default is `0.5` seconds.
#' - `searcher.use_rstudio_viewer`: Display search results in the RStudio
#'    viewer pane instead of a web browser. Default is `FALSE`.
#' - `searcher.default_keyword`: Suffix keyword to generate accurate results
#'    between either `"base"` or `"tidyverse"`. Default is `"base"`.
#' - Other options are used to set the default prompts for AI services
#'   - `searcher.chatgpt_prompt`: Default prompt for OpenAI's ChatGPT.
#'   - `searcher.claude_prompt`: Default prompt for Anthropic's Claude AI.
#'   - `searcher.perplexity_prompt`: Default prompt for Perplexity AI.
#'   - `searcher.mistral_prompt`: Default prompt for Mistral AI's Le Chat.
#'   - `searcher.bing_copilot_prompt`: Default prompt for Microsoft's (Bing) Copilot.
#'   - `searcher.grok_prompt`: Default prompt for xAI's Grok AI.
#'   - `searcher.meta_ai_prompt`: Default prompt for Meta's AI.
#'
"_PACKAGE"

searcher_default_options = list(
  searcher.launch_delay = 0.5,
  searcher.use_rstudio_viewer = FALSE,
  searcher.default_keyword = "base",

  # Default AI prompts
  searcher.chatgpt_prompt = "You are an R programming expert. Please answer questions concisely with code examples when appropriate.",
  searcher.claude_prompt = "You are an R programming assistant. Focus on providing clear explanations and efficient code solutions.",
  searcher.perplexity_prompt = "Answer with a focus on R programming and statistics. Include reliable sources when possible.",
  searcher.mistral_prompt = "As an R expert, please help with this question. Include code examples if relevant.",
  searcher.bing_copilot_prompt = "Please help with this R programming question. Provide working code examples.",
  searcher.grok_prompt = "As an R programming assistant, provide clear and concise answers with practical examples.",
  searcher.meta_ai_prompt = "You're an R programming assistant. Answer questions with practical examples."
)

.onLoad = function(libname, pkgname) {
  # Retrieve options
  options_active = options()

  # Determine if defaults are missing
  missing_defaults = !(names(searcher_default_options) %in% names(options_active))

  # Set any missing default options
  if (any(missing_defaults)) {
    options(searcher_default_options[missing_defaults])
  }

  invisible()
}
