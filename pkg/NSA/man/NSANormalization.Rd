%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  NSANormalization.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{NSANormalization}
\docType{class}
\alias{NSANormalization}


 \title{The NSANormalization class}

 \description{
  Package:  NSA \cr
\bold{Class NSANormalization}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{NSANormalization}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{NSANormalization}\cr
extends \link[R.oo]{Object}\cr



  This class represents the NSA normalization method [1], which
  looks for normal regions within the tumoral samples.
 }
                                                                                                                                                        
 \usage{NSANormalization(data=NULL, tags="*", ...)}

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
 \tab \code{\link[NSA:process.NSANormalization]{process}} \tab Finds normal regions within tumoral samples.\cr
 \tab \code{setTags} \tab  -\cr
}


 \bold{Methods inherited from Object}:\cr
asThis, $, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, registerFinalizer, save


 }

 \details{
   ...
 }

 \examples{\dontrun{
  
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CRMAv2 - Preprocess raw Affymetrix data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
library("aroma.affymetrix");  # Needed for CRMAv2
#library("calmate");
library(MASS)
source("F:/MOrtiz/curro/Aroma/calmate/R/CalMaTeNormalization.R")
source("F:/MOrtiz/curro/Aroma/calmate/R/calmateByTotalAndFracB.R")
source("F:/MOrtiz/curro/Aroma/calmate/R/calmateByThetaAB.R")
source("F:/MOrtiz/curro/Aroma/calmate/R/fitCalMaTe.R")
source("F:/MOrtiz/curro/Aroma/calmate/R/fitCalMaTeCNprobes.R")
source("F:/MOrtiz/curro/Aroma/calmate/R/thetaAB2TotalAndFracB.R")

source("F:/MOrtiz/curro/Aroma/NSA/R/NSANormalization.R")
source("F:/MOrtiz/curro/Aroma/NSA/R/NSAByTotalAndFracB.R")
source("F:/MOrtiz/curro/Aroma/NSA/R/fitNSA.R")

source("F:/MOrtiz/curro/Aroma/NSA/R/SNPsNormalization.R")
source("F:/MOrtiz/curro/Aroma/NSA/R/SNPsNByTotalAndFracB.R")
source("F:/MOrtiz/curro/Aroma/NSA/R/fitSNPsN.R")

source("F:/MOrtiz/curro/Aroma/NSA/R/SampleNormalization.R")
source("F:/MOrtiz/curro/Aroma/NSA/R/SampleNByTotalAndFracB.R")
source("F:/MOrtiz/curro/Aroma/NSA/R/fitSample.R")
library("DNAcopy");

setwd("I:/aroma")

dataSet <- "breast cancer";
dataSet <- "GSE12702-prostateCancerPaired"
dataSet <- "GSE12702-prostateCancer"
dataSet <- "GSE14996,testSet"

chipType <- "Mapping250K_Nsp";
#chipType <- "GenomeWideSNP_6"
dsList <- doCRMAv2(dataSet, chipType=chipType, combineAlleles=FALSE,
                                             plm="RmaCnPlm", verbose=-10);
print(dsList);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CalMaTe - Post-normalization of ASCNs estimates
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
asn <- CalMaTeNormalization(dsList);
print(asn);

# For speed issues, we will here only process loci on Chromosome 17.
chr <- 22;
ugp <- getAromaUgpFile(dsList$total);
units <- getUnitsOnChromosome(ugp, chr);

dsNList <- process(asn, units=units, verbose=verbose);
#dsNList <- process(asn, references = seq(2,40,2), verbose=verbose);
#dsNList <- process(asn, verbose=verbose);
print(dsNList);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NSA - Finding normal regions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asnN <- NSANormalization(dsNList);
print(asnN);

dsNNList <- process(asnN, verbose=verbose);
print(dsNNList);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NSA - SNPs Normalization
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asnNsnps <- SNPsNormalization(dsNList);
print(asnNsnps);

dsNNListSNPs <- process(asnNsnps, references = dsNNList, verbose=verbose);
print(dsNNListSNPs);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NSA - Sample Normalization
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asnNsample <- SampleNormalization(dsNNListSNPs);
print(asnNsample);

dsNNListSample <- process(asnNsample, references = dsNNList, verbose=verbose);
print(dsNNListSample);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NSA - SNPs Normalization
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asnNsnps <- SNPsNormalization(dsNNListSample);
print(asnNsnps);

dsListSNPs <- process(asnNsnps, references = dsNNList, verbose=verbose);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NSA - Sample Normalization
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asnNsample <- SampleNormalization(dsListSNPs);
print(asnNsample);

dsListSample <- process(asnNsample, references = dsNNList, verbose=verbose);
print(dsNNListSample);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CalMaTe - sigma delta validation  (for CRMAv2)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Alt 1: Calculate CN ratios where the reference is a pool of specific references samples

references <- c(1:20);

dsR <- extract(dsList$total, references);
dfR <- getAverageFile(dsR);
cnm <- CopyNumberChromosomalModel(dsList$total, dfR);

# Alt 2: Calculate CN ratios where the reference is the pool of all samples
cnm <- CopyNumberChromosomalModel(dsList$total);
print(cnm);

# Extract CN ratios - C=theta/thetaR
cn <- extractRawCopyNumbers(cnm, array=ii, chromosome=chr, logBase=NULL);
cn$y <- 2*cn$y;
print(cn);

# As a data frame
#data <- as.data.frame(cn);

# Estimate std dev (via first-order variance estimator)
sigma <- estimateStandardDeviation(cn);
print(sigma);

# Plot
x11();plot(cn, ylim=c(0,6));
sigmaStr <- sprintf("\%.3f", sigma);
stext(side=3, pos=0.5, line=-1, substitute(hat(sigma)[Delta]==x, list(x=sigmaStr)));

# Smooth (bins of 1.0Mb)
cnS <- binnedSmoothing(cn, by=1.0e6);
print(cnS);
points(cnS, col="red");
lines(cnS, col="red");

# Segmentation
fit <- segmentByCBS(cn);
cnr <- extractCopyNumberRegions(fit);
print(cnr);
drawLevels(cnr, col="blue", lwd=3);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CalMaTe - sigma delta validation  (for CalMaTe)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Alt 1: Calculate CN ratios where the reference is a pool of specific references samples

references <- c(1:24)

# Alt 2: Calculate CN ratios where the reference is the pool of all samples
#cnm <- CopyNumberChromosomalModel(dsNNListSample$total);

#cnm <- CopyNumberChromosomalModel(dsNList$total);
#print(cnm);

# Extract CN ratios - C=theta/thetaR
#cn <- extractRawCopyNumbers(cnm, array=ii, chromosome=chr, logBase=NULL);

dataNSA <- extractMatrix(dsNList$total,units = units);
cnNSA <- cn;
cnNSA$y <- dataNSA[,ii];
cn <- cnNSA;


# As a data frame
data <- as.data.frame(cn);

# Estimate std dev (via first-order variance estimator)
sigma <- estimateStandardDeviation(cn);
print(sigma);

# Plot
x11();plot(cn, ylim=c(0,6));
sigmaStr <- sprintf("\%.3f", sigma);
stext(side=3, pos=0.5, line=-1, substitute(hat(sigma)[Delta]==x, list(x=sigmaStr)));
                                                       
# Smooth (bins of 1.0Mb)
cnS <- binnedSmoothing(cn, by=1.0e6);
print(cnS);
points(cnS, col="red");
lines(cnS, col="red");

# Segmentation
fit <- segmentByCBS(cn);
cnr <- extractCopyNumberRegions(fit);
print(cnr);
drawLevels(cnr, col="blue", lwd=3);


#You can obtain the above 'cn' manually as:

dsR <- extract(dsList$total, references);
dfR <- getAverageFile(dsR);

df <- getFile(dsList$total, ii);
theta <- extractRawCopyNumbers(df, chromosome=chr);
print(theta);
thetaR <- extractRawCopyNumbers(dfR, chromosome=chr);
print(thetaR);
cn <- clone(theta);
cn <- divideBy(cn, thetaR);
cn$y <- 2*cn$y;

#sigma delta
mad(diff(cn$y))

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Calculating the differences between CN and SNP probes
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


cnCNP <- RawCopyNumbers(...);
cnSNP <- RawCopyNumbers(...);

xRange <- range(xRange(cnCNP), xRange(cnSNP));

by <- 50e3; # 50kb bins; you may want to try with other amounts of smoothing xOut <- seq(from=xRange[1], to=xRange[2], by=by);

cnCNPS <- binnedSmoothing(cnCNP, xOut=xOut); cnSNPS <- binnedSmoothing(cnSNP, xOut=xOut);

Clim <- c(0,5);
plot(cnCNPS, ylim=Clim);
points(cnSNPS, col="blue");

plot(getSignals(cnCNPS), getSignals(cnSNPS), xlim=Clim, ylim=Clim); abline(a=0, b=1, col="red", lwd=2);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Plot allele B fractions (before and after calmate)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sample #1 and Chromosome 17
ii <- 1;
chr <- 17;
df <- getFile(dsList$fracB, ii);
dfN <- getFile(dsNList$fracB, ii);

beta <- extractRawAlleleBFractions(df, chromosome=chr);
betaN <- extractRawAlleleBFractions(dfN, chromosome=chr);
x11();
subplots(2, ncol=1);
plot(beta);
title(sprintf("\%s", getName(beta)));
plot(betaN);
title(sprintf("\%s (CalMaTe)", getName(betaN)));


for(ii in 1:24){
  df <- getFile(dsList$total, ii);
  CN <- extractRawCopyNumbers(df, chromosome=chr);
  if(ii == 1){
    aux <- CN$y;
  }else{
    aux <- aux + CN$y;
  }
}
ref <- aux/24;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Plot copy numbers (before and after calmate)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sample #1 and Chromosome 17
ii <- 3;
chr <- 1;

df <- getFile(dsList$total, ii);
#dfN <- getFile(dsNList$total, ii);

#units <- getUnitsOnChromosome(gi, ii);
#pos <- getPositions(gi, units = units);
#units <- units[order(pos)];

CN <- extractRawCopyNumbers(df, chromosome=chr);
#CNN <- extractRawCopyNumbers(dfN, chromosome=chr);
#CNN <- extractMatrix(dsNList$total, units = units);
#CNN <- CNN[,ii];


x11();
subplots(2, ncol=1);
plot(CN$x, log2(CN$y));
title(sprintf("\%s", getName(CN)));
plot(CNN);
title(sprintf("\%s (CalMaTe)", getName(CNN)));

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Plot Normal Regions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sample #3 and Chromosome 6
ii <- 1;
chr <- 6;
dfNN <- getFile(dsNNList$normalReg, ii);

betaNN <- extractRawAlleleBFractions(dfNN, chromosome=chr);

plot(betaNN);
title(sprintf("\%s (NSA)", getName(betaNN)));

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Plot Normalized by SNP data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sample #9 and Chromosome 8
ii <- 9;
chr <- 8;
dfN <- getFile(dsNNListSNPs$fracB, ii);
fracBN <- extractRawAlleleBFractions(dfN, chromosome=chr);

dfN <- getFile(dsNNListSNPs$total, ii);
totalN <- extractRawCopyNumbers(dfN, chromosome=chr);

x11();
subplots(2, ncol=1);
plot(fracBN);
title(sprintf("\%s", getName(fracBN)));
plot(totalN);
title(sprintf("\%s ", getName(totalN)));


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Plot Normalized by Sample data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sample #3 and Chromosome 6
ii <- 9;
chr <- 8;

dfC <- getFile(dsNList$total, ii);
CNC <- extractRawCopyNumbers(dfC, chromosome=chr);

dfN <- getFile(dsNNListSample$fracB, ii);
fracBN <- extractRawAlleleBFractions(dfN, chromosome=chr);

dfN <- getFile(dsNNListSample$total, ii);
totalN <- extractRawCopyNumbers(dfN, chromosome=chr);

x11();
subplots(2, ncol=1);
plot(fracBN);
title(sprintf("\%s", getName(fracBN)));
plot(totalN$x, 2^totalN$y);
title(sprintf("\%s ", getName(totalN)));

x11();
plot(CNC);
points(totalN, col="green");

 }}

 \references{
   [1] ...
 }

 \seealso{
   Low-level versions of the NSA normalization method is available
   via the \code{\link{NSAByTotalAndFracB.matrix}}() methods.
 }
\keyword{classes}
