#' Open a Web Browser with URL
#'
#' Open a web browser with a given URL.
#'
#' @param base             The URL prefix e.g. `https://google.com/search?q=`
#' @param unencoded_query  An unencoded string that must be encoded with [utils::URLencode()].
#' @param encoded_query    An encoded string that satisifies [utils::URLencode()].
#' @param open_browser  Should the URL be opened in a web browser.
#'
#' @return
#' A `character` object containing the query URL
#'
#' @seealso
#' [utils::browseURL()]
#'
#' @examples
#' # Query Google
#' browse_url("https://www.google.com/search?q=", "rstats is great")
#'
#' # Generate URL for Google (do not open in a web browser)
#' browse_url("https://www.google.com/search?q=", "rstats is great",
#'            open_browser = FALSE)
#'
#' # Print out the hidden url
#' print(browse_url("https://www.google.com/search?q=", "rstats is great",
#'            open_browser = FALSE))
#' @noRd
browse_url = function(base,
                      unencoded_query, encoded_query = "",
                      open_browser = interactive()) {

  url = encode_url(base, unencoded_query, encoded_query)
  if (open_browser) {
    if (is_rstudio() && getOption("searcher.use_rstudio_viewer")) { # nocov start
      open_rstudio_viewer(url)
    } else {
      open_web_browser(url)
    } # nocov end
  } else {
    message("Please type into your browser:\n", invisible(url))
  }

  invisible(url)
}

open_rstudio_viewer = function(url) { # nocov start
  message("Searching query in RStudio's Viewer panel ... ")
  Sys.sleep(getOption("searcher.launch_delay"))

  # If in RStudio, this should be set.
  viewer <- getOption("viewer")
  viewer(url)
} # nocov end

open_web_browser = function(url) { # nocov start
  message("Searching query in a web browser ... ")
  Sys.sleep(getOption("searcher.launch_delay"))
  utils::browseURL(url)
} # nocov end

#' Form Encoded URL
#'
#' Creates a URL with appropriate encoding
#'
#' @param base             The URL prefix e.g. `https://google.com/search?q=`
#' @param unencoded_query  An unencoded string that must be encoded with [utils::URLencode()].
#' @param encoded_query    An encoded string that satisifies [utils::URLencode()].
#'
#' @return
#' A properly formatted URL.
#'
#' @seealso
#' [utils::URLencode()]
#' @noRd
encode_url = function(base, unencoded_query, encoded_query = "") {
  paste0(base, utils::URLencode(unencoded_query), encoded_query)
}

#' Validate search query
#'
#' Ensures that the search query is a valid string
#'
#' @param query Search terms to verify
#'
#' @return Logical value `TRUE` for okay and `FALSE` if not.
#'
#' @seealso [base::missing()], [base::is.null()]
#' @examples
#'
#' # Valid query
#' valid_query("rstats is great")
#'
#' # Not valid queries
#' valid_query()
#' valid_query(NULL)
#' valid_query("")
#' valid_query(c(1,2))
#' @noRd
valid_query = function(query) {
  if(missing(query) || is.null(query) || length(query) != 1 || query == "") {
    FALSE
  } else {
    TRUE
  }
}


#' Append R Search Term Suffix
#'
#' Customizes the query string with an appropriate _R_ specific suffix.
#'
#' @param query  Search terms to verify
#' @param rlang  Append value to query.
#' @param suffix Value to be added to search query. Default `"r programming"`.
#'
#' @return Query string returned as-is or modified with a suffix that
#' ensure results are _R_ oriented.
#'
#' @examples
#'
#' # Add suffix
#' append_search_term_suffix("testing", rlang = TRUE, suffix = "toad")
#'
#' # Retain original search query
#' append_search_term_suffix("testing", rlang = FALSE, suffix = "toad")
#' @noRd
append_search_term_suffix = function(query, rlang = TRUE, suffix = "r programming") {

  if (rlang && !is.null(suffix))
    paste(query, suffix)
  else
    query

}

#' Check if in RStudio
#'
#' Verifies whether the user is using the RStudio IDE.
#'
#' @return
#' A `logical` value indicating whether _R_ is being accessed from the RStudio
#' IDE.
#'
#' @examples
#' # Check if in RStudio
#' is_rstudio()
#'
#' @noRd
is_rstudio = function() {
  Sys.getenv("RSTUDIO") == "1"
}
