\name{anova.lmcal, anova.nlscal}
\alias{anova.lmcal}
\alias{anova.nlscal}
\title{ ANOVA tests for calibration models }
\description{

 This function performs ANOVA tests between fitted calibration models.

}
\usage{
anova.lmcal(object, ...)
anova.nlscal(object, ...)
}
\arguments{
  \item{object}{ an object of class 'lmcal' or 'nlscal' }
  \item{\dots}{ additional arguments (ignored) }
}
\details{

 For 'lmcal' models this function performs four tests: two ANOVAs
 between linear and quadratic model, without and with log-log transform
 (first is mentioned in literature as Mandel's fitting test), and
 two ANOVAs comparing four polynomial models, weighted and unweighted.

 For 'nlscal' models two ANOVAs are performed - between asymptotic
 models without and with intercept term, and between three and four
 parameter logistic models.

}
\value{
  A list of 'anova' objects:
  \item{mandel}{The test between linear and quadratic fit}
  \item{logmandel}{The same test, between two log-log models}
  \item{table}{The test between linear, quadratic, cubical and
	4th order models without weighting}
  \item{wtable}{The test between linear, quadratic, cubical and
	4th order models with weighting}
}
\author{ Lukasz Komsta }
\note{ The result is printed in readable form, and 
	returned via \code{invisible()}. }
\seealso{ \code{\link{lmcal}}, \code{\link{nlscal}}}
\examples{
data(nitrate)
attach(nitrate)
fit = lmcal(conc,area)
anova(fit)
fit2 = nlscal(conc,area)
anova(fit2)
}
\keyword{models}
