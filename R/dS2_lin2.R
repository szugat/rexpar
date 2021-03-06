dS2_lin2 <- function(theta, res, y, model = c("linAR1", "linAR1woI", "nlinAR1", "linAR2", "linARc"), cpow = 1) 
  {
  model <- match.arg(model)
  
  if (model == "linAR1woI") {
    if (missing(res)) {
      res <- rexpar::resARMod_lin2(c(0, theta), y)
    }
    r1 <- res[seq(1, floor(length(res) / 2), 1)]
    r2 <- res[seq(floor(length(res) / 2) + 1, length(res), 1)]
    m <- min(c(length(r1), length(r2)))
    r1 <- r1[1:m]
    r2 <- r2[m:1]
    InD <- (r1 > 0) * (r2 < 0) + (r1 < 0) * (r2 > 0) #-(r1==0)*(r2==0)
    depth <- 1 / (m) * sum(InD)
    return(depth)
  } 
  else {
    if (missing(res)) 
      {
      res <- switch(model, 
        "linAR1" = 
          {  
          rexpar::resARMod_lin2(c(theta[1], theta[2]), y)
          },
      "nlinAR1" =
        {
        rexpar::resARMod_nlin1(c(theta[1], theta[2]), y)
        },
      "linAR2" = 
        {
        rexpar::resARMod_linar2(c(theta[1], theta[2]), y)
        },
      "linARc" = 
        {
        y1 <- y[-length(y)]
        y2 <- y[-1]
        res <- y2 - theta[1] - theta[2] * y1^cpow
        },
        stop("Enter a valid model!")
      )
      }
    r1 <- res[seq(1, floor((length(res) - 1) / 2), 1)]
    r2 <- rep(res[floor((length(res) + 1) / 2)], floor((length(res) - 1) / 2))
    r3 <- res[seq((length(res) - floor((length(res) - 1) / 2) + 1), length(res), 1)]
    m <- min(c(length(r1), length(r2), length(r3)))
    r1 <- r1[1:m]
    r2 <- r2[1:m]
    r3 <- r3[m:1]
    InD <- (r1 > 0) * (r2 < 0) * (r3 > 0) + (r1 < 0) * (r2 > 0) * (r3 < 0) #+ (1 - (r1 != 0) * (r2 != 0) * (r3 !=0 ))
    depth <- 1 / (m) * sum(InD)
    return(depth)
    }

}