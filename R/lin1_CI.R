lin1_CI <- function(y, level, plots = FALSE, notion = "dS", eps = NULL)
{
  if(is.null(eps))
  {
  cands <- lin1_theta(y)$t1
  }
  else
  {
  cands <- lin1_theta_eps(y, eps)$t1
  }
  
  TS <- switch(notion, 
        "dS1" =
        {
          unlist(lapply(cands, dS1_lin1_test, y = y, alpha = (1 - level)))
        },
        "dS2" = 
        {
          unlist(lapply(cands, dS2_lin1_test, y = y, alpha = (1 - level)))
        },
        "dS3" =
        {
          unlist(lapply(cands, dS3_lin1_test, y = y, alpha = (1 - level)))
        },
        "dS" =
        {
          unlist(lapply(cands, dS_lin1_test, y = y, alpha = (1 - level)))
        },
        stop("Usa a valid notion!")
  )
  inCIs <- as.vector(TS[seq(2, length(TS), 2)])
  
  if(plots)
  {
    plot(cands,TS)
  }
  list(par = cands, inCI = inCIs)
}