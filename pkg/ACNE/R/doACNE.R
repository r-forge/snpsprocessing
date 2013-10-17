###########################################################################/**
# @RdocDefault doACNE
# @alias doACNE.AffymetrixCelSet
#
# @title "(ACNE)"
#
# \description{
#  @get "title" based on [1].
#  The algorithm is processed in bounded memory, meaning virtually
#  any number of arrays can be analyzed on also very limited computer
#  systems.
# }
#
# \usage{
#   @usage doACNE,AffymetrixCelSet
#   @usage doACNE,default
# }
#
# \arguments{
#  \item{csR, dataSet}{An @see "AffymetrixCelSet" (or the name of an @see "AffymetrixCelSet").}
#  \item{fln}{If @TRUE, CRMAv2-style PCR fragment-length normalization is performed, otherwise not.}
#  \item{...}{Additional arguments used to set up @see "AffymetrixCelSet" (when argument \code{dataSet} is specified).}
#  \item{verbose}{See @see "Verbose".}
# }
#
# \value{
#   Returns a named @list of @see "aroma.core::AromaUnitTotalCnBinarySet"
#   and @see "aroma.core::AromaUnitFracBCnBinarySet" .
# }
#
# \references{
#  [1] @include "../incl/OrtizM_etal_2010.Rd" \cr
# }
#
# @author "HB"
#*/###########################################################################
setMethodS3("doACNE", "AffymetrixCelSet", function(csR, ..., fln=FALSE, verbose=FALSE) {
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

  verbose && cat(verbose, "Data set");
  verbose && print(verbose, csR);

  verbose && enter(verbose, "ACNE/CRMAv2/Allelic crosstalk calibration");
  acc <- AllelicCrosstalkCalibration(csR, model="CRMAv2");
  verbose && print(verbose, acc);
  csC <- process(acc, verbose=verbose);
  verbose && print(verbose, csC);
  verbose && exit(verbose);

  # Clean up
  csR <- acc <- NULL;

  verbose && enter(verbose, "ACNE/CRMAv2/Base position normalization");
  bpn <- BasePositionNormalization(csC, target="zero");
  verbose && print(verbose, bpn);
  csN <- process(bpn, verbose=verbose);
  verbose && print(verbose, csN);
  verbose && exit(verbose);

  # Clean up
  csC <- bpn <- NULL;

  verbose && enter(verbose, "ACNE/Probe summarization");
  plm <- NmfSnpPlm(csN, mergeStrands=TRUE);
  verbose && print(verbose, plm);
  if (length(findUnitsTodo(plm)) > 0L) {
    # Fit CN probes quickly (~5-10s/array + some overhead)
    units <- fitCnProbes(plm, verbose=verbose);
    verbose && str(verbose, units);
    # Fit remaining units, i.e. SNPs (~5-10min/array)
    units <- fit(plm, verbose=verbose);
    verbose && str(verbose, units);
    units <- NULL;
  }
  # Clean up
  csN <- NULL;
  ces <- getChipEffectSet(plm);
  verbose && print(verbose, ces);
  verbose && exit(verbose);

  # Clean up
  plm <- NULL;


  # PCR fragment-length normalization?
  if (fln) {
    verbose && enter(verbose, "ACNE/CRMAv2/PCR fragment-length normalization");
    fln <- FragmentLengthNormalization(ces, target="zero");
    verbose && print(verbose, fln);
    cesN <- process(fln, verbose=verbose);
    verbose && print(verbose, cesN);
    verbose && exit(verbose);

    # Clean up
    fln <- ces <- NULL;
  } else {
    cesN <- ces;
  }

  verbose && enter(verbose, "ACNE/Export to technology-independent data files");
  res <- exportTotalAndFracB(cesN, verbose=verbose);
  verbose && print(verbose, res);
  verbose && exit(verbose);

  # Clean up
  cesN <- NULL;

  verbose && exit(verbose);

  res;
}) # doACNE()


setMethodS3("doACNE", "default", function(dataSet, ..., verbose=FALSE) {
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
  csR <- NULL;

  verbose && exit(verbose);

  res;
}) # doACNE()


############################################################################
# HISTORY:
# 2013-10-17
# o CLEANUP: Removed all explicit calls to gc().
# o CLEANUP: Dropped argument 'ram' to fit() of doACNE().
# o Turned doACNE() for character into a default method.
# o Created from doCRMAv1() in aroma.affymetrix.
############################################################################
