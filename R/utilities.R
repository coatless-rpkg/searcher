#' Open a Web Browser with URL
#'
#' Open a web browser with a given URL.
#'
#' @param base             The URL prefix e.g. `https://google.com/search?q=`
#' @param unencoded_query  An unencoded string that must be encoded with [utils::URLencode()].
#' @param encoded_query    An encoded string that satisifies [utils::URLencode()].
#' @param open_browser     Should the URL be opened in a web browser.
#' @inheritParams utils::browseURL
#'
#' @return A `character` object containing the query URL
#'
#' @seealso [utils::browseURL()], [utils::URLencode()]
#' @examples
#' # Query Google
#' browse_url("https://google.com/search?q=", "rstats is great")
#'
#' # Generate URL for Google (do not open in a web browser)
#' browse_url("https://google.com/search?q=", "rstats is great",
#'            open_browser = FALSE)
#'
#' # Print out the hidden url
#' print(browse_url("https://google.com/search?q=", "rstats is great",
#'            open_browser = FALSE))
#' @noRd
browse_url = function(base,
                      unencoded_query, encoded_query = "",
                      browser = getOption("browser"),
                      open_browser = interactive()) {

  encodedURL = paste0(base, utils::URLencode(unencoded_query), encoded_query)

  if (open_browser) {
    message("Searching query in web browser ... ")
    Sys.sleep(0.5)
    utils::browseURL(encodedURL)
  } else {
    message("Please type into your browser: \n", invisible(encodedURL))
  }

  invisible(encodedURL)
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
#' @param suffix Value to be added to search query. Default `r programming`.
#'
#' @return Query string returned as-is or modified with a suffix that
#' ensure results are _R_ oriented.
#'
#' @examples
#'
#' # Add suffix
#' append_r_suffix("testing", rlang = TRUE, suffix = "toad")
#'
#' # Retain original search query
#' append_r_suffix("testing", rlang = FALSE, suffix = "toad")
#' @noRd
append_r_suffix = function(query, rlang = TRUE, suffix = "r programming") {
  if (rlang)
    paste(query, suffix)
  else
    query
}
