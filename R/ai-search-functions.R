#' Searcher Function Generator for AI Services
#'
#' Creates a search function specifically for interacting with AI services.
#' Unlike regular search functions, AI searchers support custom prompts
#' that can guide how the AI responds to queries.
#'
#' @param site Name of the site to search on (e.g., "chatgpt", "claude")
#'
#' @return A function that can be used to search the specified AI service with optional
#'         prompt customization
#' @keywords internal
#'
#' @details
#' The returned function will apply prompts in the following priority order:
#'
#' 1. System-level prompt set via `ai_prompt()` (if any)
#' 2. Function call prompt or service-specific option
#' 3. The query itself
#'
#' The returned function accepts two parameters:
#'
#' - `query`: The question or request to send to the AI (defaults to last error message)
#' - `prompt`: Custom prompt to guide the AI's response (optional)
#'
#' @keywords internal
#' @include index-sites.R
ai_searcher = function(site) {

  entry = site_details(site)
  site_name = tolower(site)

  function(query = geterrmessage(), prompt = NULL) {

    if (!valid_query(query)) {
      message("`query` must contain only 1 element that is not empty.")
      return(invisible(""))
    }

    # Get prompt information
    prompt_info <- get_prompt_info(site_name, prompt)
    prompts <- prompt_info$prompts
    sources <- prompt_info$sources

    # Display information about which prompts are being used
    if (length(prompts) > 0) {
      message("Using prompts: ", paste(sources, collapse = ", "))
    }

    # Combine all prompts and the query
    if (length(prompts) > 0) {
      combined_prompt <- paste(prompts, collapse = " ")
      query <- paste0(combined_prompt, " ", query)
    }

    # AI search doesn't use the R language suffix - directly use the query
    browse_url(entry$site_url, query, entry$suffix)
  }
}

########################### Start Search with Generative AI

#' Search with ChatGPT
#'
#' Opens a browser with OpenAI's ChatGPT interface and your query.
#' This function allows you to ask questions, get code help,
#' or search for information using ChatGPT.
#'
#' @param query Contents of string to send to AI Service. Default is the last error message.
#' @param prompt Optional prompt prefix to add before your query to guide how the AI Service
#'        responds. If NULL, uses the service-specific default prompt option.
#'
#' @return The generated search URL or an empty string.
#'
#' @export
#' @family AI assistants
#' @examples
#' # Basic query
#' ask_chatgpt("How to join two dataframes in R?")
#'
#' # Using a custom prompt
#' ask_chatgpt("Error: object 'mtcrs' not found",
#'             prompt = "Debug this error step by step:")
#'
#' # Searching the last error
#' \dontrun{
#' tryCatch(
#'   median("not a number"),
#'   error = function(e) ask_chatgpt()
#' )
#' }
ask_chatgpt = ai_searcher("chatgpt")

#' Search with Claude
#'
#' Opens Anthropic's Claude AI assistant with your query.
#' Claude can provide thorough answers to complex questions
#' and offers excellent code explanations.
#'
#' @inheritParams ask_chatgpt
#' @return The generated search URL or an empty string.
#'
#' @export
#' @family AI assistants
#' @examples
#' # Basic query
#' ask_claude("Explain what purrr::map_df does")
#'
#' # Using a custom prompt
#' ask_claude("Compare tidyr::pivot_wider vs tidyr::spread",
#'            prompt = "Provide examples of when to use each:")
ask_claude = ai_searcher("claude")

#' Search with Perplexity
#'
#' Searches with Perplexity AI, which provides answers with
#' citations to sources. This makes it particularly
#' useful for research-oriented queries.
#'
#' @inheritParams ask_chatgpt
#' @return The generated search URL or an empty string.
#'
#' @export
#' @family AI assistants
#' @examples
#' # Basic query
#' ask_perplexity("Compare dplyr vs data.table")
#'
#' # Using a custom prompt
#' ask_perplexity("Best packages for time series in R",
#'                prompt = "Provide citations and compare performance:")
ask_perplexity = ai_searcher("perplexity")

#' Search with Mistral AI
#'
#' Launches Mistral AI with your query. Mistral is known for
#' its strong reasoning capabilities and efficiency.
#'
#' @inheritParams ask_chatgpt
#' @return The generated search URL or an empty string.
#'
#' @export
#' @family AI assistants
#' @examples
#' # Basic query
#' ask_mistral("How to handle missing data in R?")
#'
#' # Using a custom prompt
#' ask_mistral("Fix this code: ggplot(mtcars, aes(x=mpg, y=hp) + geom_point()",
#'             prompt = "Explain the error and fix it:")
ask_mistral = ai_searcher("mistral")

#' Search with Bing Copilot
#'
#' Searches Microsoft Bing Copilot, which combines web search results
#' with AI-generated responses. This makes it useful for queries that
#' benefit from current web information.
#'
#' @inheritParams ask_chatgpt
#' @return The generated search URL or an empty string.
#'
#' @export
#' @family AI assistants
#' @examples
#' # Basic query
#' ask_bing_copilot("Latest R package for geospatial analysis")
#'
#' # Using a custom prompt
#' ask_bing_copilot("Write a function to calculate the median",
#'                  prompt = "Show multiple approaches:")
ask_bing_copilot = ai_searcher("copilot")

#' @rdname ask_bing_copilot
#' @export
ask_copilot = ask_bing_copilot

#' Search with Grok
#'
#' Searches xAI's Grok, which provides AI assistance focused on
#' maximize truth and objectivity.
#'
#' @inheritParams ask_chatgpt
#' @return The generated search URL or an empty string.
#'
#' @export
#' @family AI assistants
#' @examples
#' # Basic query
#' ask_grok("What are the best practices for R package development?")
#'
#' # Using a custom prompt
#' ask_grok("How to optimize this R code for performance?",
#'                  prompt = "Focus on efficiency and best practices:")
ask_grok = ai_searcher("grok")

#' Search with Meta AI
#'
#' Searches Meta AI, which provides general-purpose AI assistance
#' with a focus on conversational responses.
#'
#' @inheritParams ask_chatgpt
#' @return The generated search URL or an empty string.
#'
#' @export
#' @family AI assistants
#' @examples
#' # Basic query
#' ask_meta_ai("What are the best R packages for visualization?")
#'
#' # Using a custom prompt
#' ask_meta_ai("How to create a heatmap in R",
#'             prompt = "Compare ggplot2 and base R approaches:")
ask_meta_ai = ai_searcher("meta")

########################### End Search with Generative AI
