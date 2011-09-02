library("NSA");
library("R.utils");

# Load example (theta,fracB) signals
path <- system.file("exData", package="NSA"); 
references <- loadObject("SnpsNormalization_References.Rbin", path=path);
total <- loadObject("SnpsNormalization_Total.Rbin", path=path);
# Find normal regions from (total,fracB)
dataN <- snpsNByTotalAndFracB(total, references=references, verbose=-10);

# plot a chunk of CN from sample 3 
subplots(2, ncol=1);
plot(total[,3], cex=.3, pch=16, ylim=c(0,5), xlab="", ylab="Initial CN");
title(sprintf("CN - Initial"));
plot(dataN[,3], cex=.3, pch=16, ylim=c(0,5), xlab="", ylab="Normalized CN");
title(sprintf("CN - Normalized by SNPs"));


