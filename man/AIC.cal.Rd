\name{AIC.cal}
\alias{AIC.cal}
\title{ Akaike's An Information Criterion for calibration models}
\description{

This function computes a table of AIC values for given object
inheriting from class 'cal' ('lmcal' and 'nlscal').

}
\usage{
\method{AIC}{cal}(object, ..., k = 2)
}
\arguments{
  \item{object}{ a fitted calibration model of class 'lmcal' or 'nlscal'}
  \item{\dots}{ additional arguments (ignored) }
  \item{k}{ the k parameter, for more information see \code{\link{AIC}} }
}
\value{

  A matrix with AIC values for each fitted model.

}
\author{ Lukasz Komsta }
\note{ The AIC values should not be directly compared, when models differ
	in response (for example log-log transformed and fitted with no
	transformation. }

\seealso{ \code{\link{lmcal}}, \code{\link{nlscal}}}
\examples{
data(ibuprofen)
attach(ibuprofen)
fit = lmcal(conc,area)
AIC(fit)
fit = nlscal(conc,area)
AIC(fit)
}
\keyword{models}%
