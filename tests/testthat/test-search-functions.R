test_that("Check link generation - google", {

  expect_identical(
    search_google("toad"),
    "https://google.com/search?q=toad%20r%20programming"
  )

  expect_identical(
    search_google("toad", rlang = FALSE),
    "https://google.com/search?q=toad"
  )

})

test_that("Check link generation - bing", {

  expect_identical(
    search_bing("toad"),
    "https://bing.com/search?q=toad%20r%20programming"
  )

  expect_identical(
    search_bing("toad", rlang = FALSE),
    "https://bing.com/search?q=toad"
  )

})

test_that("Check link generation - duckduckgo", {

  expect_identical(
    search_duckduckgo("toad"),
    "https://duckduckgo.com/?q=toad%20r%20programming"
  )

  expect_identical(
    search_duckduckgo("toad", rlang = FALSE),
    "https://duckduckgo.com/?q=toad"
  )

})

test_that("Check link generation - startpage", {

  expect_identical(
    search_startpage("toad"),
    "https://startpage.com/do/dsearch?query=toad%20r%20programming"
  )

  expect_identical(
    search_startpage("toad", rlang = FALSE),
    "https://startpage.com/do/dsearch?query=toad"
  )

})

test_that("Check link generation - Ecosia", {

  expect_identical(
    search_ecosia("toad"),
    "https://www.ecosia.org/search?q=toad%20r%20programming"
  )

  expect_identical(
    search_ecosia("toad", rlang = FALSE),
    "https://www.ecosia.org/search?q=toad"
  )

})

test_that("Check link generation - rseek", {

  expect_identical(
    search_rseek("toad"),
    "https://rseek.org/?q=toad"
  )

  expect_identical(
    search_rseek("toad", rlang = FALSE),
    "https://rseek.org/?q=toad"
  )

})


test_that("Check link generation - Brave", {

  expect_identical(
    search_brave("toad"),
    "https://search.brave.com/search?q=toad%20r%20programming"
  )

  expect_identical(
    search_brave("toad", rlang = FALSE),
    "https://search.brave.com/search?q=toad"
  )

})

test_that("Check link generation - kagi", {

  expect_identical(
    search_kagi("toad"),
    "https://kagi.com/search?q=toad%20r%20programming"
  )

  expect_identical(
    search_kagi("toad", rlang = FALSE),
    "https://kagi.com/search?q=toad"
  )

})

test_that("Check link generation - Posit Community", {

  expect_identical(
    search_posit("toad"),
    "https://forum.posit.co/search?q=toad"
  )

  expect_identical(
    search_posit("toad", rlang = FALSE),
    "https://forum.posit.co/search?q=toad"
  )

})

test_that("Check link generation - twitter", {

  expect_identical(
    search_twitter("toad"),
    "https://twitter.com/search?q=toad %23rstats"
  )

  expect_identical(
    search_twitter("toad", rlang = FALSE),
    "https://twitter.com/search?q=toad"
  )

})


test_that("Check link generation - Mastodon", {

  expect_identical(
    search_mastodon("toad"),
    "https://mastodon.social/search?q=toad %23rstats"
  )

  expect_identical(
    search_mastodon("toad", rlang = FALSE),
    "https://mastodon.social/search?q=toad"
  )

})

test_that("Check link generation - BlueSky", {

  expect_identical(
    search_bluesky("toad"),
    "https://bsky.app/search?q=toad %23rstats"
  )

  expect_identical(
    search_bluesky("toad", rlang = FALSE),
    "https://bsky.app/search?q=toad"
  )

})



test_that("Check link generation - stackoverflow", {

  expect_identical(
    search_stackoverflow("toad"),
    "https://stackoverflow.com/search?q=toad%20%5Br%5D"
  )

  expect_identical(
    search_stackoverflow("toad", rlang = FALSE),
    "https://stackoverflow.com/search?q=toad"
  )

})

test_that("Check link generation - github", {

  expect_identical(
    search_github("toad"),
    "https://github.com/search?q=toad%20language%3Ar%20type%3Aissue&type=Issues"
  )

  expect_identical(
    search_github("toad", rlang = FALSE),
    "https://github.com/search?q=toad&type=Issues"
  )

})

test_that("Check link generation - bitbucket", {

  expect_identical(
    search_bitbucket("toad"),
    "https://bitbucket.com/search?q=toad%20lang%3Ar"
  )

  expect_identical(
    search_bitbucket("toad", rlang = FALSE),
    "https://bitbucket.com/search?q=toad"
  )

})

test_that("Validate selection long name - search_site", {

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
    search_site("", rlang = FALSE),
    "",
    "Verify empty query fall through"
  )

})

test_that("Validate selection short name - search_site", {

  expect_identical(
    search_site("toad", "ddg", rlang = FALSE),
    "https://duckduckgo.com/?q=toad"
  )

  expect_identical(
    search_site("toad", "sp", rlang = FALSE),
    "https://startpage.com/do/dsearch?query=toad"
  )

  expect_identical(
    search_site("toad", "posit", rlang = FALSE),
    "https://forum.posit.co/search?q=toad"
  )

  expect_identical(
    search_site("toad", "twitter", rlang = FALSE),
    "https://twitter.com/search?q=toad"
  )

  expect_identical(
    search_site("toad", "so", rlang = FALSE),
    "https://stackoverflow.com/search?q=toad"
  )


  expect_identical(
    search_site("toad", "gh", rlang = FALSE),
    "https://github.com/search?q=toad&type=Issues"
  )
  expect_identical(
    search_site("toad", "bb", rlang = FALSE),
    "https://bitbucket.com/search?q=toad"
  )
})

test_that("Verify search handler generation", {
  expect_message(searcher("bing")(""))
  expect_identical(
    searcher("bing")(""),
    ""
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
    search_posit(""),
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

test_that("Ensure deprecation", {
  expect_error(search_ixquick())
})
