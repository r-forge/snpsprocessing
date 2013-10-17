%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  SnpNmfFit.plot.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\name{plot.SnpNmfFit}
\alias{plot.SnpNmfFit}
\alias{SnpNmfFit.plot}
\alias{plot,SnpNmfFit-method}

\title{Generates a multi-panel plot summarizing the NMF SNP fit}

\description{
 Generates a multi-panel plot summarizing the NMF SNP fit.
}

\usage{
\method{plot}{SnpNmfFit}(x, lim=c(0, 2^16), cnLim=c(0, 4), epsLim=c(-1, 1) * 2^12, main=NULL, ...)
}

\arguments{
 \item{lim, cnLim, epsLim}{The plot ranges for the probe data,
    the CN estimates, and the probe-affinity estimates.}
 \item{main}{A \code{\link[base]{character}} string to be the main title of the plot.}
 \item{...}{Not used.}
}

\value{
  Return nothing.
}

\seealso{
  See \code{\link{fitSnpNmfArray}}().
}


\keyword{internal}
\keyword{methods}
