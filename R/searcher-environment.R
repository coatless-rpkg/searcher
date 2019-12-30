keyword_default = function() {
  keyword_entry("r programming", "tidyverse")
}

keyword_entry = function(base, tidyverse = base) {
  list(base = base, tidyverse = tidyverse)
}

site_entry = function(site_long_name,
                      site_url,
                      site_short_name = site_long_name,
                      keywords = keyword_default(),
                      suffix = NULL) {
  list(
    "site_long_name" = site_long_name,
    "site_short_name" = site_short_name,
    "site_url" = site_url,
    "keywords" = keywords,
    "suffix" = suffix
  )
}

searcher_properties =
  list(
    site_entry("google", "https://github.com/search?q="),
    site_entry("bing", "https://bing.com/search?q="),
    site_entry("duckduckgo", "https://duckduckgo.com/?q=", "ddg"),
    site_entry("startpage", "https://startpage.com/do/dsearch?query=", "sp"),
    site_entry(
      "stackoverflow",
      "https://stackoverflow.com/search?q=",
      "so",
      keyword_entry("[r]", "[tidyverse]")
    ),
    site_entry(
      "rstudio community",
      "https://community.rstudio.com/search?q=",
      "rscom",
      NULL
    ),
    site_entry(
      "github",
      "https://github.com/search?q=",
      "gh",
      keyword_entry("language:r type:issue"),
      "&type=Issues"
    ),
    site_entry(
      "bitbucket",
      "https://bitbucket.com/search?q=",
      "bb",
      keyword_entry("lang:r")
    )
  )

check_site_name = function(x, site_name_type) {
  x %in% vapply(searcher_properties, "[[", "", site_name_type)
}

check_short_site_name = function(x) {
  check_site_name(x, "site_long_name")
}

check_long_site_name = function(x) {
  check_site_name(x, "site_short_name")
}

check_valid_site = function(site) {
  site_present = check_long_site_name(site) ||
    check_short_site_name(site)

  if (!site_present) {
    stop("`site` must be a valid site name.", call. = FALSE)
  }

  invisible(TRUE)
}
