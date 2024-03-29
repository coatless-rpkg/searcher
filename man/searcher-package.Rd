% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/searcher-package.R
\docType{package}
\name{searcher-package}
\alias{searcher-package}
\title{searcher: Query Search Interfaces}
\description{
Provides a search interface to look up terms on 'Google', 'Bing', 'DuckDuckGo', 'Startpage', 'Ecosia', 'rseek', 'Twitter', 'StackOverflow', 'RStudio Community', 'GitHub', and 'BitBucket'. Upon searching, a browser window will open with the aforementioned search results.
}
\section{Package Customizations}{


\code{searcher} accesses a set of default values stored in \code{\link[=options]{options()}} on each
call to keep the function signatures small. By default, these options are given as:
\itemize{
\item \code{searcher.launch_delay}: Amount of time to remain in \emph{R} before opening
a browser window. Default is \code{0.5} seconds.
\item \code{searcher.use_rstudio_viewer}: Display search results in the RStudio
viewer pane instead of a web browser. Default is \code{FALSE}.
\item \code{searcher.default_keyword}: Suffix keyword to generate accurate results
between either \code{"base"} or \code{"tidyverse"}. Default is \code{"base"}.
\item ...
}
}

\seealso{
Useful links:
\itemize{
  \item \url{https://github.com/coatless-rpkg/searcher}
  \item \url{https://r-pkg.thecoatlessprofessor.com/searcher/}
  \item Report bugs at \url{https://github.com/coatless-rpkg/searcher/issues}
}

}
\author{
\strong{Maintainer}: James Balamuta \email{balamut2@illinois.edu} (\href{https://orcid.org/0000-0003-2826-8458}{ORCID})

Other contributors:
\itemize{
  \item Alex Rossell Hayes \email{alexander@rossellhayes.com} (\href{https://orcid.org/0000-0001-9412-0457}{ORCID}) [contributor]
}

}
