if (interactive()) savehistory();
library("aroma.affymetrix");
library("aroma.affymetrix.nmf");


# - - - - - - - - - - - - - - - - - - - - - - -
# setup dataset and chip names
# - - - - - - - - - - - - - - - - - - - - - - -
log <- Arguments$getVerbose(-10, timestamp=TRUE);

dataSetName <- "Both"
chipType <- "Mapping50K_Xba240"

# - - - - - - - - - - - - - - - - - - - - - - -
# Setup annotation data
# - - - - - - - - - - - - - - - - - - - - - - -
cdf <- AffymetrixCdfFile$byChipType(chipType);
print(cdf);
gi <- getGenomeInformation(cdf);
print(gi);
si <- getSnpInformation(cdf);
print(si);


# - - - - - - - - - - - - - - - - - - - - - - -
# Setup data set
# - - - - - - - - - - - - - - - - - - - - - - -
csR <- AffymetrixCelSet$byName(dataSetName, cdf=cdf);
print(csR);


# - - - - - - - - - - - - - - - - - - - - - - -
# Calibrate and normalize
# - - - - - - - - - - - - - - - - - - - - - - -
acc <- AllelicCrosstalkCalibration(csR, model="CRMAv2", tags="*,v2");
print(acc);
csC <- process(acc, verbose=log);
print(csC);

bpn <- BasePositionNormalization(csC, target="zero");
print(bpn);
csN <- process(bpn, verbose=log);
print(csN);


# - - - - - - - - - - - - - - - - - - - - - - -
# Summarize replicated probes
# - - - - - - - - - - - - - - - - - - - - - - -
# Process Chr22 for now
chromosome <- 22;
units <- getUnitsOnChromosome(gi, chromosome);
str(units);

plm <- NmfSnpPlm(csN, mergeStrands=TRUE);
print(plm);
fit(plm, units=units, verbose=log);
ces <- getChipEffectSet(plm);
print(ces);


# - - - - - - - - - - - - - - - - - - - - - - -
# Fragment-length normalization
# - - - - - - - - - - - - - - - - - - - - - - -
# Can only be done if all units are fitted
if (FALSE) {
  fln <- FragmentLengthNormalization(ces, target="zero");
  print(fln);
  cesN <- process(fln, verbose=log);
  print(cesN);
} else {
  cesN <- ces;
}

# - - - - - - - - - - - - - - - - - - - - - - -
# Segmentation
# - - - - - - - - - - - - - - - - - - - - - - -
# CBS needs theta = thetaA + thetaB
as <- AlleleSummation(ces);
cesT <- process(as, verbose=log);
cbs <- CbsModel(cesT);
print(cbs);
ce <- ChromosomeExplorer(cbs);
print(ce);

process(ce, chromosome=chromosome, verbose=log);
