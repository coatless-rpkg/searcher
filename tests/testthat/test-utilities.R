test_that("Detect RStudio", {
  # Obtain value
  before = Sys.getenv("RSTUDIO")

  # Modify check environment variable
  Sys.setenv("RSTUDIO" = 1)
  expect_true(is_rstudio(),  info = "Within RStudio")

  Sys.setenv("RSTUDIO" = 0)
  expect_false(is_rstudio(), info = "Not in RStudio")

  # Restore
  Sys.setenv("RSTUDIO" = before)
})
