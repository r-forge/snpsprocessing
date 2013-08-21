%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  snpArrayToMatrix.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{snpArrayToMatrix}
\alias{snpArrayToMatrix}

 \alias{snpMatrixToArray}

 \title{Reshapes SNP data in matrix form to array form and vice versa}

 \description{
  Reshapes SNP data in matrix form to array form and vice versa.
 }

 \usage{
snpArrayToMatrix(Y, dropNames=TRUE, ...)
}

 \arguments{
  \item{Y}{A 2LxI \code{\link[base]{matrix}} or a Lx2xI \code{\link[base]{array}},
    where L is the number of probe pairs and I is the number of arrays.}
  \item{dropNames}{If \code{\link[base:logical]{TRUE}}, dimension names are dropped,
    otherwise preserved.}
  \item{...}{Not used.}
 }

 \value{
  Returns a Lx2xI \code{\link[base]{array}} or a 2LxI matrix.
 }

 \examples{
Y <- matrix(rnorm(200), nrow=20, ncol=10)
str(Y)

V <- snpMatrixToArray(Y)
str(V)

Y2 <- snpArrayToMatrix(V)
str(Y2)

stopifnot(identical(Y2, Y))

}


\keyword{internal}
