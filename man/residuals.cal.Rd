\name{residuals.cal}
\alias{residuals.cal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Residuals of calibration curves }
\description{
  Extract residuals of all fitted calibration models.
}
\usage{
\method{residuals}{cal}(object, ...)
}
\arguments{
  \item{object}{ an object inheriting from 'cal' ('lmcal' or 'nlscal') }
  \item{\dots}{ additional arguments, currently ignored }
}
\value{
	A data frame, containing residuals of all models with their respective names
}
\author{ Lukasz Komsta }
\seealso{ \code{\link{lmcal}}, \code{\link{nlscal}} }
\examples{
set.seed(1234)
x=rep(1:8,5)
y=jitter(sqrt(x))
fit=lmcal(x,y)
residuals(fit)
boxplot(residuals(fit))
}
\keyword{models}
