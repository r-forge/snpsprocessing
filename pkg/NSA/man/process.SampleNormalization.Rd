%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  SampleNormalization.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{process.SampleNormalization}
\alias{process.SampleNormalization}
\alias{SampleNormalization.process}
\alias{process.SampleNormalization}
\alias{process,SampleNormalization-method}


 \title{Finds normal regions within tumoral samples}

 \description{
  Finds normal regions within tumoral samples.
 }

 \usage{\method{process}{SampleNormalization}(this, arrays=NULL, references=NULL, ..., force=FALSE, ram=NULL, verbose=FALSE)}

 \arguments{
   \item{...}{Additional arguments passed to
     \code{\link[aroma.light]{normalizeFragmentLength}} (only for advanced users).}
   \item{arrays}{Index vector indicating which samples to process.}
   \item{force}{If \code{\link[base:logical]{TRUE}}, data already normalized is re-normalized,
       otherwise not.}
   \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
 }

 \value{
  Returns a \code{\link[base]{double}} \code{\link[base]{vector}}.
 }
 
 \seealso{
   For more information see \code{\link{SampleNormalization}}.
 }
\keyword{internal}
\keyword{methods}
