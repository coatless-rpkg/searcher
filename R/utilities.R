#' Open a Web Browser with URL
#'
#' Open a web browser with a given URL.
#'
#' @param base             The URL prefix e.g. `https://google.com/search?q=`
#' @param unencoded_query  An unencoded string that must be encoded with [utils::URLencode()].
#' @param encoded_query    An encoded string that satisifies [utils::URLencode()].
#' @param open_browser     Should the URL be opened in a web browser.
#' @inheritParams utils::browseURL
#' @importFrom utils browseURL URLencode
#' @seealso [utils::browseURL()], [utils::URLencode()]
#' @examples
#'
#' \dontrun{
#' # Query Google
#' browse_url("https://google.com/search?q=", "rstats is great")
#'
#' # Generate URL for Google (do not open in a web browser)
#' browse_url("https://google.com/search?q=", "rstats is great",
#'            open_browser = FALSE)
#' }
#' @noRd
browse_url = function(base,
                      unencoded_query, encoded_query = "",
                      browser = getOption("browser"),
                      open_browser = interactive()) {

  encodedURL = paste0(base, URLencode(unencoded_query), encoded_query)

  if (open_browser) {
    message("Searching query in web browser ... ")
    Sys.sleep(0.5)
    browseURL(encodedURL)
  } else {
    message("Please type into your browser: ", invisible(encodedURL))
  }

  invisible(encodedURL)
}
