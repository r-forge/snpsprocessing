%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  removeOutliers.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{removeOutliers}
\alias{removeOutliers}


\title{Removes outliers in matrix containing SNP signals}

\description{
  Removes outliers in matrix containing SNP signals by identifying outlier elements.  The values of the
  elements that are outliers are substituted by corresponding values
  predicted values \code{Yest=W*H} from the current affinity (\code{W})
  and copy number (\code{H}) estimates.
}

\usage{
removeOutliers(Y, W, H, tau=10, ...)
}

\arguments{
 \item{Y}{An IxK \code{\link[base]{matrix}}.}
 \item{W}{A Kx2 \code{\link[base]{matrix}} of probe-affinity estimates.}
 \item{H}{A 2xI \code{\link[base]{matrix}} of allele-specific copy-number estimates.}
 \item{tau}{A scalar specifying the threshold for identifying outliers.}
 \item{...}{Not used.}
}

\value{
  Returns an IxK \code{\link[base]{matrix}} where outliers have been "pruned".
  Outliers are substituted by the corresponding value of \code{Yest}.
}


\keyword{internal}
