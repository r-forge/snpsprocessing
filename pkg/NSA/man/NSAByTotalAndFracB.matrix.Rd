%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  NSAByTotalAndFracB.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 \name{NSAByTotalAndFracB.matrix}
\alias{NSAByTotalAndFracB.matrix}
\alias{NSAByTotalAndFracB.matrix}

 \alias{NSAByTotalAndFracB}

 \title{Finds normal regions within tumoral samples (total,fracB)}

 \description{
  Finds normal regions within tumoral samples (total,fracB), where total is the total (non-polymorphic) signal and
  fracB is the allele B fraction.
  It is only loci with a non-missing (\code{\link[base]{NA}}) fracB value that are
  considered to be SNPs and normalized by CalMaTe.  The other loci
  are left untouched.
 }

 \usage{\method{NSAByTotalAndFracB}{matrix}(data, ..., verbose=FALSE)}

 \arguments{
  \item{data}{An Jx2 \code{\link[base]{matrix}}, where J is the number of loci and
                      2 is total and fracB.}
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
 }

 \value{
   Returns an Jx2 \code{\link[base]{numeric}} \code{\link[base]{array}}.
 }
\keyword{methods}
