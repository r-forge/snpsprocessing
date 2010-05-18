%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  fitSnpNmf.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{fitSnpNmf}
\alias{fitSnpNmf}


 \title{Non-negative matrix factorization (NMF) of a matrix containing SNP probe signals}

 \description{
  Non-negative matrix factorization (NMF) of a matrix containing SNP probe signals.
 }

 \usage{fitSnpNmf(V, acc=0.02, maxIter=10, maxIterRlm=20)}

 \arguments{
  \item{V}{An KxI \code{\link[base]{matrix}} where I is the number of arrays and K is the
     number of probe where K should be even (K=2L).}
  \item{acc}{A positive \code{\link[base]{double}} specifying the converence threshold. For
     more details on convergence, see below.}
  \item{maxIter}{A positive \code{\link[base]{integer}} specifying the maximum number of
     iterations used to calculate the decomposition.}
  \item{maxIterRlm}{A positive \code{\link[base]{integer}} specifying the maximum number of
     iterations used in rlm.}
 }

 \value{
  Returns a \code{\link[base]{list}}:
  \item{W}{The Kx2 \code{\link[base]{matrix}} containing allele-specific affinity estimates.}
  \item{H}{A 2xI \code{\link[base]{matrix}} containing allele-specific copy number estimates.}
  \item{hasConverged}{\code{\link[base:logical]{TRUE}} if the algorithm converged, otherwise \code{\link[base:logical]{FALSE}}.
     If not applicable, it is \code{\link[base]{NA}}.}
  \item{nbrOfIterations}{The number of iteration ran before stopping.
     If not applicable, it is \code{\link[base]{NA}}.}
 }

 \details{
   The algorithm is considered to have converged when the maximum update
   of any allele-specific copy number of any array (\code{H}) is greater
   than \code{acc}.
 }

 \seealso{
   \code{\link{WHInit}}(), \code{\link{robustWInit}}(), \code{\link{robustHInit}}(), and
   \code{\link{removeOutliers}}().
 }


\keyword{internal}
