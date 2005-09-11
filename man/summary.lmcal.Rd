\name{summary.lmcal, summary.nlscal}
\alias{summary.lmcal}
\alias{summary.nlscal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Summarizing fitted calibration curves }
\description{

	A 'summary' class for 'lmcal' and 'nlscal' objects.

}
\usage{
summary.lmcal(object, sort.models = FALSE, ...)
summary.nlscal(object, sort.models = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{ an object of class 'lmcal' or 'nlscal' }
  \item{sort.models}{ should the tables be sorted by models (TRUE) or variables (FALSE). }
  \item{\dots}{ additional arguments, currently ignored.}
}
\details{

	The function performs summarizing of fitted calibration models and produces several
	tables (see below). The are printed in appropriate form, and their list is returned
	invisibly.
}
\value{
	A list, consisting of following items:

	\item{coefficients}{Estimated coefficients, their standard error, significance (t) and p-value}
	\item{residuals}{Quantiles of residuals and Shapiro-Wilk test of their normality}
	\item{variances}{Quantiles of variances (without transform, with log-log, and with Box-Cox on y)
		ond Bartlett test for therir heteroscedascity. Calculated only, if there are at least
		2 replicates for each x}
	\item{fit}{R-squared, adjusted R-squared, AIC, residual standard error, sum of squared residuals,
		sum of pure error and Lack-of-Fit ANOVA test}
	\item{sensitivity}{sensitivity, limit of detection and quantitation, autocorrelation of residuals,
		Durbin-Watson test for autocorrelation} 
}
\author{ Lukasz Komsta, with portion by Achim Zeileis (from \code{dwtest()}) }
\note{ 

	The p-value of Durbin-Watson statistic is *only* approximated using normal
	transform algorhitm! This is not critical criterion and *always* residual plot
	should be visually examined.

	Some of values given above are not computed for 'nlscal' models.

}

\seealso{ \code{\link{lmcal}}, \code{\link{nlscal}} }
\examples{
set.seed(1234)
x=rep(1:8,5)
y=jitter(sqrt(x))
fit=lmcal(x,y)
fit
summary(fit)
}
\keyword{models}
