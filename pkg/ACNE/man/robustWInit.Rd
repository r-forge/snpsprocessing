%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  robustWInit.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{robustWInit}
\alias{robustWInit}


\title{Robust initialization of the W (affinity) matrix}

\description{
 Robust initialization of the W (affinity) matrix.
}

\usage{
robustWInit(V, H, maxIter=50L, ...)
}

\arguments{
 \item{V}{An KxI \code{\link[base]{matrix}} where I is the number of arrays and K is the
    number of probes where K should be even (K=2L).}
 \item{H}{A 2xI \code{\link[base]{matrix}} of allele-specific copy-number estimates.}
 \item{maxIter}{The maximum number of iterations.}
 \item{...}{Not used.}
}

\value{
  Returns a Kx2 \code{\link[base]{matrix}} of robustified probe-affinity estimates.
}

\details{
  This function utilized a random number generator.
}


\keyword{internal}
