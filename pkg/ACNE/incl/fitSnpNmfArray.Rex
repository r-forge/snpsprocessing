filenames <- sprintf("V%d.Rbin", 1:6)
pathnames <- system.file("extData", filenames, package="ACNE")

for (ii in seq(along=pathnames)) {
  V <- loadToEnv(pathnames[ii])$V
  str(V)
  Y <- snpMatrixToArray(V)
  str(Y)
  fit <- fitSnpNmfArray(Y)
  str(fit)
  plot(fit, lim=c(0,2^14), main=filenames[ii])
}
