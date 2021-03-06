dS1_lin2 <- function(theta, y, model = "linAR1", cpow = 1)
{
  if(model == "linAR1woI")
  {
    res <- resARMod_lin2(c(0, theta), y)
    r1 <- res[seq(1, length(res), 2)]
    r2 <- res[seq(2, length(res), 2)]
    m <- min(c(length(r1), length(r2)))
    r1 <- r1[1:m]
    r2 <- r2[1:m]
    InD <- (r1 > 0) * (r2 < 0) + (r1 < 0) * (r2 > 0)# + (1 - (r1 != 0)*(r2 != 0))
    depth <- 1 / (m) * sum(InD)
  }
  else
  {  
  res <- switch(model, 
    "linAR1" = 
  {  
  resARMod_lin2(c(theta[1], theta[2]), y)
  },
    "nlinAR1" = 
  {
  resARMod_nlin1(c(theta[1], theta[2]), y)
  },
  "linAR2" = 
  {
  resARMod_linar2(c(theta[1], theta[2]), y)
  },
  "linARc" = 
  {
    y1 <- y[-length(y)]
    y2 <- y[-1]
    y2 - theta[1] - theta[2] * y1^cpow
  },
  stop("Enter valid model!")
  )
  r1 <- res[seq(1, length(res), 3)]
  r2 <- res[seq(2, length(res), 3)]
  r3 <- res[seq(3, length(res), 3)]
  m <- min(c(length(r1), length(r2), length(r3)))
  r1 <- r1[1:m]
  r2 <- r2[1:m]
  r3 <- r3[1:m]
  InD <- (r1 > 0) * (r2 < 0) * (r3 > 0) + (r1 < 0) * (r2 > 0) * (r3 < 0) #+ (1 - (r1 != 0) * (r2 != 0) * (r3 != 0))
  depth <- 1 / (m) * sum(InD)
  }
  
  return(depth)
  
}