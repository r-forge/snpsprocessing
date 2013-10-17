%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  WHInit.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{WHInit}
\alias{WHInit}


\title{Initialization of the W and H matrices}

\description{
 Initialization of the W and H matrices.
}

\usage{
WHInit(V, ...)
}

\arguments{
 \item{V}{An KxI \code{\link[base]{matrix}} where I is the number of arrays and
   K is the number of probes where K should be even (K=2L).}
 \item{...}{Not used.}
}

\value{
 Returns a \code{\link[base]{list}}:
 \item{W}{A Kx2 \code{\link[base]{matrix}} of initial probe-affinity estimates.}
 \item{H}{A 2xI \code{\link[base]{matrix}} of initial allele-specific copy-number estimates.}
 \item{status}{An \code{\link[base]{integer}} specifying the status of the initialization:
   0=normal case, 1=only one allele (either AA or BB), or
   2=all samples are AB.
 }
}

\details{
  The allele-specific copy number estimates are estimated using a
  naive genotyping algorithm.
  The probe-affinities are estimated using a pseudo inverse.
}


\keyword{internal}
