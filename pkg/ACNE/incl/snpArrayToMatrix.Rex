Y <- matrix(rnorm(200), nrow=20, ncol=10)
str(Y)

V <- snpMatrixToArray(Y)
str(V)

Y2 <- snpArrayToMatrix(V)
str(Y2)

stopifnot(identical(Y2, Y))

