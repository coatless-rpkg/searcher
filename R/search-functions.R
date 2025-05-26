#' Search a Query on a Search Portal in a Web Browser
#'
#' Creates an appropriate query string for a search engine and then opens
#' up the resulting page in a web browser.
#'
#' @param site   Name of site to search on. Supported options:
#'               `"google"` (default), `"bing"`, `"duckduckgo"` or `"ddg"`,
#'               `"startpage"`  (formerly `"ixquick"`) or `"sp"`,
#'               `"qwant"`, `"rseek"`, `"brave"`, `"kagi"`,
#'               `"posit community"` (formerly `"rstudio community"`) or `"posit"`,
#'               `"twitter"` or `"x"`, `"bluesky"`, `"mastodon"`, `"stackoverflow"`,
#'               `"github"`, `"grep"`, `"bitbucket"`,
#'               `"chatgpt"`, `"claude"`, `"perplexity"`,
#'               `"mistral"` or `"le chat"`, `"bing copilot"` or `"copilot"`, and
#'               `"grok"` or `"xai"`, `"meta ai"` or `"meta"`.
#' @param query   Contents of string to search. Default is the error message.
#' @param rlang   Search for results written in R. Default is `TRUE`
#' @param prompt  Optional prompt prefix to add before your query to guide how the AI
#'                responds. If `NULL`, uses the service-specific default prompt option.
#'
#' @return
#' The generated search URL or an empty string.
#'
#' @export
#' @examples
#' # Search in a generic way
#' search_site("r-project", "google")
search_site = function(query,
                       site = c(
                         "google",
                         "bing",
                         "duckduckgo",
                         "ddg",
                         "startpage",
                         "sp",
                         "qwant",
                         "rseek",
                         "brave",
                         "kagi",
                         "posit community",
                         "posit",
                         "twitter",
                         "x",
                         "bluesky",
                         "mastodon",
                         "stackoverflow",
                         "so",
                         "github",
                         "gh",
                         "grep",
                         "bitbucket",
                         "bb",
                         "chatgpt",
                         "claude",
                         "perplexity",
                         "mistral",
                         "bing copilot",
                         "copilot",
                         "grok",
                         "meta ai",
                         "meta"
                       ),
                       rlang = TRUE,
                       prompt = NULL) {
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
    qwant          = search_qwant(query, rlang),
    rseek          = search_rseek(query, rlang),
    brave          = search_brave(query, rlang),
    kagi           = search_kagi(query, rlang),
    `posit community` = , # empty case carried below
    posit          = search_posit_community(query, rlang),
    twitter        = ,      # empty case carried below
    x              = search_twitter(query, rlang),
    bluesky        = search_bluesky(query, rlang),
    mastodon       = search_mastodon(query, rlang),
    stackoverflow  = ,      # empty case carried below
    so             = search_stackoverflow(query, rlang),
    github         = ,      # empty case carried below
    gh             = search_github(query, rlang),
    grep           = search_grep(query, rlang),
    bitbucket      = ,      # empty case carried below
    bb             = search_bitbucket(query, rlang),
    chatgpt        = ask_chatgpt(query, prompt),
    claude         = ask_claude(query, prompt),
    perplexity     = ask_perplexity(query, prompt),
    `le chat`      = ,      # empty case carried below
    mistral        = ask_mistral(query, prompt),
    `bing copilot` = ,      # empty case carried below
    copilot        = ask_bing_copilot(query, prompt),
    xai            = ,      # empty case carried below
    grok           = ask_grok(query, prompt),
    `meta ai`      = ,      # empty case carried below,
    meta           = ask_meta_ai(query, prompt)
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

#' Search Google
#'
#' The `search_google` function searches [Google](https://www.google.com/) using:
#' `https://www.google.com/search?q=<query>`
#'
#' @inheritParams search_site
#' @return
#' The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search Google
#' search_google("r-project")
#'
#' \dontrun{
#' # On error, automatically search the message on google
#' options(error = searcher("google"))
#' options(error = search_google)
#' }
search_google = searcher("google")

#' Search Bing
#'
#' The `search_bing()` function searches [Bing](https://www.bing.com/) using:
#' `https://www.bing.com/search?q=<query>`
#'
#' @inheritParams search_site
#' @return
#' The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search Bing
#' search_bing("Microsoft R")
search_bing = searcher("bing")

#' Search DuckDuckGo
#'
#' The `search_duckduckgo()` and `search_ddg()` functions both search
#' [DuckDuckGo](https://duckduckgo.com) using: `https://duckduckgo.com/?q=<query>`
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search DuckDuckGo
#' search_duckduckgo("R language")
search_duckduckgo = searcher("ddg")

#' @rdname search_duckduckgo
#' @export
search_ddg = search_duckduckgo

#' Search Startpage
#'
#' The `search_startpage()` function searches
#' [startpage](https://startpage.com) using:
#' `https://startpage.com/do/dsearch?query=<query>`
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search startpage
#' search_startpage("VS Code")
search_startpage = searcher("sp")

#' @rdname search_startpage
#' @export
search_sp = search_startpage

#' Search Ecosia
#'
#' The `search_ecosia()` function searches
#' Ecosia using: `https://www.ecosia.org/search?q=<query>`
#'
#' For additional details regarding Ecosia's search interface please see:
#' <https://support.ecosia.org/article/657-installing-ecosia-on-your-desktop-device>
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search Ecosia
#' search_ecosia("climate change R analysis")
search_ecosia = searcher("ecosia")

#' Search Rseek
#'
#' The `search_rseek()` function searches [Rseek](https://rseek.org) using:
#' `https://rseek.org/?q=<query>`
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search Rseek
#' search_rseek("searcher")
search_rseek = searcher("rseek")

#' Search Qwant
#'
#' The `search_qwant()` function searches
#' Qwant using: `https://www.qwant.com/?q=<query>`
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search Qwant
#' search_qwant("Quarto")
search_qwant = searcher("qwant")

#' Search Brave
#'
#' The `search_brave()` function searches
#' Brave using: `https://search.brave.com/search?q=<query>&source=web`
#'
#' @inheritParams search_site
#' @return
#' The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search Brave
#' search_brave("webR")
search_brave = searcher("brave")

#' Search Kagi
#'
#' The `search_kagi()` function searches
#' Kagi using: `https://kagi.com/search?q=<query>`
#'
#' This is a paid search engine, and you will need to
#' sign up for an account to use it.
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family search engines
#' @examples
#' # Search Kagi
#' search_kagi("advanced R programming")
search_kagi = searcher("kagi")

########################### End Search Engines

########################### Start Search Development Community Websites


#' Search Posit Community
#'
#' The `search_posit_community()` and `search_posit()` functions both search
#' [Posit Community](https://forum.posit.co/) using:
#' `https://forum.posit.co/search?q=<query>`
#'
#' For additional details regarding [Posit Community](https://forum.posit.co/)'s
#' search interface please see the [Discourse](https://discourse.org) API documentation:
#' <https://docs.discourse.org/#tag/Search>
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family community sites
#' @examples
#' # Search Posit Community
#' search_posit_community("RStudio IDE")
search_posit_community = searcher("posit")

#' @rdname search_posit_community
#' @export
search_posit = search_posit_community

#' Search Twitter/X
#'
#' The `search_twitter()` functions search
#' Twitter using: `https://twitter.com/search?q=<query>`
#'
#' For additional details regarding Twitter's
#' search interface please see:
#' <https://help.x.com/en/using-x/x-advanced-search>
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family community sites
#' @examples
#' # Search Twitter
#' search_twitter("searcher")
search_twitter = searcher("twitter")

#' @rdname search_twitter
#' @export
search_x = search_twitter

#' Search Mastodon
#'
#' The `search_mastodon()` functions search
#' Mastodon using: `https://mastodon.social/search?q=%23rstats+<query>`
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family community sites
#' @examples
#' # Search Mastodon
#' search_mastodon("searcher")
search_mastodon = searcher("mastodon")


#' Search BlueSky
#'
#' The `search_bluesky()` functions search
#' BlueSky using: `https://bsky.app/search?q=%23rstats+<query>`
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family community sites
#' @examples
#' # Search BlueSky
#' search_bluesky("searcher")
search_bluesky = searcher("bluesky")

#' Search StackOverflow
#'
#' The `search_stackoverflow()` and `search_so()` functions both search
#' [StackOverflow](https://stackoverflow.com) using:
#' `https://stackoverflow.com/search?q=\%5Br\%5D+<query>`
#'
#' For additional details regarding [StackOverflow](https://stackoverflow.com)'s
#' search interface please see:
#'
#' ```
#' https://stackoverflow.com/help/searching
#' ```
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family community sites
#' @examples
#' # Search StackOverflow for Convolutions in the r tag
#' search_stackoverflow("convolutions")
#'
#' # Search all languages on StackOverflow for convolutions
#' search_stackoverflow("convolutions", rlang = FALSE)
search_stackoverflow = searcher("so")

#' @rdname search_stackoverflow
#' @export
search_so = search_stackoverflow

########################### End Search Development Community Websites

########################### Start Search Code Repos

#' Search GitHub
#'
#' The `search_github()` and `search_gh()` functions both search
#' [GitHub](https://github.com) using:
#' `https://github.com/search?q=<query>+language\%3Ar+type\%3Aissue&type=Issues`
#'
#' For additional details regarding [GitHub](https://github.com)'s
#' search interface please see:
#' <https://docs.github.com/en/enterprise-cloud@latest/search-github/getting-started-with-searching-on-github/about-searching-on-github>
#' and <https://docs.github.com/en/search-github/searching-on-github/searching-code/>
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family code repositories
#' @examples
#' # Search GitHub Issues for bivariate normal in the language:r
#' search_github("bivariate normal")
#'
#' # Search all languages on GitHub Issues for bivariate normal
#' search_github("bivariate normal", rlang = FALSE)
search_github = searcher("gh")

#' @rdname search_github
#' @export
search_gh = search_github

#' Search Grep.app
#'
#' The `search_grep()` function searches all public code on
#' [GitHub](https://github.com) using [grep.app](https://grep.app) by
#' querying: `https://grep.app/search?q=<query-here>&filter[lang][0]=R`
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family code repositories
#' @examples
#' # Search R code on GitHub for numerical optimization
#' search_grep("optim")
#'
#' # Search all code on GitHub for numerical optimization
#' search_grep("optim", rlang = FALSE)
search_grep = searcher("grep")

#' Search BitBucket
#'
#' The `search_bitbucket()` and `search_bb()` functions both search
#' [BitBucket](https://bitbucket.org) using:
#' `https://bitbucket.org/search?q=lang\%3Ar+<query>`
#'
#' For additional details regarding [BitBucket](https://bitbucket.org)'s
#' search interface please see:
#' <https://confluence.atlassian.com/bitbucket/code-search-in-bitbucket-873876782.html>
#'
#' @inheritParams search_site
#' @return The generated search URL or an empty string.
#' @export
#' @family code repositories
#' @examples
#' # Search BitBucket for assertions
#' search_bitbucket("assertions")
#'
#' # Search all languages on BitBucket for assertions
#' search_bitbucket("assertions", rlang = FALSE)
search_bitbucket = searcher("bb")

#' @rdname search_bitbucket
#' @export
search_bb = search_bitbucket

########################### End Search Code Repos

