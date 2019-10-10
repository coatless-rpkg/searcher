# searcher 0.0.5

## Features

- Added ability to set default package actions.
- Allow RStudio's Viewer pane to display search results.
  - Note: This feature requires a patch per [issue 2252](https://github.com/rstudio/rstudio/issues/2252).

## Changes

- Default options added:
  - `searcher.launch_delay` controls how long the user remains in _R_ prior
    to the browser opening. Default is `0.5` seconds.
  - `searcher.use_rstudio_viewer` specifies whether RStudio's viewer pane should
    open the link instead of a web browser. Default is `FALSE` until the issue
    is resolved..

## Fixes

- Fixed vignette index name.

# searcher 0.0.4

## Features

- Added search portal:
    - `search_rstudio_community()` or `search_rscom()`: Searches on [RStudio Community](https://community.rstudio.com/search). 
      (#13, #17)
- Added vignette on search patterns (#18).

## Changes

- Renamed search portal:
    - Changed `search_ixquick()` to `search_startpage()` due to the 
      merging of ixquick into startpage. (#15)
- Update the README overview for the project. (#16)

## Deployment

- Improved TravisCI testing deployments by testing across an array and using
  all CPUs allotted to build the container. (#16)
- Modify thresholding for code coverage rejections. (#16)

# searcher 0.0.3

## Features

- Added search portal:
    - `search_ixquick()`: Searches with [ixquick](https://www.ixquick.com/). (#8, #6)

## Changes

- Append `r programming` to major search engines by default (#11, #10)
- Add `ixquick` as a valid engine to `search_site()`. (#8, #6)
- Included link to repository and bug tracker to `DESCRIPTION`.

# searcher 0.0.2

## Features

- Added search portal functions
    - `search_site()`: Looks up search portal and _then_ searches with it.
    - `search_google()`: Searches with [Google](https://google.com/)
    - `search_bing()`: Searches with [Bing](https://www.bing.com)
    - `search_duckduckgo()` or `search_ddg()`: Searches with [DuckDuckGo](https://duckduckgo.com/)
    - `search_github()` or `search_gh()`: Searches issues on [GitHub](https://github.com/)
    - `search_bitbucket()` or `search_bb()`: Searches issues on [BitBucket](https://bitbucket.com/)
    - `search_stackoverflow()` or `search_so()`: Searches questions on [StackOverflow](https://stackoverflow.com/)
- Add function generator `searcher()` to create function objects that can be
  used as error handlers in `option(error = )` and task call-backs.

## UX

- Created a `browse_url()` that checks to see if it is in interactive mode before
  trying to open a web browser 0.5 seconds after call. 
