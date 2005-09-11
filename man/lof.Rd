\name{lof}
\alias{lof}
\title{ Lack-of-Fit testing of calibration models }
\description{
 Performs 'a priori' ANOVA "Lack-of-Fit" tests on fitted calibration
 models.
}
\usage{
lof(obj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{ An object inheriting from 'cal' (fitted by 'lmcal'
	or 'nlscal') }
}
\details{
 This function performs lack-of-fit test on regression residuals. This test
 assumes, that overall residual error should not be significantly larger than
 error within groups with the same x (replicates). It is called by 'summary'
 methods, but also can be called directly by user.
}
\value{
 A matrix containing sum of squared residuals, sum of pure error, F-statistic and
 corresponding p-value.
}
\references{ see \code{\link{lmcal}} }
\author{ Lukasz Komsta }
\note{ This test is possible to perform only with minimum 2 replicates of each x value. }

\seealso{ \code{\link{lmcal}}, \code{\link{nlscal}} }
\examples{
x = rep(1:10,10)
y = jitter(x)
fit = lmcal(x,y)
lof(fit)
}
\keyword{models}
