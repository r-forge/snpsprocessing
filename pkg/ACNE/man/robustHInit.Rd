%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  robustHInit.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{robustHInit}
\alias{robustHInit}


 \title{Robust initialization of the H (copy number) matrix}

 \description{
  Robust initialization of the H (copy number) matrix.
 }

 \usage{robustHInit(V, W, maxIter=5, ...)}

 \arguments{
  \item{V}{An KxI \code{\link[base]{matrix}} where I is the number of arrays and K is the
     number of probes where K should be even (K=2L).}
  \item{W}{A Kx2 \code{\link[base]{matrix}} of probe-affinity estimates.}
  \item{maxIter}{The maximum number of iteration.}
  \item{...}{Not used.}
 }

 \value{
   Returns a 2xI \code{\link[base]{matrix}} of robustified allele-specific copy-number estimates.
 }

 \details{
   This function utilized a random number generator.
 }


\keyword{internal}
