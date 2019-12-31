test_that("Verify package load settings", {

  pkg_default_options = searcher_default_options
  pkg_default_names = names(pkg_default_options)

  # Clean environment
  for(default_name in pkg_default_names) {
    options(default_name = NULL)
  }

  is_option_present = function(x) {
    !is.null(getOption(x, NULL))
  }

  # Verify names have been unset
  expect_true(all(sapply(pkg_default_names, is_option_present)))

  # And call the onload..
  .onLoad()

  # Check if names are registered
  expect_true(all(pkg_default_names %in% names(options())))

  # Verify if contents were set.
  set_option_values = sapply(pkg_default_names, getOption,
                             simplify = FALSE, USE.NAMES = TRUE)
  expect_equal(
    set_option_values,
    pkg_default_options
  )

})
