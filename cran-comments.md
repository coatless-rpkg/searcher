## Test environments

- local OS X install, R 3.4.3
- ubuntu 12.04 (on travis-ci), R 3.4.3
- win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

Found the following (possibly) invalid URLs:
  URL: http://www.r-pkg.org/pkg/searcher (moved to https://www.r-pkg.org:443/pkg/searcher)
    From: README.md
    Status: 404
    Message: Not Found

- This is a resubmission to address comments raised by Swetlana. In particular:
   - "for R" has been omitted in the DESCRIPTION file.
   -  Software names have been put between single quotes (e.g.'Google') in the DESCRIPTION file.
   - Examples that could be run (e.g. non-error handler hooks) are now being run.
   - Added unit tests
- The URL linked above has yet to become activated because the package 
  is not on CRAN. Once on CRAN, the URL will work.
- This is a new release.


## Reverse dependencies

This is a new release, so there are no reverse dependencies.
