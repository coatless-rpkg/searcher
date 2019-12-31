test_that("Keyword generation", {
  expect_equal(
    keyword_entry("r", "tidy"),
    list(base = "r", tidyverse = "tidy")
  )

  expect_equal(
    keyword_default(),
    list(base = "r programming", tidyverse = "tidyverse")
  )
})

test_that("Site creation", {
  expect_equal(
    site_entry("fake", "http://example.com"),
    list(
      "site_long_name" = "fake",
      "site_short_name" = "fake",
      "site_url" = "http://example.com",
      "keywords" = list(base = "r programming", tidyverse = "tidyverse"),
      "suffix" = NULL
    )
  )
})

test_that("Site retrieval", {

  expect_equal(
    site_details("google"),
    site_index[[1]],
    info = "Verify site is retrieved"
  )

  expect_equal(
    site_details("github"),
    site_details("gh"),
    info = "Verify long name matches with short name contents."
  )

})

test_that("Site retrieval failure", {
  expect_error(site_details("fake"))
})
