#' @aliases searcher-package
#' @section Package Customizations:
#'
#' `searcher` accesses a set of default values stored in [options()] on each
#' call to keep the function signatures small. By default, these options are given as:
#'
#' - `searcher.launch_delay`: Amount of time to remain in _R_ before opening
#'    a browser window. Default is 0.5 seconds.
#' - ...
#'
"_PACKAGE"

searcher_default_options = list(
  searcher.launch_delay = 0.5
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
