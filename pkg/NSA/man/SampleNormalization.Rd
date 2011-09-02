%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  SampleNormalization.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{SampleNormalization}
\docType{class}
\alias{SampleNormalization}


 \title{The SampleNormalization class}

 \description{                                                                                                                                                                                  
  Package:  NSA \cr
\bold{Class SampleNormalization}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{SampleNormalization}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{SampleNormalization}\cr
extends \link[R.oo]{Object}\cr



  This class represents the Sample normalization method [1], which
  looks for normal regions within the tumoral samples.
 }
                                                                                                                                                        
 \usage{SampleNormalization(data=NULL, tags="*", ...)}

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
 \tab \code{findArraysTodo} \tab  -\cr
 \tab \code{getDataSets} \tab  -\cr
 \tab \code{getFullName} \tab  -\cr
 \tab \code{getName} \tab  -\cr
 \tab \code{getOutputDataSets} \tab  -\cr
 \tab \code{getPath} \tab  -\cr
 \tab \code{getRootPath} \tab  -\cr
 \tab \code{getTags} \tab  -\cr
 \tab \code{nbrOfFiles} \tab  -\cr
 \tab \code{\link[NSA:process.SampleNormalization]{process}} \tab Finds normal regions within tumoral samples.\cr
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
   Low-level versions of the Sample normalization method is available
   via the \code{\link{sampleNByTotalAndFracB.numeric}}() methods.
 }
\keyword{classes}
