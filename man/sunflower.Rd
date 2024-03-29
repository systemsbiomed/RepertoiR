% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sunflower.R
\name{sunflower}
\alias{sunflower}
\title{Sunflower repertoire graph}
\usage{
sunflower(dataset, ...)
}
\arguments{
\item{dataset}{Input object: a matrix or a data frame.

First column is located as the outer ring, the second is right after and so
on to the last column as the inmost ring. Cell's numeric value determines
node size.}

\item{...}{Any other arguments.}
}
\value{
No return value.
}
\description{
Sequence frequency visualization among samples, displayed as
rings of nodes inside each other.
}
\examples{
data <- matrix(rexp(400,1/4), ncol = 4)
sunflower(data)

}
