# Tests for Utility Functions

## Test is_rstudio() ----
test_that("is_rstudio(): detects RStudio environment correctly", {
  # Save original environment variable
  original_rstudio <- Sys.getenv("RSTUDIO")

  # Test when in RStudio
  Sys.setenv("RSTUDIO" = "1")
  expect_true(is_rstudio(), info = "Should detect RStudio when RSTUDIO=1")

  # Test when not in RStudio
  Sys.setenv("RSTUDIO" = "0")
  expect_false(is_rstudio(), info = "Should not detect RStudio when RSTUDIO=0")

  # Test with empty environment variable
  Sys.setenv("RSTUDIO" = "")
  expect_false(is_rstudio(), info = "Should not detect RStudio when RSTUDIO is empty")

  # Restore original environment
  Sys.setenv("RSTUDIO" = original_rstudio)
})


## Test valid_query() ----
test_that("valid_query validates queries correctly", {
  # Valid queries
  expect_true(valid_query("valid query"))
  expect_true(valid_query("a"))
  expect_true(valid_query("query with spaces and numbers 123"))
  expect_true(valid_query("special chars: !@#$%^&*()"))

  # Invalid queries
  expect_false(valid_query(""))
  expect_false(valid_query(NULL))
  expect_false(valid_query(c("multiple", "elements")))
  expect_false(valid_query(character(0)))
  expect_false(valid_query(NA_character_))
  expect_false(valid_query(123))  # Not a character

  # Test missing argument
  expect_false(valid_query())
})

## Test encode_url() ----
test_that("encode_url() creates properly formatted URLs", {
  base_url <- "https://example.com/search?q="

  # Test basic encoding
  result <- encode_url(base_url, "simple query")
  expect_equal(result, "https://example.com/search?q=simple%20query")

  # Test with special characters
  result <- encode_url(base_url, "query with & and + symbols")
  expect_true(grepl("%26", result))  # & becomes %26
  expect_true(grepl("%2B", result))  # + becomes %2B
  expect_true(grepl("%20", result))  # space becomes %20

  # Test with encoded query suffix
  result <- encode_url(base_url, "query", "&type=test")
  expect_equal(result, "https://example.com/search?q=query&type=test")

  # Test with empty query
  result <- encode_url(base_url, "")
  expect_equal(result, "https://example.com/search?q=")

  # Test with complex characters
  result <- encode_url(base_url, "R [language] test")
  expect_true(grepl("%5B", result))  # [ becomes %5B
  expect_true(grepl("%5D", result))  # ] becomes %5D
})

# Test append_search_term_suffix() ----
test_that("append_search_term_suffix(): works correctly", {
  # Test with rlang = TRUE (default behavior)
  result <- append_search_term_suffix("test query", rlang = TRUE, suffix = "r programming")
  expect_equal(result, "test query r programming")

  # Test with rlang = FALSE
  result <- append_search_term_suffix("test query", rlang = FALSE, suffix = "r programming")
  expect_equal(result, "test query")

  # Test with NULL suffix
  result <- append_search_term_suffix("test query", rlang = TRUE, suffix = NULL)
  expect_equal(result, "test query")

  # Test with empty suffix
  result <- append_search_term_suffix("test query", rlang = TRUE, suffix = "")
  expect_equal(result, "test query")

  # Test with custom suffix
  result <- append_search_term_suffix("test", rlang = TRUE, suffix = "custom")
  expect_equal(result, "test custom")

  # Test edge cases
  result <- append_search_term_suffix("", rlang = TRUE, suffix = "r programming")
  expect_equal(result, " r programming")

  result <- append_search_term_suffix("test", rlang = FALSE, suffix = "ignored")
  expect_equal(result, "test")
})

# Test browse_url() ----
test_that("browse_url(): generates correct URLs without opening browser", {
  base_url <- "https://example.com/search?q="
  query <- "test query"

  # Test basic URL generation (open_browser = FALSE)
  expect_message(
    result <- browse_url(base_url, query, open_browser = FALSE),
    "Please type into your browser"
  )
  expect_equal(result, "https://example.com/search?q=test%20query")

  # Test with encoded suffix
  expect_message(
    result <- browse_url(base_url, query, "&type=issues", open_browser = FALSE),
    "Please type into your browser"
  )
  expect_equal(result, "https://example.com/search?q=test%20query&type=issues")

  # Test with special characters
  special_query <- "R [language] & symbols"
  expect_message(
    result <- browse_url(base_url, special_query, open_browser = FALSE),
    "Please type into your browser"
  )
  expect_true(grepl("%5B", result))  # [ is encoded
  expect_true(grepl("%5D", result))  # ] is encoded
  expect_true(grepl("%26", result))  # & is encoded
})
