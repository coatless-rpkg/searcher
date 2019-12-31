#' Search a Query on a Search Portal in a Web Browser
#'
#' Creates an appropriate query string for a search engine and then opens
#' up the resulting page in a web browser.
#'
#' @param site   Name of site to search on. Supported options:
#'               `"google"` (default), `"bing"`, `"duckduckgo"`, `"startpage"`,
#'               `"rstudio community"`, `"twitter"`,`"stackoverflow"`,
#'               `"github"`, and `"bitbucket"`.
#' @param query   Contents of string to search. Default is the error message.
#' @param rlang   Search for results written in R. Default is `TRUE`
#'
#' @return The generated search URL or an empty string.
#'
#' @rdname search_site
#' @export
#' @seealso [search_google()], [search_bing()], [search_duckduckgo()],
#'          [search_startpage()], [search_twitter()], [search_rstudio_community()],
#'          [search_stackoverflow()], [search_github()], [search_bitbucket()],
#'          and [searcher()]
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
#' # Search startpage
#' search_startpage("VS Code")
#'
#' # Search RStudio Community
#' search_rstudio_community("RStudio IDE")
#'
#' # Search Twitter
#' search_twitter("searcher")
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
                         "duckduckgo",
                         "ddg",
                         "startpage",
                         "sp",
                         "rstudio community",
                         "rscom",
                         "twitter",
                         "stackoverflow",
                         "so",
                         "github",
                         "gh",
                         "bitbucket",
                         "bb"
                       ),
                       rlang = TRUE) {
  site = tolower(site)
  site = match.arg(site)

  switch(
    site,
    google         = search_google(query, rlang),
    bing           = search_bing(query, rlang),
    duckduckgo     = ,       # empty case carried below
    ddg            = search_duckduckgo(query, rlang),
    startpage      = ,      # empty case carried below
    sp             = search_startpage(query, rlang),
    `rstudio community` = , # empty case carried below
    rscom          = search_rstudio_community(query, rlang),
    twitter        = search_twitter(query, rlang),
    stackoverflow  = ,      # empty case carried below
    so             = search_stackoverflow(query, rlang),
    github         = ,      # empty case carried below
    gh             = search_github(query, rlang),
    bitbucket      = ,      # empty case carried below
    bb             = search_bitbucket(query, rlang)
  )
}

#' Generate a Searcher function for use with Error Handling
#'
#' Constructs a function object that will search the last
#' R error message on search portals by opening a
#' browser.
#'
#' @param keyword Opt to search under different default terms.
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
searcher = function(site, keyword = getOption("searcher.default_keyword")) {

  entry = site_details(site)

  function(query = geterrmessage(), rlang = TRUE) {

    if (!valid_query(query)) {
      message("`query` must contain only 1 element that is not empty.")
      return(invisible(""))
    }

    query = append_search_term_suffix(query, rlang, entry[["keywords"]][[keyword]])

    browse_url(entry$site_url, query, entry$suffix)
  }
}

########################### Start Search Engines

#' @rdname search_site
#' @export
#' @section Google Search:
#' The `search_google` function searches [Google](https://google.com) using:
#' `https://google.com/search?q=<query>`
#'
#' See \url{https://moz.com/blog/the-ultimate-guide-to-the-google-search-parameters}
#' for details.
search_google = searcher("google")

#' @rdname search_site
#' @export
#' @section Bing Search:
#' The `search_bing()` function searches [Bing](https://bing.com) using:
#' `https://bing.com/search?q=<query>`
search_bing = searcher("bing")

#' @rdname search_site
#' @export
#' @section DuckDuckGo Search:
#' The `search_duckduckgo()` and `search_ddg()` functions both search
#' [DuckDuckGo](https://duckduckgo.com) using: `https://duckduckgo.com/?q=<query>`
search_duckduckgo = searcher("ddg")

#' @rdname search_site
#' @export
search_ddg = search_duckduckgo


#' @rdname search_site
#' @export
search_ixquick = function(query = geterrmessage(), rlang = TRUE) {
  .Defunct(msg = "ixquick is now startpage, please use `search_startpage()`.")
}

#' @rdname search_site
#' @export
#' @section Startpage Search:
#' The `search_startpage()` function searches
#' [startpage](https://startpage.com) using:
#'  \code{https://startpage.com/do/dsearch?query=<query>}
#'
#' For additional details regarding [startpage](https://startpage.com)'s
#' search interface please see:
#'  \url{https://support.startpage.com/index.php?/Knowledgebase/Article/View/1261/0/add-familystartpagecom-as-the-default-search-engine-in-chrome}
search_startpage = searcher("sp")

#' @rdname search_site
#' @export
search_sp = search_startpage

########################### End Search Engines


########################### Start Search Development Community Websites


#' @rdname search_site
#' @export
#' @section RStudio Community Search:
#' The `search_rstudio_community()` and `search_rscom()` functions both search
#' [RStudio Community](https://community.rstudio.com/) using:
#' \code{https://community.rstudio.com/search?q=<query>}
#'
#' For additional details regarding [RStudio Community](https://community.rstudio.com/)'s
#' search interface please see the [Discourse](https://discourse.org) API documentation:
#'  \url{https://docs.discourse.org/#tag/Search}
search_rstudio_community = searcher("rscom")

#' @rdname search_site
#' @export
search_rscom = search_rstudio_community

#' @rdname search_site
#' @export
#' @section Twitter Search:
#' The `search_twitter()` functions search
#' [Twitter](https://twitter.com/) using:
#' \code{https://twitter.com/search?q=<query>}
#'
#' For additional details regarding [Twitter](https://twitter.com/)'s
#' search interface please see:
#' \url{https://help.twitter.com/en/using-twitter/twitter-advanced-search}
search_twitter = searcher("twitter")

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
search_stackoverflow = searcher("so")

#' @rdname search_site
#' @export
search_so = search_stackoverflow

########################### End Search Development Community Websites

########################### Start Search Code Repos

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
search_github = searcher("gh")

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
search_bitbucket = searcher("bb")

#' @rdname search_site
#' @export
search_bb = search_bitbucket

########################### End Search Code Repos
