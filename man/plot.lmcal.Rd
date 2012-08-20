\name{plot.lmcal, plot.nlscal}
\alias{plot.lmcal}
\alias{plot.nlscal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Calibration plots }
\description{
  Plot various plots commonly used to illustrate callibration.
}
\usage{
\method{plot}{lmcal}(x, type = c("curve", "residuals", "chronologic", "qqplot", "cook",
  "optimization"), trend = TRUE, confidence = TRUE, prediction = TRUE, 
  lines = c(1, 2, 3, 4), colors = c(1, 1, 1, 1, 1), xlab = NULL, ylab = NULL, ...)
\method{plot}{nlscal}(x, type = c("curve", "residuals", "chronologic", "qqplot"),
  trend = TRUE, lines = c(1, 2, 3, 4), colors = c(1, 1, 1, 1, 1), xlab = NULL, 
  ylab = NULL, ...)
}
\arguments{
  \item{x}{ An object of 'lmcal' or 'nlscal' class, respectively }
  \item{type}{ Type of plots: \code{curve} - calibration plots, \code{residuals} 
	- residuals vs. x values (common residual plot), \code{chronologic}
	- residuals in chronologic order (for autocorrelation detection),
	\code{qqplot} - quantile-quantile plots of residuals,
	\code{cook} - cook's distances, \code{optimization} - plots of 
	weighting and Box-Cox optimization
	}
  \item{trend}{ Logical: should be the trend of residuals marked (obtained by 'loess') }
  \item{confidence}{ Logical: if the confidence interval should be plotted }
  \item{prediction}{ Logical: if the prediction interval should be plotted }
  \item{lines}{ Line types of the plot }
  \item{colors}{ Colors of the plot }
  \item{xlab}{ Label of x }
  \item{ylab}{ Label of y }
  \item{\dots}{ Additional arguments, currently ignored }
}
\author{ Lukasz Komsta }
\examples{
x = rep(1:10,5)
y = jitter(sqrt(x))
fit = lmcal(x,y)
par(mfrow=c(2,2))
plot(fit,type="curve")
plot(fit,type="residuals")
plot(fit,type="optimization")
par(mfrow=c(1,1))
# Low level plotting, useful for customizing plot!
plot(x,y)
lines(fit$graph$grid,fit$graph$fitted$p1,lty=2)
lines(fit$graph$grid,fit$graph$fitted$p2,lty=2)
}
\keyword{hplot}
