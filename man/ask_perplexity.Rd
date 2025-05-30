% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ai-search-functions.R
\name{ask_perplexity}
\alias{ask_perplexity}
\title{Search with Perplexity}
\usage{
ask_perplexity(query = geterrmessage(), prompt = NULL)
}
\arguments{
\item{query}{Contents of string to send to AI Service. Default is the last error message.}

\item{prompt}{Optional prompt prefix to add before your query to guide how the AI Service
responds. If NULL, uses the service-specific default prompt option.}
}
\value{
The generated search URL or an empty string.
}
\description{
Searches with Perplexity AI, which provides answers with
citations to sources. This makes it particularly
useful for research-oriented queries.
}
\examples{
# Basic query
ask_perplexity("Compare dplyr vs data.table")

# Using a custom prompt
ask_perplexity("Best packages for time series in R",
               prompt = "Provide citations and compare performance:")
}
\seealso{
Other AI assistants: 
\code{\link{ask_bing_copilot}()},
\code{\link{ask_chatgpt}()},
\code{\link{ask_claude}()},
\code{\link{ask_grok}()},
\code{\link{ask_meta_ai}()},
\code{\link{ask_mistral}()}
}
\concept{AI assistants}
