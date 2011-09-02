%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  NSANormalization.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{process.NSANormalization}
\alias{process.NSANormalization}
\alias{NSANormalization.process}
\alias{process.NSANormalization}
\alias{process,NSANormalization-method}


\title{Finds normal regions within tumoral samples}

\description{
 Finds normal regions within tumoral samples.
}

\usage{\method{process}{NSANormalization}(this, arrays=NULL, ..., force=FALSE, ram=NULL, verbose=FALSE)}

\arguments{
  \item{...}{Additional arguments passed to
    \code{\link[aroma.light]{normalizeFragmentLength}} (only for advanced users).}
  \item{arrays}{Index vector indicating which samples to process.}
  \item{force}{If \code{\link[base:logical]{TRUE}}, data already normalized is re-normalized,
      otherwise not.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
 Returns a \code{\link[base]{double}} \code{\link[base]{vector}}.
}

\seealso{
  For more information see \code{\link{NSANormalization}}.
}
\keyword{internal}
\keyword{methods}
