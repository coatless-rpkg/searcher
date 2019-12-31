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
