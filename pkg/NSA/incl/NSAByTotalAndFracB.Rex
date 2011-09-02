library("NSA");
library("R.utils");

# Load example (theta,fracB) signals
path <- system.file("exData", package="NSA"); 
data <- loadObject("TotalAndFracBdata_chr1smp1.Rbin", path=path);

# Find normal regions from (total,fracB)
fit <- NSAByTotalAndFracB(data, chromosome=1, verbose=-10);

normalReg <- fit[,1];

# plot the normal regions
threshold <- .135;
plot(normalReg>.135)