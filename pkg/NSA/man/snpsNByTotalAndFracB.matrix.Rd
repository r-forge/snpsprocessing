%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  snpsNByTotalAndFracB.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 \name{snpsNByTotalAndFracB.matrix}
\alias{snpsNByTotalAndFracB.matrix}
\alias{snpsNByTotalAndFracB.matrix}

 \alias{snpsNByTotalAndFracB}

 \title{Normalize allele-specific copy numbers (total,fracB)}

 \description{
  Normalize allele-specific copy numbers (total,fracB), where total is the total (non-polymorphic) signal and
  fracB is the allele B fraction.
  It is only loci with a non-missing (\code{\link[base]{NA}}) fracB value that are
  considered to be SNPs and normalized by CalMaTe.  The other loci
  are left untouched.
 }

 \usage{\method{snpsNByTotalAndFracB}{matrix}(data, references=NULL, ..., verbose=FALSE)}

 \arguments{
  \item{data}{An Jx2xI \code{\link[base]{numeric}} \code{\link[base]{array}}, where J is the number of loci,
                      2 is total and fracB, and I is the number of samples.}
  \item{references}{A \code{\link[base]{logical}} or \code{\link[base]{numeric}} \code{\link[base]{vector}} specifying which
     samples should be used as the reference set.
     By default, all samples are considered.}
  \item{...}{Additional arguments passed to fitSNPsN.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
 }

 \value{
   Returns an Jx2xI \code{\link[base]{numeric}} \code{\link[base]{array}}.
 }
\keyword{methods}
