%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  SNPsNormalization.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{SNPsNormalization}
\docType{class}
\alias{SNPsNormalization}


 \title{The SNPsNormalization class}

 \description{                                                                                                                                                                           
  Package:  NSA \cr
\bold{Class SNPsNormalization}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{SNPsNormalization}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{SNPsNormalization}\cr
extends \link[R.oo]{Object}\cr



  This class represents the SNPs normalization method [1], which
  corrects for SNP effects in allele-specific copy-number estimates
  (ASCNs).
 }

 \usage{SNPsNormalization(data=NULL, tags="*", ...)}

 \arguments{
   \item{data}{A named \code{\link[base]{list}} with data set named \code{"total"} and
     \code{"fracB"} where the former should be of class
     \code{\link[aroma.core]{AromaUnitTotalCnBinarySet}} and the latter of
     class \code{\link[aroma.core]{AromaUnitFracBCnBinarySet}}.  The
     two data sets must be for the same chip type, have the same
     number of samples and the same sample names.}
   \item{tags}{Tags added to the output data sets.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{findUnitsTodo} \tab  -\cr
 \tab \code{getDataSets} \tab  -\cr
 \tab \code{getFullName} \tab  -\cr
 \tab \code{getName} \tab  -\cr
 \tab \code{getOutputDataSets} \tab  -\cr
 \tab \code{getPath} \tab  -\cr
 \tab \code{getRootPath} \tab  -\cr
 \tab \code{getTags} \tab  -\cr
 \tab \code{nbrOfFiles} \tab  -\cr
 \tab \code{process} \tab  -\cr
 \tab \code{setTags} \tab  -\cr
}


 \bold{Methods inherited from Object}:\cr
asThis, $, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, registerFinalizer, save


 }

 \details{
   ...
 }


 \references{
   [1] ...
 }

 \seealso{
   Low-level versions of the SNPs normalization method is available
   via \code{\link{snpsNByTotalAndFracB.matrix}}() methods.
 }
\keyword{classes}
