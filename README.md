<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/coatless/searcher.svg?branch=master)](https://travis-ci.org/coatless/searcher)[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/searcher)](http://www.r-pkg.org/pkg/searcher)[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/searcher)](https://cran.r-project.org/package=searcher)

searcher
========

The goal of searcher is to provide a search interface for *R* errors among the search portals. As an added bonus, the functions can also be used to directly search other terms such as `UIUC` or `mcmc rcpp`.

![](https://media.giphy.com/media/l378bwNTMR8DejX0I/giphy.gif)

Installation
------------

The `searcher` package is only available on GitHub for the moment. You can install the `searcher` package with:

``` r
devtools::install_github("coatless/searcher")
```

Usage
-----

``` r
library(searcher)
```

Search Errors
-------------

### Automatically

Searching the last error automatically is possible by registering one of the `search_` functions as the error handler. Thus, when an error occurs, this function will automatically be called. This triggers a new browser window to open with the error term listed in verbatim.

``` r
# Directly specify the search function
options(error = search_github)
options(error = search_google)

# Using the generic search error handler
options(error = search_error("google"))
```

### Manually

Alternatively, these functions can also be used manually so that the default error dispatch is preserved. In the manual case, you will have to explicitly call the search function. After that, a browser window will open with the last error message as the search query on the desired search portal.

``` r
search_google()
search_bing()
search_duckduckgo()    # or search_ddg()
search_stackoverflow() # or search_so()
search_github()        # or search_gh()
search_bitbucket()     # or search_bb()
```

Search Terms
------------

As an added bonus, the search functions can be used to trigger a search directly from *R* on major search engines. In particular, you can supply your own query directly.

``` r
# Searching R project on major search engines
search_google("R project")
search_bing("R project")
search_duckduckgo("R project")

# Searching for linear regression questions for R and in general
search_stackoverflow("linear regression")
search_stackoverflow("linear regression", rlang = FALSE)

# Searching GitHub Issues for maps in R and other languages
search_github("maps")
search_github("maps", rlang = FALSE)

# Searching BitBucket for assertions in R and other languages
search_bitbucket("assertions")
search_bitbucket("assertions", rlang = FALSE)
```

License
=======

GPL (&gt;= 2)
