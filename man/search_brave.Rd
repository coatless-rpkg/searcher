% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search-functions.R
\name{search_brave}
\alias{search_brave}
\title{Search Brave}
\usage{
search_brave(query = geterrmessage(), rlang = TRUE)
}
\arguments{
\item{query}{Contents of string to search. Default is the error message.}

\item{rlang}{Search for results written in R. Default is \code{TRUE}}
}
\value{
The generated search URL or an empty string.
}
\description{
The \code{search_brave()} function searches
Brave using: \verb{https://search.brave.com/search?q=<query>&source=web}
}
\examples{
# Search Brave
search_brave("webR")
}
\seealso{
Other search engines: 
\code{\link{search_bing}()},
\code{\link{search_duckduckgo}()},
\code{\link{search_ecosia}()},
\code{\link{search_google}()},
\code{\link{search_kagi}()},
\code{\link{search_qwant}()},
\code{\link{search_rseek}()},
\code{\link{search_startpage}()}
}
\concept{search engines}
