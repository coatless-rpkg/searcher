test_that("Verify package load settings", {
  # Get the expected default options
  searcher_defaults <- searcher_default_options()

  # Store the original options
  original_options <- options()

  # Clean environment by removing all searcher options
  options(sapply(names(searcher_defaults), function(x) NULL))

  # Verify that searcher options have been unset
  expect_true(all(sapply(names(searcher_defaults), function(x) is.null(getOption(x)))))

  # Call the .onLoad function
  .onLoad(libname = "", pkgname = "searcher")

  # Check if all default options are now set
  expect_true(all(names(searcher_defaults) %in% names(options())))

  # Verify if the contents were set correctly
  set_option_values <- sapply(names(searcher_defaults), getOption, simplify = FALSE, USE.NAMES = TRUE)
  expect_equal(set_option_values, searcher_defaults)

  # Test overriding a default option
  options(searcher.launch_delay = 1.0)
  .onLoad(libname = "", pkgname = "searcher")
  expect_equal(getOption("searcher.launch_delay"), 1.0)

  # Restore original options
  options(original_options)
})
