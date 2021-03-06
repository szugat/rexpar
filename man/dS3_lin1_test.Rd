\name{dS3_lin1_test}
\alias{dS3_lin1_test}
\title{Test based on dS1 for explosive AR(1) processes without intercept
}
\description{
  The function evaluates the asymptotic test based on \eqn{d_S^3} proposed in Kustosz, Mueller and Wendler (2014). It returns the test statistic and the decision. The main model is given by \deqn{Y_n = \theta_1 Y_{n-1} + E_n} with \eqn{med(E_n)=0}.
}
\usage{
  dS3_lin1_test(thetaN, alpha, y, exact)
}
\arguments{
  \item{thetaN}{
    Parameter defining the Null hypothesis \eqn{H0: \theta = \theta^0}. Thereby \eqn{\theta^0 = \theta_1^0}  is as defined by the model. 
  }
  
  \item{alpha}{
    Value in (0,1) defining the level of the test.  
  }
  
  \item{y}{
    Observed series \eqn{y=(y_0,...,y_N)} for which the parameter test has to be executed. 
  }
      \item{exact}{
    Switch to decide, weather the exact distribution \code{exact=TRUE} for the approximate normal distribution \code{exact=FALSE} should be used for the calculation of critical values. 
  }
  
}
\details{
The theoretical details can be found in Kustosz, Mueller and Wendler (2016). The computational 
details are in Kustosz (2016).
}
\value{
  
  \item{TS}{Returns the value of the rescaled and centred test statistic.}
  \item{phi}{Retuns the test decision, phi = 1 means reject H0, and phi = 0 means do not reject H0.}
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

  \seealso{
    \code{\link{dS3_lin2}}
  }
\examples{
  y <- RandomARMod_lin2(1000, 0, 1.01, 15, "0")
  dS3_lin1_test(1.01, 0.05, y)
  dS3_lin1_test(1.11, 0.05, y)
}

