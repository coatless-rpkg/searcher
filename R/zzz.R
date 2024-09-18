#' Default options for searcher package
#'
#' @return A list of default options for the searcher package
#' @noRd
searcher_default_options <- function() {
  list(
    searcher.launch_delay = 0.5,
    searcher.use_rstudio_viewer = FALSE,
    searcher.default_keyword = "base"
  )
}

.onLoad <- function(libname, pkgname) {

  # Initialize default options
  defaults <- searcher_default_options()

  # Determine if any options need to be set
  options_to_set <- setdiff(names(defaults), names(options()))

  # Set the options if they are not present
  if (length(options_to_set) > 0) {
    options(defaults[options_to_set])
  }

  invisible()
}
