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
\code{~~+--}\code{\link[aroma.affymetrix]{Model}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[aroma.affymetrix]{UnitModel}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{MultiArrayUnitModel}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{ProbeLevelModel}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{NmfPlm}\cr

\bold{Directly known subclasses:}\cr
\link[ACNE]{NmfSnpPlm}\cr

public static class \bold{NmfPlm}\cr
extends \link[aroma.affymetrix]{ProbeLevelModel}\cr



  This class represents the NMF model of [REF].
 }

 \usage{NmfPlm(..., maxIter=10, maxIterRlm=20, refs=NULL, flavor=c("v4", "v3", "v2", "v1"))}

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
calculateResidualSet, calculateWeights, fit, getAsteriskTags, getCalculateResidualsFunction, getChipEffectSet, getProbeAffinityFile, getResidualSet, getWeightsSet

 \bold{Methods inherited from MultiArrayUnitModel}:\cr
getListOfPriors, setListOfPriors, validate

 \bold{Methods inherited from UnitModel}:\cr
findUnitsTodo, getAsteriskTags, getFitSingleCellUnitFunction

 \bold{Methods inherited from Model}:\cr
fit, getAlias, getAsteriskTags, getDataSet, getFullName, getName, getPath, getRootPath, getTags, setAlias, setTags

 \bold{Methods inherited from Object}:\cr
asThis, $, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, registerFinalizer, save


 }

 \seealso{
   Internally, for each SNP the NMF model is fitted using the
   \code{\link{fitSnpNmf}}() function.
 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
