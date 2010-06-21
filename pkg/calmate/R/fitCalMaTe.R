fitCalMaTe <- function(T, references, fB1=1/3, fB2=2/3, maxIter=50, ...) {
  # This is an internal function. Because of this, we will assume that
  # all arguments are valid and correct.  No validation will be done.
  nbrOfSNPs <- nrow(T);
  nbrOfReferences <- length(references);

  # Adding a small value so there are "non" 0 values
  eps <- 1e-6;
  T[T < eps] <- eps;
  
  a <- max(max(T[2,] / (pmax(T[1,],0) + 1e-4)), max(T[1,] / (pmax(T[2,],0) + 1e-4)));
  Giro <- matrix(c(1, 1/a, 1/a, 1), nrow=2, ncol=2, byrow=FALSE);
  Giro <- solve(Giro);
  T <- Giro %*% T;

  # Extract the signals for the reference set
  TR <- T[,references];

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Checking if all the samples are homozygous
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fracB <- TR[2,] / (TR[1,] + TR[2,]);
  naiveGenoDiff <- 2*(fracB < fB1) - 2*(fracB > fB2);

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Twist half of the samples in case there is only one allele?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  onlyOneAllele <- (abs(sum(naiveGenoDiff)/2) == length(naiveGenoDiff));
  if (onlyOneAllele) {
    idxs <- seq(length=ncol(T)/2);
    T[1:2,idxs] <- T[2:1,idxs];

    # Update precalcalculated signals
    TR <- T[,references];
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Total copy numbers must be close to 2 for the reference samples or
  # (if there are not control samples) for most of the samples
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  H <- matrix(2, nrow=nbrOfReferences, ncol=1, byrow=FALSE);
  fit <- rlm(t(TR), H, maxit=maxIter);
  matSum <- fit$coefficients;
  coeffs <- fit$w;
  T <- diag(matSum) %*% T;

  # Reextract the signals for the reference set
  TR <- T[,references];

  # The difference of the copy numbers must be 2, 0 or -2 depending genotyping
  fracB <- TR[2,] / (TR[1,] + TR[2,]);
  naiveGenoDiff <- 2*(fracB < fB1) - 2*(fracB > fB2);
  fit <- rlm(t(TR), naiveGenoDiff, maxit=maxIter, weights=coeffs);
  matDiff <- fit$coefficients;

  # P matrix is:
  #  [1  1] [   ] = [MatSum[1]   MatSum[2]] (We have already applied it) MatSum is 1,1
  #  [1 -1] [ P ]   [MatDiff[1] MatDiff[2]]
  U <- matrix(c(0.5, 0.5, 0.5, -0.5), nrow=2, ncol=2, byrow=FALSE);
  V <- matrix(c(c(1,1), matDiff), nrow=2, ncol=2, byrow=TRUE);
  P <- U %*% V;
  
  res <- P %*% T;


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Undo the previous change applied to the data in case there is 
  # only one allele    
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (onlyOneAllele) {
    idxs <- seq(length=ncol(res)/2);
    res[1:2,idxs] <- res[2:1,idxs];
  }

  res;
} # fitCalMaTe()


###########################################################################
# HISTORY:
# 2010-06-19 [HB]
# o Added argument 'truncate' for optional truncating of (CA,CB).
# 2010-06-18 [HB]
# o Created from refineCN.list().
###########################################################################