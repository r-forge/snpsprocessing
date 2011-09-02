
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CRMAv2 - Preprocess raw Affymetrix data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
library(aroma.affymetrix);
library(NSA);

dataSet <- "NSAtest6.0"
chipType <- "GenomeWideSNP_6,Full";
dsList <- doCRMAv2(dataSet, chipType=chipType, combineAlleles=TRUE, 
                                             plm="RmaCnPlm", verbose=-10);
print(dsList);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NSA - Finding normal regions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asnN <- NSANormalization(dsList);
print(asnN);

dsNNList <- process(asnN, verbose=verbose);
print(dsNNList);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NSA - SNPs Normalization
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asnNsnps <- SNPsNormalization(dsList);
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
# Plot Normal Regions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sample #3 and Chromosome 6
ii <- 3;
chr <- 6;
dfNN <- getFile(dsNNList$normalReg, ii);

betaNN <- extractRawAlleleBFractions(dfNN, chromosome=chr);

plot(betaNN);
title(sprintf("%s (NSA)", getName(betaNN)));

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
title(sprintf("%s", getName(fracBN)));
plot(totalN);
title(sprintf("%s ", getName(totalN)));


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Plot Normalized by Sample data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Sample #9 and Chromosome 8
ii <- 1;
chr <- 7;

dfC <- getFile(dsList$total, ii);
CNC <- extractRawCopyNumbers(dfC, chromosome=chr);

dfN <- getFile(dsNNListSample$fracB, ii);
fracBN <- extractRawAlleleBFractions(dfN, chromosome=chr);

dfN <- getFile(dsNNListSample$total, ii);
totalN <- extractRawCopyNumbers(dfN, chromosome=chr);

x11();
subplots(2, ncol=1);
plot(fracBN);
title(sprintf("%s", getName(fracBN)));
plot(totalN$x, 2^totalN$y);
title(sprintf("%s ", getName(totalN)));

x11();
plot(CNC);
points(totalN, col="green");
