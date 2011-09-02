%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  sampleNByTotalAndFracB.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 \name{sampleNByTotalAndFracB.numeric}
\alias{sampleNByTotalAndFracB.numeric}
\alias{sampleNByTotalAndFracB.numeric}

 \alias{sampleNByTotalAndFracB}

 \title{Normalize total copy numbers by samples (total,fracB)}

 \description{
  Normalize total copy numbers by samples (total,fracB), where total is the total (non-polymorphic) signal and
  fracB is the allele B fraction.
  It is only loci with a non-missing (\code{\link[base]{NA}}) fracB value that are
  considered to be SNPs and normalized by NSA.  The other loci
  are left untouched.
 }

 \usage{\method{sampleNByTotalAndFracB}{numeric}(data, references=NULL, ..., verbose=FALSE)}

 \arguments{
  \item{data}{An J \code{\link[base]{numeric}} \code{\link[base]{vector}}, where J is the number of loci for an specific sample.}
  \item{references}{An object specifying the normal regions of each sample.}
  \item{...}{Additional arguments passed to
         fitSNPsN.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
 }

 \value{
   Returns an Jx2 \code{\link[base]{numeric}} \code{\link[base]{array}}.
 }
\keyword{methods}
