
<!-- README.md is generated from README.Rmd. Please edit that file -->

# searcher

<!-- badges: start -->

[![R build
status](https://github.com/r-assist/searcher/workflows/R-CMD-check/badge.svg)](https://github.com/r-assist/searcher/actions)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/searcher)](http://www.r-pkg.org/pkg/searcher)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/searcher)](https://cran.r-project.org/package=searcher)
[![Codecov test
coverage](https://codecov.io/gh/r-assist/searcher/branch/master/graph/badge.svg)](https://codecov.io/gh/r-assist/searcher?branch=master)
<!-- badges: end -->

The goal of `searcher` is to provide a search interface directly inside
of *R*. For example, to look up `rcpp example numeric vector` or
`ggplot2 fix axis labels` call one of the `search_*()` functions to
automatically have a web browser open, go to a search site, and type the
query. By default, the search functions will attempt to search the last
error on call if no query is specified.

![](https://i.imgur.com/Zq2rg6G.gif)

## Installation

The `searcher` package is available on both
[CRAN](https://CRAN.R-project.org/package=searcher) and
[GitHub](https://github.com/r-assist/searcher). The
[CRAN](https://CRAN.R-project.org/package=searcher) version is
considered stable while the
[GitHub](https://github.com/r-assist/searcher) version is in a state of
development and may break.

You can install the stable version of the `searcher` package with:

``` r
install.packages("searcher")
```

For the development version, you can opt for:

``` r
if(!requireNamespace("devtools")) { install.packages("devtools") }
devtools::install_github("r-assist/searcher")
```

## Usage

``` r
library(searcher)
```

## Search Terms

The `search_*()` functions can be used to search a query directly from
*R* on major search engines, programming help websites, and code
repositories. The following search platforms are supported:
[Google](https://google.com), [Bing](https://www.bing.com/),
[DuckDuckGo](https://duckduckgo.com/),
[Startpage](https://www.startpage.com/en/),
[Twitter](https://twitter.com/search),
[StackOverflow](https://stackoverflow.com/search), [RStudio
Community](https://community.rstudio.com/search),
[GitHub](https://github.com/search), and
[BitBucket](https://bitbucket.com/search). By default, an appropriate
suffix for each platform that ensures relevant results to *R* is
appended to all queries. This behavior can be disabled by using `rlang =
FALSE`.

``` r
# Searching R project on major search engines
search_google("R project")
search_bing("R project")
search_duckduckgo("R project")                           # or search_ddg(...)
search_startpage("R project")                            # or search_sp(...)

# Searching Twitter to find out about machine learning for R and in general
search_twitter("machine learning")
search_twitter("machine learning", rlang = FALSE)

# Searching for linear regression questions for R and in general
search_stackoverflow("linear regression")
search_stackoverflow("linear regression", rlang = FALSE) # or search_so(...)

# Searching RStudio Community for tips
search_rstudio_community("tips")
search_rstudio_community("tips", rlang = FALSE)          # or search_rscom(...)

# Searching GitHub Issues for maps in R and other languages
search_github("maps")
search_github("maps", rlang = FALSE)                     # or search_gh(...)

# Searching BitBucket for assertions in R and other languages
search_bitbucket("assertions")
search_bitbucket("assertions", rlang = FALSE)            # or search_bb(...)
```

## Search Errors

`searcher` offers preliminary support for automatically or manually
searching errors that are generated in *R*. For more robust error search
support and to also search warning messages, please use the
[`errorist`](https://github.com/r-assist/errorist) package.

### Automatically

Searching the last error automatically is possible by registering a
function as *R*’s error handler via either `searcher(site="")` or one of
the `search_*()` functions. Thus, when an error occurs, this function
will automatically be called. This triggers a new browser window to open
with the error term listed in verbatim.

``` r
# Using the generic search error handler
options(error = searcher("google"))

# Directly specify the search function
options(error = search_github)
options(error = search_google)
```

### Manually

Alternatively, these functions can also be used manually so that the
default error dispatch is preserved. In the manual case, you will have
to explicitly call the search function. After that, a browser window
will open with the last error message as the search query on the desired
search portal.

``` r
search_google()
search_bing()
search_twitter()
search_duckduckgo()        # or search_ddg()
search_startpage()         # or search_sp()
search_stackoverflow()     # or search_so()
search_rstudio_community() # or search_rscom()
search_github()            # or search_gh()
search_bitbucket()         # or search_bb()
```

## Package Customizations

The ability to customize different operations in `searcher` is possible
by setting values in
[`options()`](https://stat.ethz.ch/R-manual/R-patched/RHOME/library/base/html/options.html)
within
[`~/.Rprofile`](https://stat.ethz.ch/R-manual/R-patched/library/base/html/Startup.html).
Presently, the following options are available:

  - `searcher.launch_delay`: Amount of time between launching the web
    browser from when the command was issued. Default is `0.5` seconds.
  - `searcher.use_rstudio_viewer`: Display search results in the RStudio
    viewer pane instead of a web browser. Default is `FALSE`.
  - `searcher.default_keyword`: Suffix keyword to focus search results
    between either `"base"` or `"tidyverse"`. Default is `"base"`.

To set one of these options, please create the `.Rprofile` by typing
into *R*:

``` r
file.edit("~/.Rprofile")
```

From there, add:

``` r
.First = function() {
  options(
    searcher.launch_delay       = 0,
    searcher.use_rstudio_viewer = FALSE,
    searcher.default_keyword    = "tidyverse"
    ## Additional options.
  )
}
```

## Motivation

The idea for `searcher` began as a project to automatically search
errors and warnings that occurred while working with *R* after a
conversation among [Dirk Eddelbuettel](http://dirk.eddelbuettel.com),
[Barry Rowlingson](http://barry.rowlingson.com), and myself. However,
there was no search interface that allowed querying directly from *R*
outside of the built-in
[`utils::RSiteSearch()`](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/RSiteSearch.html),
which only queries <http://search.r-project.org/>, and the
[`sos`](https://cran.r-project.org/package=sos) package, which queries
an off-site user premade database. Both of these options were focused
solely on querying *R* documentation made available by packages. Given
the nature of errors generally being *undocumented*, neither of these
approaches could be used. Thus, `searcher` was unintentionally born to
provide a means for [`errorist`](https://github.com/r-assist/errorist),
which contains a robust way to automatically searching errors and
warnings.

### Special Thanks

  - [Dirk Eddelbuettel](http://dirk.eddelbuettel.com) for starting the
    discussion on [XKCD Comic 1185: Ineffective
    Sorts](https://xkcd.com/1185/).
  - [Barry Rowlingson](http://barry.rowlingson.com) for remarks about
    functionality.

### Publicity

On the [`#rstats`-twitter
verse](https://twitter.com/search?q=%23rstats), `searcher` has been
positively received by community members.

> R package “searcher” that automatically searches Stackoverflow for
> error that you just saw in the console. Cool package, especially for
> those who learn R :) <https://github.com/coatless/searcher> … \#r
> \#rlang \#rstats \#rstudio
> 
> — [Paweł
> Przytuła](https://twitter.com/pawel_appsilon/status/1109545516264841216)
> March 23th, 2019. \~292 Retweets and 876 likes

> Did you know, using “searcher” package, you could automatically to
> search stackoverflow, google, GitHub and many more sites for errors,
> packages or topics. \#rstats
> 
> — [Shakirah Nakalungi](https://twitter.com/cynthia_kyra) June 29th,
> 2019, when she was [Rotating Curator for the “We are R-Ladies” twitter
> account](https://twitter.com/WeAreRLadies/status/1144921174251581440).
> \~144 Retweets and 544 likes

Please let us know via an [issue
ticket](https://github.com/r-assist/searcher/issues/new) about how you
are using `searcher`.

## License

GPL (\>= 2)
