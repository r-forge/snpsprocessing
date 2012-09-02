setMethodS3("doACNE", "AffymetrixCelSet", function(csR, ..., fln=FALSE, ram=NULL, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  # Argument 'csR':
  className <- "AffymetrixCelSet";
  if (!inherits(csR, className)) {
    throw(sprintf("Argument 'csR' is not a %s: %s", className, class(csR)[1]));
  }

  # Argument 'fln':
  fln <- Arguments$getVerbose(fln);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);


  verbose && enter(verbose, "ACNE");
  verbose && cat(verbose, "Arguments:");
  verbose && cat(verbose, "ram: ", ram);

  verbose && cat(verbose, "Data set");
  verbose && print(verbose, csR);

  verbose && enter(verbose, "ACNE/CRMAv2/Allelic crosstalk calibration");
  acc <- AllelicCrosstalkCalibration(csR, model="CRMAv2");
  verbose && print(verbose, acc);
  csC <- process(acc, verbose=verbose);
  verbose && print(verbose, csC);
  verbose && exit(verbose);

  # Clean up
  rm(csR, acc);
  gc <- gc();
  verbose && print(verbose, gc);

  verbose && enter(verbose, "ACNE/CRMAv2/Base position normalization");
  bpn <- BasePositionNormalization(csC, target="zero");
  verbose && print(verbose, bpn);
  csN <- process(bpn, verbose=verbose);
  verbose && print(verbose, csN);
  verbose && exit(verbose);

  # Clean up
  rm(csC, bpn);
  gc <- gc();
  verbose && print(verbose, gc);
  
  verbose && enter(verbose, "ACNE/Probe summarization");
  plm <- NmfSnpPlm(csN, mergeStrands=TRUE);
  verbose && print(verbose, plm);
  if (length(findUnitsTodo(plm)) > 0) {
    # Fit CN probes quickly (~5-10s/array + some overhead)
    units <- fitCnProbes(plm, verbose=verbose);
    verbose && str(verbose, units);
    # Fit remaining units, i.e. SNPs (~5-10min/array)
    units <- fit(plm, ram=ram, verbose=verbose);
    verbose && str(verbose, units);
    rm(units);
  }  
  verbose && print(verbose, gc);
  ces <- getChipEffectSet(plm);
  verbose && print(verbose, ces);
  verbose && exit(verbose);

  # Clean up
  rm(plm, csN);
  gc <- gc();

  # PCR fragment-length normalization?
  if (fln) {
    verbose && enter(verbose, "ACNE/CRMAv2/PCR fragment-length normalization");
    fln <- FragmentLengthNormalization(ces, target="zero");
    verbose && print(verbose, fln);
    cesN <- process(fln, verbose=verbose);
    verbose && print(verbose, cesN);
    verbose && exit(verbose);
  
    # Clean up
    rm(fln, ces);
    gc <- gc();
  } else {
    cesN <- ces;
  }
  
  verbose && enter(verbose, "ACNE/Export to technology-independent data files");
  res <- exportTotalAndFracB(cesN, verbose=verbose);
  verbose && print(verbose, res);
  verbose && exit(verbose);

  # Clean up
  rm(cesN);
  gc <- gc();

  verbose && exit(verbose);

  res;
}) # doACNE()


setMethodS3("doACNE", "character", function(dataSet, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'dataSet':
  dataSet <- Arguments$getCharacter(dataSet);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);


  verbose && enter(verbose, "ACNE");

  verbose && enter(verbose, "ACNE/Setting up CEL set");
  csR <- AffymetrixCelSet$byName(dataSet, ..., verbose=less(verbose, 50),
                                                  .onUnknownArgs="ignore");
  verbose && print(verbose, csR);
  verbose && exit(verbose);

  res <- doACNE(csR, ..., verbose=verbose);

  # Clean up
  rm(csR);
  gc <- gc();

  verbose && exit(verbose);

  res;
}) # doACNE()


############################################################################
# HISTORY:
# 2010-05-17
# o Created from doCRMAv2() in aroma.affymetrix.
############################################################################
