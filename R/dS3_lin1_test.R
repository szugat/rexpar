dS3_lin1_test <- function(thetaN, alpha, y, exact = FALSE)
{
  dS3 <- rexpar::dS3_lin2(theta = thetaN, y = y, model = "linAR1woI")
  NdS3 <- sqrt((length(y) - 1) - 1) * (dS3 - 1 / 2) / sqrt(1 / 4)
  if(!exact)
  {
  deci <- (NdS3 < qnorm(alpha))
  }
  if(exact)
  {  
    deci <- ((length(y) - 2) * dS3 < qbinom(alpha, size = (length(y) - 2), prob = 1 / 2))
  }
  list(TS = NdS3, phi = deci)
}