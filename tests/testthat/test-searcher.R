context("searcher")

test_that("Check link generation", {

  ##### Google

  expect_identical(
    search_google("toad"),
    "https://google.com/search?q=toad%20r%20programming"
  )

  expect_identical(
    search_google("toad", rlang = FALSE),
    "https://google.com/search?q=toad"
  )

  ##### Bing

  expect_identical(
    search_bing("toad"),
    "https://bing.com/search?q=toad%20r%20programming"
  )

  expect_identical(
    search_bing("toad", rlang = FALSE),
    "https://bing.com/search?q=toad"
  )

  ##### DDG

  expect_identical(
    search_duckduckgo("toad"),
    "https://duckduckgo.com/?q=toad%20r%20programming"
  )

  expect_identical(
    search_duckduckgo("toad", rlang = FALSE),
    "https://duckduckgo.com/?q=toad"
  )

  ##### startpage

  expect_identical(
    search_startpage("toad"),
    "https://startpage.com/do/dsearch?query=toad%20r%20programming"
  )

  expect_identical(
    search_startpage("toad", rlang = FALSE),
    "https://startpage.com/do/dsearch?query=toad"
  )

  ##### StackOverflow

  expect_identical(
    search_stackoverflow("toad"),
    "https://stackoverflow.com/search?q=toad%20[r]"
  )

  expect_identical(
    search_stackoverflow("toad", rlang = FALSE),
    "https://stackoverflow.com/search?q=toad"
  )

  ##### RStudio Community

  expect_identical(
    search_rscom("toad"),
    "https://community.rstudio.com/search?q=toad"
  )

  expect_identical(
    search_rscom("toad", rlang = FALSE),
    "https://community.rstudio.com/search?q=toad"
  )

  ##### GitHub

  expect_identical(
    search_github("toad"),
    "https://github.com/search?q=toad%20language:r%20type:issue&type=Issues"
  )

  expect_identical(
    search_github("toad", rlang = FALSE),
    "https://github.com/search?q=toad&type=Issues"
  )

  ##### BitBucket

  expect_identical(
    search_bitbucket("toad"),
    "https://bitbucket.com/search?q=toad%20lang:r"
  )

  expect_identical(
    search_bitbucket("toad", rlang = FALSE),
    "https://bitbucket.com/search?q=toad"
  )

})

test_that("Validate selection", {

  expect_identical(
    search_site("toad", "bb", rlang = FALSE),
    "https://bitbucket.com/search?q=toad"
  )

  expect_error(
    search_site("toad", "", rlang = FALSE)
  )

  expect_identical(
    search_site("toad", "startpage", rlang = FALSE),
    "https://startpage.com/do/dsearch?query=toad"
  )

  expect_identical(
    search_site("toad", "bing", rlang = FALSE),
    "https://bing.com/search?q=toad"
  )

  expect_identical(
    search_site("toad", "ddg", rlang = FALSE),
    "https://duckduckgo.com/?q=toad"
  )

  expect_identical(
    search_site("", rlang = FALSE),
    "",
    "Verify empty query fall through"
  )

})




test_that("Verify search handler generation", {
  expect_identical(
    searcher("bing", rlang = TRUE)(""),
    search_bing("")
  )

  expect_identical(
    searcher("bing", rlang = FALSE)(""),
    search_bing("", rlang = FALSE)
  )
})


test_that("Malformed search query validation", {

  expect_identical(
    search_google(""),
    "",
    "Empty string check if no error messages"
  )


  expect_identical(
    search_bing(""),
    "",
    "Empty string check if no error messages"
  )


  expect_identical(
    search_ddg(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_sp(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_so(""),
    "",
    "Empty string check if no error messages"
  )


  expect_identical(
    search_rscom(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_gh(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_bb(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_google(NULL),
    "",
    "NULL value handling"
  )
})
