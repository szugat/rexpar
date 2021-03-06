lin2_CI_cl <- function(y, level, plots = FALSE, notion = "dS1", cluster,eps = 1e-19)
{
  cands <- lin2_theta_f(y)
  cands0 <- cbind(cands$t1,cands$t2) + eps
  #cands1<-cbind(cands$t1,cands$t2) + eps
  #cands2<-cbind(cands$t1,cands$t2) + eps
  #cands3<-cbind(cands$t1,cands$t2) - eps
  #cands4<-cbind(cands$t1,cands$t2) - eps
  #cands5<-cbind(cands$t1+eps,cands$t2-eps)
  #cands6<-cbind(cands$t1-eps,cands$t2+eps)
  #cands<-rbind(cands0,cands1,cands2,cands3,cands4,cands5,cands6)
  cands <- cands0
  
  TS <- switch(notion, 
      "dS1" = 
        {
          unlist(parApply(cluster, cands, 1, dS1_lin2_test, y = y, alpha = (1 - level)))
        },
      "dS2" = 
        {
          unlist(parApply(cluster, cands, 1, dS2_lin2_test, y = y, alpha = (1 - level)))
        },
      "dS3" =
        {
          unlist(parApply(cluster, cands, 1, dS3_lin2_test, y = y, alpha = (1 - level)))
        },
      "dS_pre" = 
        {
          TS_temp <- unlist(parApply(cluster, cands, 1, dS1_lin2_test, y = y, alpha = (1 - level)))
          inCIs_temp <- as.vector(TS_temp[seq(2, length(TS_temp), 2)])
          cands <- cands[inCIs_temp==0, ]
          unlist(parApply(cluster, cands, 1, dS_lin2_test, y = y, alpha = (1 - level), ncores = 1))
        },
      "dS" =
        {
          unlist(parApply(cluster,cands,1,dS_lin2_test,y=y,alpha=(1-level),ncores=1))
        },
      stop("Insert a valid notion!")
  )
  
  inCIs <- as.vector(TS[seq(2, length(TS), 2)])
  
  if(plots)
  {
    a <- which(inCIs == 0)
    plot(cands)
    points(cands[a,], col = 2)
    convex_hull_plot(cands[a, 1], cands[a, 2], col = 2)
  }
  list(par = cands, inCI = inCIs)
}