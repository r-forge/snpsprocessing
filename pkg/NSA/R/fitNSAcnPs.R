###########################################################################/**
# @set "class=matrix"
# @RdocMethod fitNSAcnPs
# @alias fitNSAcnPs
# 
# @title "Infering the LH values of the CN probes"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#  \item{data}{An JxI @numeric @array, where J is the number of SNPs,
#          and I is the number of samples.}
#  \item{...}{Additional arguments passed to internal 
#             NSA();}
# }
#
# \value{
#   Returns an JxI @numeric @array.
# }                                   
#
#
#*/###########################################################################

setMethodS3("fitNSAcnPs", "matrix", function(data,...) {
  
  pos <- c(1:(dim(data)[1]));
  
  nSNPs <- dim(data)[1];
  Salida <- approxfun(pos,data[,1])(pos)
  
  #There can be some NA in the extremes
  lastSNPsBegin <- which(is.na(Salida[1:(nSNPs/2)]));
  if (length(lastSNPsBegin) >0)
    Salida[lastSNPsBegin] <- Salida[max(lastSNPsBegin)+1];
  
  lastSNPsEnd <- which(is.na(Salida[1:nSNPs]));
  if (length(lastSNPsEnd) >0)
    Salida[lastSNPsEnd] <- Salida[min(lastSNPsEnd)-1];
    
  data[,1] <- Salida;
  return(data);
}, private=TRUE)
############################################################################
# HISTORY:
# 2011-05-13 [MO]
# o Created.
############################################################################