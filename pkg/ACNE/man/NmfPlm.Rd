%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  NmfPlm.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{NmfPlm}
\docType{class}
\alias{NmfPlm}


\title{The NmfPlm class}

\description{
 Package:  ACNE \cr
\bold{Class NmfPlm}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[aroma.core]{ParametersInterface}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[aroma.affymetrix]{Model}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{UnitModel}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{MultiArrayUnitModel}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{ProbeLevelModel}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~+--}\emph{\code{NmfPlm}}\cr

\bold{Directly known subclasses:}\cr
\emph{\link[ACNE]{NmfSnpPlm}}\cr

public abstract static class \bold{NmfPlm}\cr
extends \emph{\link[aroma.affymetrix]{ProbeLevelModel}}\cr



 This class represents the NMF model of [REF].
}

\usage{
NmfPlm(..., maxIter=10, maxIterRlm=20, refs=NULL, flavor=c("v4", "v3", "v2", "v1"))
}

\arguments{
  \item{...}{Arguments passed to \code{\link[aroma.affymetrix]{ProbeLevelModel}}.}
  \item{maxIter}{The maximum number of iteration in the NMF step.}
  \item{maxIterRlm}{A positive \code{\link[base]{integer}} specifying the maximum number of
    iterations used in rlm.}
  \item{refs}{An index \code{\link[base]{vector}} (\code{\link[base]{integer}} or \code{\link[base]{logical}}) specifying the
    reference samples.  If \code{\link[base]{NULL}}, all samples are used as a reference.}
  \item{flavor}{(Internal/developmental only)
     A \code{\link[base]{character}} string specifying which algorithm to use.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{getAsteriskTags} \tab  -\cr
}


 \bold{Methods inherited from ProbeLevelModel}:\cr
calculateResidualSet, calculateWeights, fit, getAsteriskTags, getCalculateResidualsFunction, getChipEffectSet, getProbeAffinityFile, getResidualSet, getRootPath, getWeightsSet

 \bold{Methods inherited from MultiArrayUnitModel}:\cr
getListOfPriors, setListOfPriors, validate

 \bold{Methods inherited from UnitModel}:\cr
findUnitsTodo, getAsteriskTags, getFitSingleCellUnitFunction, getParameters

 \bold{Methods inherited from Model}:\cr
as.character, fit, getAlias, getAsteriskTags, getDataSet, getFullName, getName, getParameterSet, getPath, getRootPath, getTags, setAlias, setTags

 \bold{Methods inherited from ParametersInterface}:\cr
getParameterSets, getParameters, getParametersAsString

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save, asThis


}

\seealso{
  Internally, for each SNP the NMF model is fitted using the
  \code{\link{fitSnpNmf}}() function.
}

\references{
 [1] M. Ortiz-Estevez, H. Bengtsson, A. Rubio, \emph{ACNE: a summarization method to estimate allele-specific copy numbers for Affymetrix SNP arrays}, Bioinformatics, 2010 [PMC2913655].
 \cr
}

\author{Henrik Bengtsson}
\keyword{classes}
