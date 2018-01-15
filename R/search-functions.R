#' Search a Query on a Search Portal in a Web Browser
#'
#' Creates an appropriate query string for a search engine and then opens
#' up the resulting page in a web browser.
#'
#' @param site  Name of site to search on. Supported options:
#'              `"google"` (default), `"stackoverflow"`, `"github"`, `"bing"`,
#'              `"bitbucket"`
#' @param query Contents of string to search. Default is the error message.
#' @param rlang Search for results written in R. Default is `TRUE`
#'
#' @return The generated search URL or an empty string.
#'
#' @rdname search_site
#' @export
#' @seealso [search_google()], [search_stackoverflow()], [search_github()],
#'          [search_bing()], [search_bitbucket()], [searcher()]
#' @examples
#' # Search in a generic way
#' search_site("r-project", "google")
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
#'
#' \dontrun{
#' # On error, automatically search the message on google
#' options(error = searcher("google"))
#' options(error = search_google)
#' }
search_site = function(query,
                       site = c(
                         "google",
                         "bing",
                         "stackoverflow",
                         "so",
                         "github",
                         "gh",
                         "duckduckgo",
                         "ddg",
                         "bitbucket",
                         "bb"
                       ),
                       rlang = TRUE) {
  site = tolower(site)
  site = match.arg(site)

  switch(
    site,
    google         = search_google(query),
    stackoverflow  = ,
    # empty case carried below
    so             = search_stackoverflow(query, rlang),
    github         = ,
    # empty case carried below
    gh             = search_github(query, rlang),
    bitbucket      = ,
    # empty case carried below
    bb             = search_bitbucket(query, rlang),
    bing           = search_bing(query),
    duckduckgo     = ,
    # empty case carried below
    ddg            = search_duckduckgo(query),
    search_google(query)
  )
}

#' Generate a Searcher function for use with Error Handling
#'
#' Constructs a function object that will search the last
#' R error message on search portals by opening a
#' browser.
#'
#' @inheritParams search_site
#' @export
#' @section Generic Error Search:
#' The `searcher` function grabs the last error message and
#' tries to search it. This function will ensure that R language
#' is the primary search context.
#'
#' @details
#' This function acts as a closure. Thus, you will receive
#' a function back when only specifying the `site` parameter.
#' To call the function, add a second set of parentheses.
#'
#' @examples
#' ### Manually
#' searcher("google")()
#'
#' \dontrun{
#' ### Automatically
#' # On error, automatically search the message on google
#' options(error = searcher("google"))
#' }
searcher = function(site  = c(
  "google",
  "bing",
  "ddg",
  "so",
  "gh",
  "bb",
  "duckduckgo",
  "stackoverflow",
  "github",
  "bitbucket"
),
rlang = TRUE) {
  function(query = geterrmessage()) {
    search_site(query, site, rlang = rlang)
  }
}

#' @rdname search_site
#' @export
#' @section Google Search:
#' The `search_google` function searches [Google](https://google.com) using:
#' `https://google.com/search?q=<query>`
#'
#' See \url{https://moz.com/blog/the-ultimate-guide-to-the-google-search-parameters}
#' for details.
search_google = function(query = geterrmessage()) {
  if (!valid_query(query)) {
    message("Please provide only 1 `query` term that is not empty.")
    return(invisible(""))
  }

  browse_url("https://google.com/search?q=", query)
}

#' @rdname search_site
#' @export
#' @section Bing Search:
#' The `search_bing()` function searches [Bing](https://bing.com) using:
#' `https://bing.com/search?q=<query>`
search_bing = function(query = geterrmessage()) {
  if (!valid_query(query)) {
    message("Please provide only 1 `query` term that is not empty.")
    return(invisible(""))
  }

  browse_url("https://bing.com/search?q=", query)
}

#' @rdname search_site
#' @export
#' @section DuckDuckGo Search:
#' The `search_duckduckgo()` and `search_ddg()` functions both search
#' [DuckDuckGo](https://duckduckgo.com) using: `https://duckduckgo.com/?q=<query>`
search_duckduckgo = function(query = geterrmessage()) {
  if (!valid_query(query)) {
    message("Please provide only 1 `query` term that is not empty.")
    return(invisible(""))
  }

  browse_url("https://duckduckgo.com/?q=", query)
}

#' @rdname search_site
#' @export
search_ddg = search_duckduckgo

#' @rdname search_site
#' @export
#' @section StackOverflow Search:
#' The `search_stackoverflow()` and `search_so()` functions both search
#' [StackOverflow](https://stackoverflow.com) using:
#' \code{https://stackoverflow.com/search?q=\%5Br\%5D+<query>}
#'
#' For additional details regarding [StackOverflow](https://stackoverflow.com)'s
#' search interface please see:
#'  \url{https://stackoverflow.com/help/advanced-search-parameters-jobs}
search_stackoverflow = function(query = geterrmessage(), rlang = TRUE) {
  if (!valid_query(query)) {
    message("Please provide only 1 `query` term that is not empty.")
    return(invisible(""))
  }

  query = if (rlang)
    paste(query, "[r]")
  else
    query
  browse_url("https://stackoverflow.com/search?q=", query)
}

#' @rdname search_site
#' @export
search_so = search_stackoverflow

#' @rdname search_site
#' @export
#' @section GitHub Search:
#' The `search_github()` and `search_gh()` functions both search
#' [GitHub](https://github.com) using:
#' \code{https://github.com/search?q=<query>+language\%3Ar+type\%3Aissue&type=Issues}
#'
#' For additional details regarding [GitHub](https://github.com)'s
#' search interface please see:
#' \url{https://help.github.com/categories/searching-for-information-on-github/}
#' and \url{https://help.github.com/articles/searching-code/}
search_github = function(query = geterrmessage(), rlang = TRUE) {
  if (!valid_query(query)) {
    message("Please provide only 1 `query` term that is not empty.")
    return(invisible(""))
  }

  query = if (rlang)
    paste(query, "language:r type:issue")
  else
    query

  browse_url("https://github.com/search?q=", query, "&type=Issues")
}

#' @rdname search_site
#' @export
search_gh = search_github


#' @rdname search_site
#' @export
#' @section BitBucket Search:
#' The `search_bitbucket()` and `search_bb()` functions both search
#' [BitBucket](https://bitbucket.com) using:
#'  \code{https://bitbucket.com/search?q=lang\%3Ar+<query>}
#'
#' For additional details regarding [BitBucket](https://bitbucket.com)'s
#' search interface please see:
#'  \url{https://confluence.atlassian.com/bitbucket/code-search-in-bitbucket-873876782.html}
search_bitbucket = function(query = geterrmessage(), rlang = TRUE) {
  if (!valid_query(query)) {
    message("Please provide only 1 `query` term that is not empty.")
    return(invisible(""))
  }

  query = if (rlang)
    paste(query, "lang:r")
  else
    query
  browse_url("https://bitbucket.com/search?q=", query)
}

#' @rdname search_site
#' @export
search_bb = search_bitbucket
