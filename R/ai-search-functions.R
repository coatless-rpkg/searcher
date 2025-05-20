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

#' Search Generative AI Services from R
#'
#' Opens a browser to query various generative AI assistants directly from R.
#' These functions allow you to ask questions, get code help, or search for information
#' using popular AI services.
#'
#' @param query Contents of string to send to the AI. Default is the last error message.
#' @param prompt Optional prompt prefix to add before your query to guide how the AI
#'        responds. If NULL, uses the service-specific default prompt option.
#'
#' @return The generated search URL or an empty string.
#'
#' @rdname search_genai
#' @export
#' @seealso [search_site()]
#' @examples
#' \dontrun{
#' # Basic AI queries
#' ask_chatgpt("How to join two dataframes in R?")
#' ask_claude("Explain what purrr::map_df does")
#' ask_perplexity("Compare dplyr vs data.table")
#'
#' # Using custom prompts
#' ask_mistral("Find bug: ggplot(mtcars, aes(x=mpg, y=hp) + geom_point()",
#'              prompt = "Debug this code step by step:")
#'
#' # Searching the last error
#' tryCatch(
#'   median("not a number"),
#'   error = function(e) ask_chatgpt()
#' )
#'
#' # Setting default prompts
#' options(
#'   searcher.chatgpt_prompt = "You are an R viz expert. Help with:",
#'   searcher.claude_prompt = "As an R statistics expert, answer:"
#' )
#' }
#'
#' @section ChatGPT Search:
#' The `ask_chatgpt()` function opens a browser with OpenAI's ChatGPT interface and your query using:
#' `https://chat.openai.com/?model=auto&q=<query>`
#'
#' You can customize the AI's behavior by setting a prompt prefix through:
#' 1. The `prompt` parameter for per-call customization
#' 2. The `options(searcher.chatgpt_prompt = "...")` setting for persistent customization
ask_chatgpt = ai_searcher("chatgpt")

#' @rdname search_genai
#' @export
#' @section Claude Search:
#' The `ask_claude()` function opens Anthropic's Claude AI assistant with your query using:
#' `https://claude.ai/new?q=<query>`
#'
#' Claude can be directed to respond in specific ways by using the prompt parameter or by
#' setting a default prompt via `options()`.
ask_claude = ai_searcher("claude")

#' @rdname search_genai
#' @export
#' @section Perplexity Search:
#' The `ask_perplexity()` function searches with Perplexity AI using:
#' `https://www.perplexity.ai/search?q=<query>&focus=internet&copilot=false`
#'
#' Perplexity AI provides answers with citations to sources, making it particularly
#' useful for research-oriented queries.
ask_perplexity = ai_searcher("perplexity")

#' @rdname search_genai
#' @export
#' @section Mistral Search:
#' The `ask_mistral()` function launches Mistral AI with your query using:
#' `https://chat.mistral.ai/chat?q=<query>`
#'
#' The default prompt can be customized through the `searcher.mistral_prompt` option.
ask_mistral = ai_searcher("mistral")

#' @rdname search_genai
#' @export
#' @section Bing Copilot Search:
#' The `ask_bing_copilot()` and `search_copilot()` functions both search
#' Microsoft Bing Copilot using:
#' `https://www.bing.com/search?showconv=1&sendquery=1&q=<query>`
#'
#' Bing Copilot combines search results with AI-generated responses, making it
#' useful for queries that benefit from web information.
ask_bing_copilot = ai_searcher("copilot")

#' @rdname search_genai
#' @export
ask_copilot = ask_bing_copilot

#' @rdname search_genai
#' @export
#' @section Meta AI Search:
#' The `ask_meta_ai()` function searches Meta AI using:
#' `https://www.meta.ai/?q=<query>`
#'
#' Meta AI provides general-purpose AI assistance with a focus on conversational
#' responses.
ask_meta_ai = ai_searcher("meta")

########################### End Search with Generative AI
