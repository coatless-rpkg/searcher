## Test environments

- local OS X install, R 3.4.3
- ubuntu 12.04 (on travis-ci), R 3.4.3
- win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

Possibly mis-spelled words in DESCRIPTION:
  Bing (7:16)
  BitBucket (7:61)
  DuckDuckGo (7:22)
  GitHub (7:49)
  StackOverflow (7:34)

Found the following (possibly) invalid URLs:
  URL: http://www.r-pkg.org/pkg/searcher (moved to https://www.r-pkg.org:443/pkg/searcher)
    From: README.md
    Status: 404
    Message: Not Found

- The mis-spelled words correspond to official company names.
- The URL linked above has yet to become activated because the package 
  is not on CRAN. Once on CRAN, the URL will work.
- This is a new release.


## Reverse dependencies

This is a new release, so there are no reverse dependencies.
