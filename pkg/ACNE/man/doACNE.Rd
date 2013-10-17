%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  doACNE.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{doACNE}
\alias{doACNE.default}
\alias{doACNE}
\alias{doACNE.AffymetrixCelSet}

\title{(ACNE)}

\description{
 (ACNE) based on [1].
 The algorithm is processed in bounded memory, meaning virtually
 any number of arrays can be analyzed on also very limited computer
 systems.
}

\usage{
  \method{doACNE}{AffymetrixCelSet}(csR, fln=FALSE, drop=TRUE, verbose=FALSE, ...)
  \method{doACNE}{default}(dataSet, ..., verbose=FALSE)
}

\arguments{
 \item{csR, dataSet}{An \code{\link{AffymetrixCelSet}} (or the name of an
  \code{\link{AffymetrixCelSet}}).}
 \item{fln}{If \code{\link[base:logical]{TRUE}}, CRMAv2-style PCR fragment-length normalization
  is performed, otherwise not.}
 \item{drop}{If \code{\link[base:logical]{TRUE}}, the RMA summaries are returned, otherwise
  a named \code{\link[base]{list}} of all intermediate and final results.}
 \item{verbose}{See \code{\link{Verbose}}.}
 \item{...}{Additional arguments used to set up \code{\link{AffymetrixCelSet}}
  (when argument \code{dataSet} is specified).}
}

\value{
  Returns a named \code{\link[base]{list}}, iff \code{drop == FALSE}, otherwise
  a named \code{\link[base]{list}} of \code{\link[aroma.core]{AromaUnitTotalCnBinarySet}}
  and \code{\link[aroma.core]{AromaUnitFracBCnBinarySet}}.
}

\references{
 [1] M. Ortiz-Estevez, H. Bengtsson, A. Rubio, \emph{ACNE: a summarization method to estimate allele-specific copy numbers for Affymetrix SNP arrays}, Bioinformatics, 2010 [PMC2913655].
 \cr
}

\author{Henrik Bengtsson}

