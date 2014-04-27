%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  fitSnpNmfArray.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{fitSnpNmfArray}
\alias{fitSnpNmfArray}


\title{Allele-specific copy number estimation using non-negative matrix factorization (NMF)}

\description{
 Allele-specific copy number estimation using non-negative matrix factorization (NMF).
}

\usage{
fitSnpNmfArray(Y, ...)
}

\arguments{
 \item{Y}{An Lx2xI \code{\link[base]{array}} where L is number of probe pairs,
    2 is the number of alleles (A and B),
    and I is the number of arrays.}
 \item{maxIter}{A positive \code{\link[base]{integer}} specifying the maximum number of
    iterations used to calculate the decomposition.}
 \item{acc}{A positive \code{\link[base]{double}} specifying the converence threshold. For
    more details on convergence, see below.}
}

\value{
 Returns a \code{\link[base]{list}} of class \code{SnpNmfFit}:
 \item{Y}{The Lx2xI \code{\link[base]{array}} \code{Y}.}
 \item{W}{The Kx2 \code{\link[base]{matrix}} containing allele-specific affinity estimates
    where K=2L.}
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

\examples{
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# DATA: Lx2xI allele-specific signals for six different SNPs
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
filenames <- sprintf("V\%d.Rbin", 1:6)
pathnames <- system.file("extData", filenames, package="ACNE")
Ys <- lapply(pathnames, FUN=function(p) snpMatrixToArray(loadToEnv(p)$V))
names(Ys) <- sprintf("SNP #\%d", seq_along(Ys))


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ACNE fitting of NMF to the six SNPs
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
for (name in names(Ys)) {
  Y <- Ys[[name]]
  fit <- fitSnpNmfArray(Y)
  str(fit)
  plot(fit, lim=c(0,2^14), main=name)
}
}

\seealso{
  Internally, the array is stacked into a 2LxI matrix and decomposed
  using \code{\link{fitSnpNmf}}().
  See \code{\link{plot.SnpNmfFit}}().
}


\keyword{internal}
