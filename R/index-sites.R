keyword_entry = function(base, tidyverse = base) {
  list(base = base, tidyverse = tidyverse)
}

keyword_default = function() {
  keyword_entry("r programming", "tidyverse")
}

#' Construct a Site Entry
#'
#' Encodes search portal information into a searchable list.
#'
#' @param site_long_name  Long name of the site
#' @param site_url        Entry point to query website
#' @param site_short_name Short hand value for the site
#' @param keywords        Direct search to be relevant
#' @param suffix          Specify page load options.
#'
#' @return
#' A named `list`.
#'
#' @examples
#' # Create a portal to google
#' site_entry("google", "https://github.com/search?q=")
#'
#' # Create a portal to duckduckgo
#' site_entry("duckduckgo", "https://duckduckgo.com/?q=", "ddg")
#'
#' @noRd
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

site_index =
  list(
    site_entry("google", "https://google.com/search?q="),
    site_entry("bing", "https://bing.com/search?q="),
    site_entry("grep", "https://grep.app/search?q=",
               keywords = keyword_entry("&filter[lang][0]=R")),
    site_entry("duckduckgo", "https://duckduckgo.com/?q=", "ddg"),
    site_entry("startpage", "https://startpage.com/do/dsearch?query=", "sp"),
    site_entry("ecosia", "https://www.ecosia.org/search?q="),
    site_entry("qwant", "https://www.qwant.com/?q="),
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
    ),
    site_entry(
      "twitter",
      "https://twitter.com/search?q=",
      keywords = keyword_entry("%23rstats", "%23rstats %23tidyverse") # %23 is #
    ),
    site_entry(
      "rseek",
      "https://rseek.org/?q=",
      keywords = keyword_entry("", "tidyverse")
    )
  )

site_name_matrix = function() {
  cbind(vapply(site_index, "[[", "", "site_long_name"),
        vapply(site_index, "[[", "", "site_short_name"))
}

site_details = function(site) {
  site_names = site_name_matrix()

  idx = which(site_names == tolower(site), arr.ind = TRUE)

  # If empty, not found.
  if ( nrow(idx) == 0L ) {
    stop("`site` must be a valid site name.", call. = FALSE)
  }

  # Retrieve the first row position
  site_index[[ idx[1, 1] ]]
}


