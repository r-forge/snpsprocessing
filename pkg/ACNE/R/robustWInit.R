###########################################################################/** 
# @RdocFunction robustWInit
#
# @title "Robust initialization of the W (affinity) matrix"
#
# \description{
#  @get "title".
# }
# 
# @synopsis
#
# \arguments{
#  \item{V}{An KxI @matrix where I is the number of arrays and K is the 
#     number of probes where K should be even (K=2L).}
#  \item{H}{A 2xI @matrix of allele-specific copy-number estimates.}
#  \item{maxIter}{The maximum number of iterations.}
#  \item{...}{Not used.}
# }
#
# \value{
#   Returns a Kx2 @matrix of robustified probe-affinity estimates.
# }
#
# \details{
#   This function utilized a random number generator.
# }
#
# @keyword internal
#*/###########################################################################
robustWInit <- function(V, H, maxIter=50, ...) {
  # Number of arrays
  I <- ncol(V);
  # Number of probes
  K <- nrow(V);
  # Number of probe pairs
  L <- as.integer(K/2);

  # Sanity check (may be removed in the future /HB 2009-03-24)
  stopifnot(nrow(H) == 2 && ncol(H) == I);

  # A small positive value
  eps <- 1e-5;

  Ws <- matrix(0, nrow=K, ncol=2*maxIter);
  W <- matrix(0, nrow=K, ncol=2);

  # Create genotyping group of samples
  #AA <- which(H[2,] < 0.5 & H[1,] > 0.5);
  #AB <- which(H[1,] > 0.5 & H[2,] > 0.5);
  #BB <- which(H[1,] < 0.5 & H[2,] > 0.5);
  AA <- which(2*H[2,] <  H[1,]);
  BB <- which(H[2,] > 2*H[1,]);
  AB <- which(H[2,] < 2*H[1,] & 2*H[2,] >  H[1,]);
  
  nAA <- length(AA);
  nAB <- length(AB);
  nBB <- length(BB);
  
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Step 1: 
  # In case most of the samples belong to only one group we twist some
  # of them so we "have" signal from both alleles.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  percSamples <- floor(0.85*I);
  if (nAA > percSamples || nAB > percSamples || nBB > percSamples) {
    rrA <- 1:L;
    rrB <- (L+1):K;
    idxs <- sample(I, size=floor(I/2));

    # Majority are heterozygotes?
    if (nAB > percSamples) {
      V[rrA,idxs] <- min(V);
      V[rrB,idxs] <- V[rrB,idxs] * 2;
      H[1,idxs] <- 0;
      H[2,idxs] <- 2;
    } else {
      aux <- V[rrA,idxs];
      V[rrA,idxs] <- V[rrB,idxs];
      V[rrB,idxs] <- aux;
      aux <- H[1,idxs];
      H[1,idxs] <- H[2,idxs];
      H[2,idxs] <- aux;
    }
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Step 2:
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Assign arrays into genotype groups (AA, AB, BB).
#  AA <- which(H[2,] < 0.5 & H[1,] > 0.5);
#  AB <- which(H[1,] > 0.5 & H[2,] > 0.5);
#  BB <- which(H[1,] < 0.5 & H[2,] > 0.5);
  AA <- which(2*H[2,] <  H[1,]);
  BB <- which(H[2,] > 2*H[1,]);
  AB <- which(H[2,] < 2*H[1,] & 2*H[2,] >  H[1,]);

  nAA <- length(AA);
  nAB <- length(AB);
  nBB <- length(BB);

  cont <- 1;
  for (ii in 1:maxIter) {
    # select two random samples with different genotype
    groups <- sample(1:3, size=2);
    sampleAA <- 0L;
    sampleBB <- 0L;
    sampleAB <- 0L;
    if(nBB == 0 || nAB == 0 || (nAA > 0 && (groups[1] == 1 || groups[2] == 1))) {
      idx <- sample(nAA, size=1);
      sampleAA <- AA[idx];
    }

    if(nAA == 0 || nAB == 0 || (nBB > 0 && (groups[1] == 2 || groups[2] == 2))) {
      idx <- sample(nBB, size=1);
      sampleBB <- BB[idx];
    }

    if(nAA == 0 || nBB == 0 || (nAB > 0 && (groups[1] == 3 || groups[2] == 3))) {
      idx <- sample(nAB, size=1);
      sampleAB <- AB[idx];
    }

    if (sampleAA*sampleBB > 0) {
      cc <- c(sampleAA, sampleBB);
    } else if (sampleAB*sampleBB > 0) {
      cc <- c(sampleAB, sampleBB);
    } else {
      cc <- c(sampleAA, sampleAB);
    }
    dd <- c(cont,cont+1);
    Ws[,dd] <- t(miqr.solve(t(H[,cc]),t(V[,cc])));

    cont <- cont + 2;
  } # for (ii ...)

  oddIdxs <- seq(from=1, to=2*maxIter, by=2);
  evenIdxs <- seq(from=2, to=2*maxIter, by=2);
  mediansWA <- rowMedians(Ws[,oddIdxs,drop=FALSE]);
  mediansWB <- rowMedians(Ws[,evenIdxs,drop=FALSE]);

  # Truncate non-positive values
  mediansWA[mediansWA < 0] <- eps;
  mediansWB[mediansWB < 0] <- eps;

  W[,1] <- mediansWA;
  W[,2] <- mediansWB;

  # Sanity check (may be removed in the future /HB 2009-03-24)
  stopifnot(nrow(W) == K && ncol(W) == 2);

  W;
} # robustWInit()


############################################################################
# HISTORY:
# 2009-02-24 [HB]
# o Added Rdoc comments.
# o Cleanig up and standarizing code.
# 2009-02-02 [MO]
# o Change some code to make it more efficient.
# 2009-01-30 [MO]
# o Created
############################################################################