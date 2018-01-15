
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis-CI Build
Status](https://travis-ci.org/coatless/searcher.svg?branch=master)](https://travis-ci.org/coatless/searcher)[![CRAN
RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/searcher)](http://www.r-pkg.org/pkg/searcher)[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/searcher)](https://cran.r-project.org/package=searcher)[![Coverage
Status](https://img.shields.io/codecov/c/github/coatless/searcher/master.svg)](https://codecov.io/github/coatless/searcher?branch=master)

# searcher

The goal of `searcher` is to provide a search interface directly inside
of *R*. For example, within *R*, there is now the ability to look up
`rcpp example numeric vector` or `ggplot2 fix axis labels` without
having to open a browser, go to a search site, and type the query. By
default, the search functions automatically search the last error on
call.

![](https://media.giphy.com/media/3o7528ih541CTYa6OY/giphy.gif)

## Installation

The `searcher` package is only available on GitHub for the moment. You
can install the `searcher` package with:

``` r
devtools::install_github("coatless/searcher")
```

## Usage

``` r
library(searcher)
```

## Search Terms

The `search_*()` functions can be used to search a query directly from
*R* on major search engines, code repositories, and help websites. The
following search platforms are supported: Google, Bing, DuckDuckGo,
StackOverflow, GitHub, and BitBucket.

``` r
# Searching R project on major search engines
search_google("R project")
search_bing("R project")
search_duckduckgo("R project")                           # or search_ddg(...)

# Searching for linear regression questions for R and in general
search_stackoverflow("linear regression")
search_stackoverflow("linear regression", rlang = FALSE) # or search_so(...)

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
[`errorist`](https://github.com/coatless/errorist) package.

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
search_duckduckgo()    # or search_ddg()
search_stackoverflow() # or search_so()
search_github()        # or search_gh()
search_bitbucket()     # or search_bb()
```

# Motivation

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
provide a means for [`errorist`](https://github.com/coatless/errorist),
which contains a robust way to automatically searching errors and
warnings.

# Special Thanks

  - [Dirk Eddelbuettel](http://dirk.eddelbuettel.com) for starting the
    discussion on [XKCD Comic 1185: Ineffective
    Sorts](https://xkcd.com/1185/).
  - [Barry Rowlingson](http://barry.rowlingson.com) for remarks about
    functionality.

# License

GPL (\>= 2)
