###########################################################################/** 
# @set "class=SnpNmfFit"
# @RdocMethod plot
#
# @title "Generates a multi-panel plot summarizing the NMF SNP fit"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#  \item{lim, cnLim, epsLim}{The plot ranges for the probe data, 
#     the CN estimates, and the probe-affinity estimates.}
#  \item{main}{A @character string to be the main title of the plot.}
#  \item{...}{Not used.}
# }
#
# \value{
#   Return nothing.
# }
#
# \seealso{
#   See @see "fitSnpNmfArray".
# }
#
# @keyword internal
#*/###########################################################################
setMethodS3("plot", "SnpNmfFit", function(x, lim=c(0,2^16), cnLim=c(0,4), epsLim=c(-1,1)*2^12, main=NULL, ...) {
  # To please R CMD check
  this <- x;

  Y <- fit$Y;
  W <- fit$W;
  H <- fit$H;

  Vest <- W %*% H;
  Yest <- snpMatrixToArray(Vest);
str(Y)
str(Yest)
  E <- Y - Yest;

  layout(matrix(1:4, ncol=2, byrow=TRUE));
  par(mar=c(3.5,3.5,4.5,0.5)+0.1, mgp=c(2.1,0.6,0));

  xlab <- expression(y[A]);
  ylab <- expression(y[B]);
  plot(NA, xlim=lim, ylim=lim, xlab=xlab, ylab=ylab);
  abline(a=0, b=1, lty=3);
  title(main="Probe pair signals");
  stext(side=3, pos=1, sprintf("Number of probe pairs: %d*%d=%d", dim(Y)[3], dim(Y)[1], dim(Y)[3]*dim(Y)[1]))
  d <- apply(Y, MARGIN=3, FUN=points);

  xlab <- expression(C[A]);
  ylab <- expression(C[B]);
  plot(NA, xlim=cnLim, ylim=cnLim, xlab=xlab, ylab=ylab);
  abline(a=0, b=1, lty=3);
  lines(x=c(0,2), y=c(2,0), lty=3);
  title(main="ASCN estimates");
  stext(side=3, pos=1, sprintf("Number of arrays: %d", dim(Y)[3]));
  points(t(H));

  xlab <- expression(phi[A]);
  ylab <- expression(phi[B]);
  plot(NA, xlim=lim, ylim=lim, xlab=xlab, ylab=ylab);
  abline(a=0, b=1, lty=3);
  title(main="AS probe affinity estimates");
  stext(side=3, pos=1, sprintf("Number of affinities: 2*%d=%d", dim(Y)[1], nrow(W)));
  col <- matrix(c("red", "blue"), nrow=nrow(W)/2, ncol=2, byrow=TRUE);
  legend("topright", pch=par("pch"), col=col[1,], c("PMA", "PMB"), cex=0.8, bg="white");
  points(W, col=col);
  
  xlab <- expression(epsilon[A]);
  ylab <- expression(epsilon[B]);
  plot(NA, xlim=epsLim, ylim=epsLim, xlab=xlab, ylab=ylab);
  abline(a=0, b=1, lty=3);
  title(main="AS errors");
  stext(side=3, pos=1, sprintf("Number of error pairs: %d*%d=%d", dim(E)[3], dim(E)[1], dim(E)[3]*dim(E)[1]));
  d <- apply(E, MARGIN=3, FUN=points);

  title(main=main, outer=TRUE, line=-1)
}) # plot()


############################################################################
# HISTORY:
# 2009-03-25 [HB]
# o Created.
############################################################################
