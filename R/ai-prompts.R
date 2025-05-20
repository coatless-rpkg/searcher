#' AI Prompt Management System
#'
#' @description
#' A set of functions to manage and apply prompts for AI search services.
#' These functions allow you to create, maintain, and use a library of
#' effective prompts for different AI assistants and scenarios.
#'
#' @details
#' The prompt management system works with multiple levels of prompts:
#'
#' 1. System-level prompt: Set with `ai_prompt()`, applies across all AI services
#' 2. Service-specific prompts: Set with `options()` or in function calls
#' 3. Default prompts: Built-in prompts that ship with the package
#'
#' When a search is performed, prompts are applied in this order, with the
#' query at the end.
#'
#' @name ai_prompt_management
NULL

# Global variable to store the current system prompt
.searcher_system_prompt <- new.env(parent = emptyenv())
.searcher_system_prompt$active <- NULL
.searcher_system_prompt$name <- NULL

# Default prompt library
.searcher_prompt_library <- list(
  general = "As an R expert, help with the following question or error:",
  debugging = "You are an R debugging expert. First identify what's wrong with this code without fixing it. Then explain why it's wrong and what concept I'm misunderstanding. Finally, provide a working solution with an explanation of why it works.",
  learning = "As an R educator teaching a diverse classroom, explain this concept in multiple ways: 1) Start with an intuitive explanation a beginner would understand, 2) Provide a simple working example, 3) Explain how this concept connects to other R concepts, 4) Show a more advanced practical application with commented code.",
  package_selection = "As an unbiased R consultant familiar with the entire CRAN ecosystem, compare the top 3-4 R packages for this task. For each package, discuss: 1) Key strengths and limitations, 2) Ease of use and learning curve, 3) Community support and maintenance status, 4) Performance characteristics, 5) Unique features. Conclude with situational recommendations.",
  code_review = "As a senior R developer conducting a code review: 1) Note what the code does correctly, 2) Identify potential issues in correctness, performance, readability, and maintainability, 3) Suggest specific improvements with before/after code examples, 4) If relevant, mention R idioms or functions that would simplify the code.",
  stats_analysis = "As both a statistician and R programmer, help me with this analysis task. First, explain the appropriate statistical approach and why it's suitable. Then, provide an R implementation with explanations of each step, how to interpret the outputs, and diagnostic checks.",
  visualization = "As a data visualization expert who specializes in R: 1) Recommend 2-3 visualization types that would best represent this data and explain why, 2) For the most appropriate visualization, provide ggplot2 code with a clear aesthetic mapping rationale, 3) Suggest specific customizations to improve readability."
)

#' Set or View Active System-level AI Prompt
#'
#' @description
#' Sets a system-level prompt to be used with all AI search functions.
#' When called with no arguments, returns the currently active prompt.
#'
#' @param prompt_name Name of a prompt from the prompt library, or a custom prompt text.
#'                   Use `ai_prompt_list()` to see available prompt names.
#'                   If NULL, returns the current active prompt without changing it.
#'
#' @return Invisibly returns the active prompt text. If called without arguments,
#'         returns the active prompt visibly.
#'
#' @examples
#' \dontrun{
#' # Set a predefined prompt
#' ai_prompt("debugging")
#'
#' # Set a custom prompt
#' ai_prompt("Explain this R error in simple terms with examples:")
#'
#' # Check current active prompt
#' ai_prompt()
#'
#' # Clear the system prompt
#' ai_prompt(NULL)
#' }
#'
#' @export
ai_prompt <- function(prompt_name = NULL) {
  # If no prompt_name is provided, return the current active prompt
  if (is.null(prompt_name)) {
    return(ai_prompt_active())
  }

  # If prompt_name is NA, clear the prompt
  if (identical(prompt_name, NA)) {
    .searcher_system_prompt$active <- NULL
    .searcher_system_prompt$name <- NULL
    message("System prompt cleared.")
    return(invisible(NULL))
  }

  # Check if prompt_name is in the library
  if (prompt_name %in% names(.searcher_prompt_library)) {
    prompt_text <- .searcher_prompt_library[[prompt_name]]
    prompt_source <- prompt_name
  } else {
    # Assume it's a custom prompt text
    prompt_text <- prompt_name
    prompt_source <- "custom"
  }

  # Set the prompt
  .searcher_system_prompt$active <- prompt_text
  .searcher_system_prompt$name <- prompt_source

  message("Set system prompt to: ", ifelse(prompt_source == "custom",
                                           "custom prompt",
                                           paste0('"', prompt_source, '"')))
  invisible(prompt_text)
}

#' Get Currently Active System Prompt
#'
#' @description
#' Returns the currently active system-level prompt, if any.
#'
#' @return The active prompt text, or NULL if no system prompt is set.
#'
#' @examples
#' \dontrun{
#' # Check current active prompt
#' ai_prompt_active()
#' }
#'
#' @export
ai_prompt_active <- function() {
  active_prompt <- .searcher_system_prompt$active
  if (is.null(active_prompt)) {
    message("No system prompt is currently active.")
    return(NULL)
  } else {
    source_info <- .searcher_system_prompt$name
    if (source_info == "custom") {
      message("Active system prompt (custom):")
    } else {
      message("Active system prompt (", source_info, "):")
    }
    return(active_prompt)
  }
}

#' List Available AI Prompts
#'
#' @description
#' Lists all available prompts in the prompt library.
#'
#' @return A named list of available prompts.
#'
#' @examples
#' \dontrun{
#' # List all available prompts
#' ai_prompt_list()
#' }
#'
#' @export
ai_prompt_list <- function() {
  if (length(.searcher_prompt_library) == 0) {
    message("No prompts found in the library.")
    return(invisible(NULL))
  }

  cat("Available AI prompts:\n\n")
  for (name in names(.searcher_prompt_library)) {
    cat(sprintf("- %s\n", name))
  }

  invisible(.searcher_prompt_library)
}

#' Register a New AI Prompt
#'
#' @description
#' Adds a new prompt to the prompt library.
#'
#' @param name Name for the new prompt.
#' @param prompt_text The prompt text to register.
#' @param overwrite Whether to overwrite an existing prompt with the same name. Default is FALSE.
#'
#' @return Invisibly returns the updated prompt library.
#'
#' @examples
#' \dontrun{
#' # Register a new prompt
#' ai_prompt_register(
#'   "tidyverse",
#'   paste("As a tidyverse expert, explain how to solve this problem using",
#'         "dplyr, tidyr, and other tidyverse packages:"
#'  )
#' )
#' }
#'
#' @export
ai_prompt_register <- function(name, prompt_text, overwrite = FALSE) {
  if (!is.character(name) || length(name) != 1) {
    stop("Prompt name must be a single character string.")
  }

  if (!is.character(prompt_text) || length(prompt_text) != 1) {
    stop("Prompt text must be a single character string.")
  }

  if (name %in% names(.searcher_prompt_library) && !overwrite) {
    stop("A prompt named '", name, "' already exists. Use overwrite = TRUE to replace it.")
  }

  .searcher_prompt_library[[name]] <- prompt_text
  message("Registered prompt: ", name)
  invisible(.searcher_prompt_library)
}

#' Remove an AI Prompt from the Library
#'
#' @description
#' Removes a prompt from the prompt library.
#'
#' @param name Name of the prompt to remove.
#'
#' @return Invisibly returns the updated prompt library.
#'
#' @examples
#' \dontrun{
#' # Remove a prompt
#' ai_prompt_remove("tidyverse")
#' }
#'
#' @export
ai_prompt_remove <- function(name) {
  if (!name %in% names(.searcher_prompt_library)) {
    stop("No prompt named '", name, "' found in the library.")
  }

  .searcher_prompt_library[[name]] <- NULL
  message("Removed prompt: ", name)

  # If the removed prompt was active, clear it
  if (!is.null(.searcher_system_prompt$name) && .searcher_system_prompt$name == name) {
    .searcher_system_prompt$active <- NULL
    .searcher_system_prompt$name <- NULL
    message("The removed prompt was active and has been cleared.")
  }

  invisible(.searcher_prompt_library)
}

#' Clear the Active System Prompt
#'
#' @description
#' Clears the currently active system-level prompt.
#'
#' @return Invisibly returns NULL.
#'
#' @examples
#' \dontrun{
#' # Clear the system prompt
#' ai_prompt_clear()
#' }
#'
#' @export
ai_prompt_clear <- function() {
  .searcher_system_prompt$active <- NULL
  .searcher_system_prompt$name <- NULL
  message("System prompt cleared.")
  invisible(NULL)
}

# Helper function to get the active prompts with sources
get_prompt_info <- function(service_name, user_prompt) {
  system_prompt <- .searcher_system_prompt$active
  system_prompt_name <- .searcher_system_prompt$name

  service_option_name <- paste0("searcher.", service_name, "_prompt")
  service_default_prompt <- getOption(service_option_name, "")

  prompts <- list()
  prompt_sources <- character()

  # Add system prompt if present
  if (!is.null(system_prompt) && nchar(system_prompt) > 0) {
    prompts <- c(prompts, system_prompt)
    if (system_prompt_name == "custom") {
      prompt_sources <- c(prompt_sources, "system (custom)")
    } else {
      prompt_sources <- c(prompt_sources, paste0("system (", system_prompt_name, ")"))
    }
  }

  # Add user prompt if present, or service default if not
  if (!is.null(user_prompt) && nchar(user_prompt) > 0) {
    prompts <- c(prompts, user_prompt)
    prompt_sources <- c(prompt_sources, "function call")
  } else if (nchar(service_default_prompt) > 0) {
    prompts <- c(prompts, service_default_prompt)
    prompt_sources <- c(prompt_sources, paste0("default (", service_name, ")"))
  }

  list(
    prompts = prompts,
    sources = prompt_sources
  )
}
