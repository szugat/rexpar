exact_lim_dS3nlin <- function(N, Reps, plot = FALSE)
{
dSs <- numeric(Reps)
for(i in 1:Reps)
{
  res <- (rbinom((N - 1), size = 1, prob = 1 / 2) - 1 / 2)
  r1 <-res[seq(1, length(res) - 3, 1)]
  r2 <-res[seq(2, length(res) - 2, 1)]
  r3 <-res[seq(3, length(res) - 1, 1)]
  r4 <-res[seq(4, length(res), 1)]
  m <-min(c(length(r1), length(r2), length(r3), length(r4)))
  r1 <-r1[1:m]
  r2 <-r2[1:m]
  r3 <-r3[1:m]
  r4 <-r4[1:m]
  InD <-(r1 > 0) * (r2 < 0) * (r3 > 0) * (r4 < 0) + (r1 < 0) * (r2 > 0) * (r3 < 0) * (r4 > 0) #+ (1 - (r1 != 0) * (r2 != 0) * (r3 != 0) * (r4 != 0))
  dSs[i] <- sum(InD)
}
if(plot)
{
par(mfrow=c(1, 1))
h <- hist(dSs, plot = FALSE, breaks = seq(min(dSs) - 1, max(dSs), 1))
plot(h$mids, h$counts / Reps, type = "h", xlim = c(min(dSs), max(dSs)), ylim = c(0, 0.05), xlab = "value", ylab = "rel. freq.")
rr <- rbinom(Reps, size = floor(N - 4), prob = (1 / 8))
hh <- hist(rr, plot = FALSE, breaks = seq(min(rr) - 1, max(rr), 1))
lines(hh$mids + 0.4, hh$counts / Reps, type = "h", col = 2)
}
return(dSs)
}