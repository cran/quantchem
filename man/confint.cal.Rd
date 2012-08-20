\name{confint.cal}
\alias{confint.cal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Confidence intervals for calibration curve parameters }
\description{

     Computes confidence intervals for parameters in a calibration
     fitted model.  

}
\usage{
\method{confint}{cal}(object, parm, level = 0.95, sort.models = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{ an object of class 'lmcal' or 'nlscal' (inheriting from 'cal')} 
  \item{parm}{ ignored in this case }
  \item{level}{ confidence level of intervals }
  \item{sort.models}{ should the intervals be sorted by models, or variable names }
  \item{\dots}{ additional arguments (ignored) }
}
\value{

  A matrix containing upper and lower bounds for confidence interval is returned.

}
\author{ Lukasz Komsta }
\seealso{ \code{\link{lmcal}}, \code{\link{nlscal}}}
\examples{
data(nitrate)
attach(nitrate)
fit = lmcal(conc,area)
confint(fit)
}
\keyword{models}
