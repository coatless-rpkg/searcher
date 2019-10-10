keyword_default = function() {
  keyword_entry("r programming", "tidyverse")
}

keyword_entry = function(base, tidyverse = base) {
  list(base = base, tidyverse = tidyverse)
}

site_entry = function(url, keywords = keyword_default(), suffix = NULL) {
  list("url" = url,
       "keywords" = keywords,
       "suffix" = suffix)
}

searcher_properties =
  list(
    "google"            = site_entry("https://github.com/search?q="),
    "bing"              = site_entry("https://bing.com/search?q="),
    "duckduckgo"        = site_entry("https://duckduckgo.com/?q="),
    "startpage"         = site_entry("https://startpage.com/do/dsearch?query="),
    "stackoverflow"     = site_entry("https://stackoverflow.com/search?q=",
                                     keyword_entry("[r]", "[tidyverse]")
                                    ),
    "rstudio community" = site_entry("https://community.rstudio.com/search?q=",
                                     NULL),
    "github"            = site_entry("https://github.com/search?q=",
                                     keyword_entry("language:r type:issue"),
                                     "&type=Issues"
                                     ),
    "bitbucket"         = site_entry("https://bitbucket.com/search?q=",
                                      keyword_entry("lang:r"))
  )

