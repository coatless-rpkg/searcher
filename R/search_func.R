#' Open a Web Browser with URL
#'
#' Open a web browser with a given URL.
#'
#' @param base             The URL prefix e.g. `https://google.com/search?q=`
#' @param unencoded_query  An unencoded string that must be encoded with [utils::URLencode].
#' @param encoded_query    An encoded string that satisifies [utils::URLencode].
#' @importFrom utils browseURL URLencode
#' @seealso [utils::browseURL], [utils::URLencode]
open_browser = function(base, unencoded_query, encoded_query = "") {

  encodedURL = paste0(base, URLencode(unencoded_query), encoded_query)

  browseURL(encodedURL)
}

#' Search a Message Using a Search Engine
#'
#' Searches message using a search engine.
#' @param site  Name of site to search on. Supported options:
#'              `"google"` (default), `"stackoverflow"`, `"github"`, `"bing"`,
#'              `"bitbucket"`
#' @param query Contents of string to search. Default is the error message.
#' @param rlang Search for results written in R. Default is `TRUE`
#' @rdname search_error
#' @export
#' @seealso [search_google], [search_stackoverflow], [search_github],
#'          [search_bing], [search_bitbucket], [search_error], [open_browser]
#' @examples
#' \dontrun{
#' # On error, automatically search the message on google
#' options(error = search_google)
#'
#' # Search in a generic way
#' search_site("google", "r-project")
#'
#' # Search Google
#' search_google("r-project")
#'
#' # Search Bing
#' search_bing("Microsoft R")
#'
#' # Search DuckDuckGo
#' search_duckduckgo("R language")
#'
#' # Search StackOverflow for Convolutions in the r tag
#' search_stackoverflow("convolutions")
#'
#' # Search all languages on StackOverflow for convolutions
#' search_stackoverflow("convolutions", rlang = FALSE)
#'
#' # Search GitHub Issues for bivariate normal in the language:r
#' search_github("bivariate normal")
#'
#' # Search all languages on GitHub Issues for bivariate normal
#' search_github("bivariate normal", rlang = FALSE)
#'
#' # Search BitBucket for assertions
#' search_bitbucket("assertions")
#' }
search_site = function(site, query, rlang = TRUE){
  switch(tolower(site),
         "google"        = search_google(query),
         "stackoverflow" = search_stackoverflow(query, rlang),
         "github"        = search_github(query, rlang),
         "bitbucket"     = search_bitbucket(query, rlang),
         "bing"          = search_bing(query),
         "duckduckgo"    = search_duckduckgo(query),
         search_google(query)
  )
}

#' @rdname search_error
#' @export
#' @section Generic Error Search:
#' The `search_error` function grabs the last error message and
#' tries to search it. This function will ensure that R language
#' is the primary search context.
search_error = function(site, query = geterrmessage()) {
  search_site(site, query, rlang = TRUE)
}

#' @rdname search_error
#' @export
#' @section Google Search:
#' The `search_google` function searches [Google](https://google.com) using:
#' `https://google.com/search?q=<Error>`
#' See <https://moz.com/blog/the-ultimate-guide-to-the-google-search-parameters>
#' for details.
search_google = function(query = geterrmessage()) {
  open_browser("https://google.com/search?q=", query)
}

#' @rdname search_error
#' @export
#' @section Bing Search:
#' The `search_bing` function searches [Bing](https://bing.com) using:
#' `https://bing.com/search?q=<Error>`
search_bing = function(query = geterrmessage()) {
  open_browser("https://bing.com/search?q=", query)
}

#' @rdname search_error
#' @export
#' @section DuckDuckGo Search:
#' The `search_duckduckgo` function searches [DuckDuckGo](https://duckduckgo.com) using:
#' `https://duckduckgo.com/?q=<Error>`
search_duckduckgo = function(query = geterrmessage()) {
  open_browser("https://duckduckgo.com/?q=", query)
}

#' @rdname search_error
#' @export
#' @section StackOverflow Search:
#' The `search_stackoverflow` function searches [StackOverflow](https://stackoverflow.com) using:
#' `https://stackoverflow.com/search?q=%5Br%5D+<Error>`
#' See <https://stackoverflow.com/help/advanced-search-parameters-jobs>
search_stackoverflow = function(query = geterrmessage(), rlang = TRUE) {
  query = if(rlang) paste(query, "[r]") else query
  open_browser("https://stackoverflow.com/search?q=", query)
}

#' @rdname search_error
#' @export
#' @section GitHub Search:
#' The `search_github` function searches [GitHub](https://github.com) using:
#'  `https://github.com/search?q=<Error>+language%3Ar+type%3Aissue&type=Issues`
#' See <https://help.github.com/categories/searching-for-information-on-github/>
#' and <https://help.github.com/articles/searching-code/>
search_github = function(query = geterrmessage(), rlang = TRUE) {
  query = if(rlang) paste(query, "language:r type:issue") else query

  open_browser("https://github.com/search?q=", query, "&type=Issues")
}


#' @rdname search_error
#' @export
#' @section BitBucket Search:
#' The `search_bitbucket` function searches [BitBucket](https://bitbucket.com) using:
#' `https://bitbucket.com/search?q=lang%3Ar+<Error>`
#' See <https://confluence.atlassian.com/bitbucket/code-search-in-bitbucket-873876782.html>
search_bitbucket = function(query = geterrmessage(), rlang = TRUE) {
  query = if(rlang) paste(query, "lang:r") else query
  open_browser("https://bitbucket.com/search?q=", query)
}
