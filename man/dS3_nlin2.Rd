\name{dS3_nlin2}
\alias{dS3_nlin2}
\title{
dS3 for the non-linear AR(1) model with intercept
}
\description{
This function calculates a simplified version of simplicial depth for explosive AR(1) 
processes,  when overlapping residuals  are evaluated. Thereby
the parameter theta and the process y are fixed. The assumed model is given by 
\deqn{Y_n = Y_{n-1}+\theta_1 *Y_{n-1}^{\theta_2}  + \theta_0 +E_n,}
whereby \eqn{E_n} i.i.d. errors with \eqn{med(E_n) = 0}.
}
\usage{
dS3_nlin2(theta, y)
}
\arguments{
  \item{theta}{
\eqn{\theta = (\theta_1,\theta_2,\theta_0)}, parameter vector to evaluate dS1 in. 
}
  \item{y}{
\eqn{y = (y_0,...,y_N)}, oberserved process to evaluate dS1 in. 
}
}
\details{
The theoretical details can be found in Kustosz, Mueller and Wendler (2016). The computational 
details are in Kustosz (2016).
}
\value{
Result is a real number which gives the depth of theta based on the obervation y
}
\references{
Kustosz, C. (2016). Depth based estimators and tests for
autoregressive processes with application. Ph. D. thesis. TU Dortmund.\cr 
\cr
Kustosz C., Mueller Ch. H. and Wendler M. (2016). Simplified Simplicial Depth for Regression and
Autoregressive Growth Processes. Journal of Statistical Planning and Inference. In press.\cr
\cr
}
\author{
Kustosz, Christoph
}
\note{
This expression is a simplification of dS, which is the full simplicial depth for explosive AR(1) processes
}


\seealso{
\code{\link{resARMod_lin2}}, \code{\link{dS_lin2}},\code{\link{dS1_lin2}}, \code{\link{dS2_lin2}}, \code{\link{dS3_lin2}}
}
\examples{
y <- RandomARMod_nlin2(nobs = 100, intercept = 0, arp = 0.2, power = 1.01, start = 15, cont = "0")
theta <- c(0.2, 1.01, 0)
dS3_nlin2(theta, y)
dS3_nlin2(theta+0.1, y)
}


