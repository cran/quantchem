\name{predict.lmcal, predict.nlscal}
\alias{predict.lmcal}
\alias{predict.nlscal}
\title{ Inverse predict concentration from given responses }
\description{
  Inverse predict concentration from responses, using all fitted
  calibration models.
}
\usage{
\method{predict}{lmcal}(object, dataset, conf.int = 0.95, ...)
\method{predict}{nlscal}(object, dataset, ...)
}
\arguments{
  \item{object}{ an object of class 'lmcal' or 'nlscal', respectively }
  \item{dataset}{ a vector of responses }
  \item{conf.int}{ confidence intercal (only for lmcal)}
  \item{\dots}{ additional arguments, currently ignored }
}
\details{
  For linear models, the concentrations are calculated by \code{inverse.predict()}, which
  calls \code{polyroot()} on modified polynomial coefficients. For nonlinear models,
  concentrations are calculated with appropriate 'inverse' formulas.
}
\value{
	A list containing following elements. Each element is a list of concentration vectors,
        calculated from a model, with name referring to the model.
	\item{fitted}{Concentrations calculated by fitted model}
	\item{upper}{Upper limit of confidence interval of inverse prediction}
	\item{lower}{Lower limit of confidence interval of inverse prediction}
}
\author{ Lukasz Komsta}
\note{ The confidence interval for prediction is calculated by taking standard error of
	prediction and dividing it by slope of calibration curve (estimated by \code{derivative})
	Then, proper confidence interval is constructed using t statistic.
}
\seealso{ \code{\link{lmcal}}, \code{\link{nlscal}} }
\examples{
set.seed(1234)
x=rep(1:10,10)
y=jitter(sqrt(x))
fit=lmcal(x,y)
predict(fit,rnorm(10,mean=2,sd=0.1))
}
\keyword{models}
