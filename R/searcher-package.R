#' @aliases searcher-package
#' @section Package Customizations:
#'
#' `searcher` accesses a set of default values stored in [options()] on each
#' call to keep the function signatures small. By default, these options are given as:
#'
#' - `searcher.launch_delay`: Amount of time to remain in _R_ before opening
#'    a browser window. Default is `0.5` seconds.
#' - `searcher.use_rstudio_viewer`: Display search results in the RStudio
#'    viewer pane instead of a web browser. Default is `FALSE`.
#' - `searcher.default_keyword`: Suffix keyword to generate accurate results
#'    between either `"base"` or `"tidyverse"`. Default is `"base"`.
#'
#' @importFrom utils getOption
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
