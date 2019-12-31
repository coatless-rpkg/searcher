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
#' - ...
#'
"_PACKAGE"

searcher_default_options = list(
  searcher.launch_delay = 0.5,
  searcher.use_rstudio_viewer = FALSE,
  searcher.default_keyword = "base"
)

.onLoad = function(libname, pkgname) {
  # Retrieve options
  options_active = options()

  # Determine if defaults are missing
  missing_defaults = !(names(searcher_default_options) %in% names(options_active))

  # Set any missing default options
  if (any(missing_defaults)) {
    options(searcher_default_options[missing_defaults])
  }

  invisible()
}
